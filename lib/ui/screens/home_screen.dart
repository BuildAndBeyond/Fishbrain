import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/session_controller.dart';
import '../widgets/large_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionController = context.watch<SessionController>();
    final hasActive = sessionController.activeSession != null;

    return Scaffold(
      appBar: AppBar(title: const Text('Catchlog')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LargeButton(
              label: 'Neue Session starten',
              onPressed: () => Navigator.pushNamed(context, '/new_session'),
            ),
            const SizedBox(height: 12),
            LargeButton(
              label: 'Aktive Session fortsetzen',
              onPressed: hasActive
                  ? () => Navigator.pushNamed(context, '/session_live')
                  : null,
            ),
            const SizedBox(height: 12),
            LargeButton(
              label: 'Rigs',
              onPressed: () => Navigator.pushNamed(context, '/rigs'),
            ),
            const SizedBox(height: 12),
            LargeButton(
              label: 'Statistik',
              onPressed: () => Navigator.pushNamed(context, '/stats'),
            ),
            const SizedBox(height: 12),
            LargeButton(
              label: 'Einstellungen',
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
            if (sessionController.isLoading)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: LinearProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
