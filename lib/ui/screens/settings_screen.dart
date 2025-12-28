import 'package:flutter/material.dart';

import '../widgets/section_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Offline & Datenschutz', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('• Keine Werbung, kein Tracking'),
                Text('• Keine Standortdaten'),
                Text('• Daten bleiben auf dem Gerät'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
