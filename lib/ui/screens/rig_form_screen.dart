import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/rigs_controller.dart';
import '../../storage/app_database.dart';
import '../widgets/large_button.dart';
import '../widgets/section_card.dart';

class RigFormScreen extends StatefulWidget {
  const RigFormScreen({super.key});

  @override
  State<RigFormScreen> createState() => _RigFormScreenState();
}

class _RigFormScreenState extends State<RigFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  String _mode = 'Raubfisch';
  String _lureType = 'Gummifisch';
  String _leaderType = 'Stahl';
  String _rigType = 'Hair';
  String _hookSize = '2';
  String _baitType = 'Boilie';

  final _sizeController = TextEditingController();
  final _weightController = TextEditingController();
  final _leaderLengthController = TextEditingController();
  final _leadWeightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sizeController.dispose();
    _weightController.dispose();
    _leaderLengthController.dispose();
    _leadWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neues Rig')),
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
                    const Text('Mode', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _mode,
                      items: const [
                        DropdownMenuItem(value: 'Raubfisch', child: Text('Raubfisch')),
                        DropdownMenuItem(value: 'Karpfen', child: Text('Karpfen')),
                      ],
                      onChanged: (value) => setState(() => _mode = value ?? 'Raubfisch'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name (optional)'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              if (_mode == 'Raubfisch') _predatorFields(),
              if (_mode == 'Karpfen') _carpFields(),
              const SizedBox(height: 16),
              LargeButton(
                label: 'Rig speichern',
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  final rigsController = context.read<RigsController>();
                  if (_mode == 'Raubfisch') {
                    await rigsController.addRig(RigsCompanion.insert(
                      mode: _mode,
                      name: _nameController.text.isEmpty
                          ? const Value.absent()
                          : Value(_nameController.text.trim()),
                      lureType: Value(_lureType),
                      sizeCm: Value(double.parse(_sizeController.text)),
                      weightG: Value(double.parse(_weightController.text)),
                      leaderType: Value(_leaderType),
                    ));
                  } else {
                    await rigsController.addRig(RigsCompanion.insert(
                      mode: _mode,
                      name: _nameController.text.isEmpty
                          ? const Value.absent()
                          : Value(_nameController.text.trim()),
                      rigType: Value(_rigType),
                      hookSize: Value(_hookSize),
                      leaderLengthCm: Value(double.parse(_leaderLengthController.text)),
                      leadWeightG: Value(double.parse(_leadWeightController.text)),
                      baitType: Value(_baitType),
                    ));
                  }
                  if (!mounted) return;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _predatorFields() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Raubfisch Rig', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _lureType,
            decoration: const InputDecoration(labelText: 'Ködertyp'),
            items: const [
              DropdownMenuItem(value: 'Gummifisch', child: Text('Gummifisch')),
              DropdownMenuItem(value: 'Wobbler', child: Text('Wobbler')),
              DropdownMenuItem(value: 'Spinner', child: Text('Spinner')),
              DropdownMenuItem(value: 'Jig/Creature', child: Text('Jig/Creature')),
              DropdownMenuItem(value: 'Dropshot', child: Text('Dropshot')),
              DropdownMenuItem(value: 'Posenfischen', child: Text('Posenfischen')),
              DropdownMenuItem(value: 'Texas/Carolina', child: Text('Texas/Carolina')),
              DropdownMenuItem(value: 'Jerkbait', child: Text('Jerkbait')),
              DropdownMenuItem(value: 'Sonstiges', child: Text('Sonstiges')),
            ],
            onChanged: (value) => setState(() => _lureType = value ?? 'Gummifisch'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _sizeController,
            decoration: const InputDecoration(labelText: 'Größe (cm)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Pflichtfeld';
              return double.tryParse(value) == null ? 'Bitte Zahl eingeben' : null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _weightController,
            decoration: const InputDecoration(labelText: 'Gewicht (g)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Pflichtfeld';
              return double.tryParse(value) == null ? 'Bitte Zahl eingeben' : null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _leaderType,
            decoration: const InputDecoration(labelText: 'Vorfachtyp'),
            items: const [
              DropdownMenuItem(value: 'Stahl', child: Text('Stahl')),
              DropdownMenuItem(value: 'Fluoro', child: Text('Fluoro')),
              DropdownMenuItem(value: 'Mono', child: Text('Mono')),
            ],
            onChanged: (value) => setState(() => _leaderType = value ?? 'Stahl'),
          ),
        ],
      ),
    );
  }

  Widget _carpFields() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Karpfen Rig', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _rigType,
            decoration: const InputDecoration(labelText: 'Rigtyp'),
            items: const [
              DropdownMenuItem(value: 'Hair', child: Text('Hair')),
              DropdownMenuItem(value: 'KD', child: Text('KD')),
              DropdownMenuItem(value: 'D-Rig', child: Text('D-Rig')),
              DropdownMenuItem(value: 'Ronnie', child: Text('Ronnie')),
              DropdownMenuItem(value: 'Chod', child: Text('Chod')),
              DropdownMenuItem(value: 'Sonstiges', child: Text('Sonstiges')),
            ],
            onChanged: (value) => setState(() => _rigType = value ?? 'Hair'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _hookSize,
            decoration: const InputDecoration(labelText: 'Hakengröße'),
            items: const [
              DropdownMenuItem(value: '2', child: Text('2')),
              DropdownMenuItem(value: '4', child: Text('4')),
              DropdownMenuItem(value: '6', child: Text('6')),
              DropdownMenuItem(value: '8', child: Text('8')),
              DropdownMenuItem(value: '10', child: Text('10')),
            ],
            onChanged: (value) => setState(() => _hookSize = value ?? '2'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _leaderLengthController,
            decoration: const InputDecoration(labelText: 'Vorfachlänge (cm)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Pflichtfeld';
              return double.tryParse(value) == null ? 'Bitte Zahl eingeben' : null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _leadWeightController,
            decoration: const InputDecoration(labelText: 'Blei (g)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Pflichtfeld';
              return double.tryParse(value) == null ? 'Bitte Zahl eingeben' : null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _baitType,
            decoration: const InputDecoration(labelText: 'Ködertyp'),
            items: const [
              DropdownMenuItem(value: 'Boilie', child: Text('Boilie')),
              DropdownMenuItem(value: 'Pop-Up', child: Text('Pop-Up')),
              DropdownMenuItem(value: 'Wafter', child: Text('Wafter')),
              DropdownMenuItem(value: 'Mais', child: Text('Mais')),
              DropdownMenuItem(value: 'Tigernuss', child: Text('Tigernuss')),
              DropdownMenuItem(value: 'Sonstiges', child: Text('Sonstiges')),
            ],
            onChanged: (value) => setState(() => _baitType = value ?? 'Boilie'),
          ),
        ],
      ),
    );
  }
}
