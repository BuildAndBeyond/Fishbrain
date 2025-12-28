import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/rigs_controller.dart';
import '../widgets/large_button.dart';
import '../widgets/lure_icon.dart';

class RigsScreen extends StatefulWidget {
  const RigsScreen({super.key});

  @override
  State<RigsScreen> createState() => _RigsScreenState();
}

class _RigsScreenState extends State<RigsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<RigsController>().loadRigs());
  }

  @override
  Widget build(BuildContext context) {
    final rigsController = context.watch<RigsController>();
    final rigs = rigsController.rigs;

    return Scaffold(
      appBar: AppBar(title: const Text('Rigs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: rigs.isEmpty
                  ? const Center(child: Text('Noch keine Rigs gespeichert.'))
                  : ListView.separated(
                      itemCount: rigs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final rig = rigs[index];
                        return ListTile(
                          tileColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          leading: LureIcon(
                            mode: rig.mode,
                            lureType: rig.lureType,
                            baitType: rig.baitType,
                          ),
                          title: Text(rig.name ?? 'Rig #${rig.id}'),
                          subtitle: Text(rig.mode == 'Raubfisch'
                              ? '${rig.lureType ?? '-'} · ${rig.sizeCm ?? ''}cm · ${rig.weightG ?? ''}g'
                              : '${rig.rigType ?? '-'} · ${rig.baitType ?? '-'}'),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: rig.mode == 'Raubfisch' ? Colors.blueGrey : Colors.brown,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              rig.mode,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 12),
            LargeButton(
              label: 'Neues Rig',
              onPressed: () async {
                await Navigator.pushNamed(context, '/rig_form');
                if (!mounted) return;
                await context.read<RigsController>().loadRigs();
              },
            ),
          ],
        ),
      ),
    );
  }
}
