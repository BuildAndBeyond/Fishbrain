import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/rules_engine.dart';
import '../../models/recommendation.dart';
import '../../state/rigs_controller.dart';
import '../../state/session_controller.dart';
import '../../storage/app_database.dart';
import '../widgets/large_button.dart';
import '../widgets/section_card.dart';

class SessionLiveScreen extends StatelessWidget {
  const SessionLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionController = context.watch<SessionController>();
    final rigsController = context.watch<RigsController>();
    final session = sessionController.activeSession;

    if (session == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Session Live')),
        body: const Center(child: Text('Keine aktive Session.')),
      );
    }

    final recommendations = buildRecommendations(session);
    Rig? activeRig;
    for (final rig in rigsController.rigs) {
      if (rig.id == session.activeRigId) {
        activeRig = rig;
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Session Live')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktive Session',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text('${session.mode} · ${session.target} · ${session.waterType}'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...recommendations.map((rec) => _RecommendationCard(rec)).toList(),
          const SizedBox(height: 12),
          SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aktives Rig', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(activeRig == null ? 'Keins gewählt' : _rigLabel(activeRig)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          LargeButton(
            label: 'Biss',
            onPressed: () => sessionController.logBite(),
            color: Colors.teal.shade600,
          ),
          const SizedBox(height: 12),
          LargeButton(
            label: 'Fisch',
            onPressed: () => sessionController.logFish(),
            color: Colors.green.shade600,
          ),
          const SizedBox(height: 12),
          LargeButton(
            label: 'Rig wechseln',
            onPressed: () => _showRigPicker(context, rigsController, sessionController, session.mode),
            color: Colors.orange.shade600,
          ),
          const SizedBox(height: 12),
          LargeButton(
            label: 'Session beenden',
            onPressed: () => _showEndDialog(context, sessionController),
            color: Colors.red.shade600,
          ),
        ],
      ),
    );
  }

  String _rigLabel(Rig rig) {
    if (rig.mode == 'Raubfisch') {
      return '${rig.name ?? 'Rig #${rig.id}'} · ${rig.lureType ?? '-'} ${rig.sizeCm ?? ''}cm ${rig.weightG ?? ''}g';
    }
    return '${rig.name ?? 'Rig #${rig.id}'} · ${rig.rigType ?? '-'} · ${rig.baitType ?? '-'}';
  }

  Future<void> _showRigPicker(
    BuildContext context,
    RigsController rigsController,
    SessionController sessionController,
    String mode,
  ) async {
    await rigsController.loadRigs();
    final rigs = rigsController.rigs.where((rig) => rig.mode == mode).toList();

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      builder: (ctx) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Rig wählen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          if (rigs.isEmpty)
            const Text('Noch keine Rigs für diese Angelart. Erstelle eins im Rig-Menü.'),
          for (final rig in rigs)
            ListTile(
              title: Text(rig.name ?? 'Rig #${rig.id}'),
              subtitle: Text(rig.mode == 'Raubfisch'
                  ? '${rig.lureType ?? '-'} · ${rig.sizeCm ?? ''}cm · ${rig.weightG ?? ''}g'
                  : '${rig.rigType ?? '-'} · ${rig.baitType ?? '-'}'),
              onTap: () async {
                await sessionController.changeRig(rig.id);
                if (ctx.mounted) Navigator.pop(ctx);
              },
            ),
        ],
      ),
    );
  }

  Future<void> _showEndDialog(BuildContext context, SessionController controller) async {
    bool hadCatch = false;
    String rating = 'mittel';

    await showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Session beenden'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    value: hadCatch,
                    onChanged: (value) => setState(() => hadCatch = value),
                    title: const Text('Fang?'),
                  ),
                  const SizedBox(height: 8),
                  const Text('Bewertung'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      ChoiceChip(
                        label: const Text('👍 gut'),
                        selected: rating == 'gut',
                        onSelected: (_) => setState(() => rating = 'gut'),
                      ),
                      ChoiceChip(
                        label: const Text('😐 mittel'),
                        selected: rating == 'mittel',
                        onSelected: (_) => setState(() => rating = 'mittel'),
                      ),
                      ChoiceChip(
                        label: const Text('👎 schlecht'),
                        selected: rating == 'schlecht',
                        onSelected: (_) => setState(() => rating = 'schlecht'),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Abbrechen'),
                ),
                FilledButton(
                  onPressed: () async {
                    await controller.endSession(hadCatch: hadCatch, rating: rating);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                  child: const Text('Speichern'),
                ),
              ],
            );
          },
        );
      },
    );

    if (context.mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}

class _RecommendationCard extends StatelessWidget {
  final Recommendation recommendation;

  const _RecommendationCard(this.recommendation);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recommendation.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...recommendation.bullets.map(
              (bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• $bullet'),
              ),
            ),
            const Divider(height: 24),
            const Text('Warum?'),
            const SizedBox(height: 8),
            ...recommendation.reasons.map(
              (reason) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('– $reason'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
