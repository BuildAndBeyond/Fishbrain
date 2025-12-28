import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/session_controller.dart';
import '../widgets/large_button.dart';
import '../widgets/section_card.dart';

class NewSessionScreen extends StatefulWidget {
  const NewSessionScreen({super.key});

  @override
  State<NewSessionScreen> createState() => _NewSessionScreenState();
}

class _NewSessionScreenState extends State<NewSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  String _mode = 'Raubfisch';
  String _target = 'Hecht';
  String _water = 'See';

  List<String> get _targets => _mode == 'Raubfisch'
      ? ['Hecht', 'Zander', 'Barsch']
      : ['Karpfen'];

  @override
  Widget build(BuildContext context) {
    final sessionController = context.read<SessionController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Neue Session')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Session-Setup (unter 30 Sekunden)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _mode,
                      decoration: const InputDecoration(labelText: 'Angelart'),
                      items: const [
                        DropdownMenuItem(value: 'Raubfisch', child: Text('Raubfisch')),
                        DropdownMenuItem(value: 'Karpfen', child: Text('Karpfen')),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _mode = value;
                          _target = _targets.first;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _target,
                      decoration: const InputDecoration(labelText: 'Zielfisch'),
                      items: _targets
                          .map((target) => DropdownMenuItem(
                                value: target,
                                child: Text(target),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) setState(() => _target = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _water,
                      decoration: const InputDecoration(labelText: 'Gewässertyp'),
                      items: const [
                        DropdownMenuItem(value: 'See', child: Text('See')),
                        DropdownMenuItem(value: 'Fluss', child: Text('Fluss')),
                        DropdownMenuItem(value: 'Kanal', child: Text('Kanal')),
                      ],
                      onChanged: (value) {
                        if (value != null) setState(() => _water = value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              LargeButton(
                label: 'Session starten',
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  await sessionController.startSession(
                    mode: _mode,
                    target: _target,
                    waterType: _water,
                  );
                  if (!mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/session_live',
                    (route) => route.isFirst,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
