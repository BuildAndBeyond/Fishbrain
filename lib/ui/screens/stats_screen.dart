import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/stats_controller.dart';
import '../widgets/section_card.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<StatsController>().load());
  }

  @override
  Widget build(BuildContext context) {
    final statsController = context.watch<StatsController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Statistik')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Übersicht', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('Sessions gesamt: ${statsController.totalSessions}'),
                Text('Fänge gesamt: ${statsController.totalCatches}'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text('Erfolgsquote pro Rig', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (statsController.rigStats.isEmpty)
            const Text('Noch keine Daten für Rigs.'),
          for (final rigStat in statsController.rigStats)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${rigStat.name} (${rigStat.mode})'),
                    const SizedBox(height: 8),
                    Text('Einsätze: ${rigStat.uses}'),
                    Text('Fänge: ${rigStat.catches}'),
                    Text('Erfolgsquote: ${rigStat.successRate.toStringAsFixed(0)}%'),
                    if (rigStat.zeroCatchWarning)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Hinweis: Rig wurde oft genutzt, aber fing nichts.',
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
