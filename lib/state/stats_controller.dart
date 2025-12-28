import 'package:flutter/material.dart';

import '../models/rig_stats.dart';
import '../storage/app_database.dart';

class StatsController extends ChangeNotifier {
  final AppDatabase database;
  int totalSessions = 0;
  int totalCatches = 0;
  List<RigStats> rigStats = [];
  bool isLoading = false;

  StatsController(this.database);

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    totalSessions = await database.totalSessions();
    totalCatches = await database.totalCatches();
    final rigs = await database.getRigs();
    final stats = await database.customSelect(
      "SELECT rig_id as rigId, COUNT(DISTINCT session_id) AS uses, SUM(CASE WHEN type = 'fish' THEN 1 ELSE 0 END) AS catches FROM session_events WHERE rig_id IS NOT NULL GROUP BY rig_id",
    ).get();
    final usageMap = <int, Map<String, int>>{};
    for (final row in stats) {
      final rigId = row.data['rigId'] as int;
      usageMap[rigId] = {
        'uses': row.data['uses'] as int? ?? 0,
        'catches': row.data['catches'] as int? ?? 0,
      };
    }
    rigStats = rigs.map((rig) {
      final usage = usageMap[rig.id] ?? {'uses': 0, 'catches': 0};
      return RigStats(
        rigId: rig.id,
        name: rig.name ?? 'Rig #${rig.id}',
        mode: rig.mode,
        uses: usage['uses'] ?? 0,
        catches: usage['catches'] ?? 0,
      );
    }).toList();
    isLoading = false;
    notifyListeners();
  }
}
