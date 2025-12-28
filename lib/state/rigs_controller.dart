import 'package:flutter/material.dart';

import '../storage/app_database.dart';

class RigsController extends ChangeNotifier {
  final AppDatabase database;
  List<Rig> rigs = [];
  bool isLoading = false;

  RigsController(this.database);

  Future<void> loadRigs() async {
    isLoading = true;
    notifyListeners();
    rigs = await database.getRigs();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addRig(RigsCompanion rig) async {
    await database.createRig(rig);
    await loadRigs();
  }

  Future<void> removeRig(int id) async {
    await database.deleteRig(id);
    await loadRigs();
  }
}
