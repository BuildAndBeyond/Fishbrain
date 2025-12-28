import 'package:drift/drift.dart';

import 'database_connection.dart';
part 'app_database.g.dart';

class Rigs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get mode => text()();
  TextColumn get lureType => text().nullable()();
  RealColumn get sizeCm => real().nullable()();
  RealColumn get weightG => real().nullable()();
  TextColumn get leaderType => text().nullable()();
  TextColumn get rigType => text().nullable()();
  TextColumn get hookSize => text().nullable()();
  RealColumn get leaderLengthCm => real().nullable()();
  RealColumn get leadWeightG => real().nullable()();
  TextColumn get baitType => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mode => text()();
  TextColumn get target => text()();
  TextColumn get waterType => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  BoolColumn get hadCatch => boolean().nullable()();
  TextColumn get rating => text().nullable()();
  IntColumn get activeRigId => integer().nullable()();
}

class SessionEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get type => text()();
  IntColumn get rigId => integer().nullable()();
  TextColumn get note => text().nullable()();
}

@DriftDatabase(tables: [Rigs, Sessions, SessionEvents])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return openConnection();
  }

  Future<int> createRig(RigsCompanion rig) {
    return into(rigs).insert(rig);
  }

  Stream<List<Rig>> watchRigs() => select(rigs).watch();

  Future<List<Rig>> getRigs() => select(rigs).get();

  Future<void> deleteRig(int id) async {
    await (delete(rigs)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> createSession(SessionsCompanion session) {
    return into(sessions).insert(session);
  }

  Future<Session?> getActiveSession() {
    return (select(sessions)..where((tbl) => tbl.endTime.isNull())).getSingleOrNull();
  }

  Stream<Session?> watchActiveSession() {
    return (select(sessions)..where((tbl) => tbl.endTime.isNull())).watchSingleOrNull();
  }

  Future<void> updateSessionActiveRig(int sessionId, int? rigId) async {
    await (update(sessions)..where((tbl) => tbl.id.equals(sessionId)))
        .write(SessionsCompanion(activeRigId: Value(rigId)));
  }

  Future<void> endSession({
    required int sessionId,
    required DateTime endTime,
    required bool hadCatch,
    required String rating,
  }) async {
    await (update(sessions)..where((tbl) => tbl.id.equals(sessionId)))
        .write(SessionsCompanion(
      endTime: Value(endTime),
      hadCatch: Value(hadCatch),
      rating: Value(rating),
    ));
  }

  Future<int> addEvent(SessionEventsCompanion event) {
    return into(sessionEvents).insert(event);
  }

  Future<int> totalSessions() async {
    final result = await customSelect('SELECT COUNT(*) AS count FROM sessions').getSingle();
    return result.data['count'] as int? ?? 0;
  }

  Future<int> totalCatches() async {
    final result = await customSelect(
      "SELECT COUNT(*) AS count FROM session_events WHERE type = 'fish'",
    ).getSingle();
    return result.data['count'] as int? ?? 0;
  }

  Future<List<SessionEvent>> eventsForSession(int sessionId) {
    return (select(sessionEvents)..where((tbl) => tbl.sessionId.equals(sessionId))).get();
  }
}
