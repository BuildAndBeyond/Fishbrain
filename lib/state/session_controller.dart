import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../storage/app_database.dart';

class SessionController extends ChangeNotifier {
  final AppDatabase database;
  Session? activeSession;
  bool isLoading = false;
  List<SessionEvent> events = [];

  SessionController(this.database);

  Future<void> loadActiveSession() async {
    isLoading = true;
    notifyListeners();
    activeSession = await database.getActiveSession();
    if (activeSession != null) {
      events = await database.eventsForSession(activeSession!.id);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> startSession({
    required String mode,
    required String target,
    required String waterType,
  }) async {
    isLoading = true;
    notifyListeners();
    final now = DateTime.now();
    final id = await database.createSession(
      SessionsCompanion.insert(
        mode: mode,
        target: target,
        waterType: waterType,
        startTime: now,
      ),
    );
    activeSession = Session(
      id: id,
      mode: mode,
      target: target,
      waterType: waterType,
      startTime: now,
      endTime: null,
      hadCatch: null,
      rating: null,
      activeRigId: null,
    );
    events = [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> logBite() async {
    final session = activeSession;
    if (session == null) return;
    await database.addEvent(SessionEventsCompanion.insert(
      sessionId: session.id,
      timestamp: DateTime.now(),
      type: 'bite',
      rigId: Value(session.activeRigId),
    ));
    await refreshEvents();
  }

  Future<void> logFish() async {
    final session = activeSession;
    if (session == null) return;
    await database.addEvent(SessionEventsCompanion.insert(
      sessionId: session.id,
      timestamp: DateTime.now(),
      type: 'fish',
      rigId: Value(session.activeRigId),
    ));
    await refreshEvents();
  }

  Future<void> changeRig(int rigId) async {
    final session = activeSession;
    if (session == null) return;
    await database.updateSessionActiveRig(session.id, rigId);
    await database.addEvent(SessionEventsCompanion.insert(
      sessionId: session.id,
      timestamp: DateTime.now(),
      type: 'rig_change',
      rigId: Value(rigId),
    ));
    activeSession = session.copyWith(activeRigId: rigId);
    await refreshEvents();
  }

  Future<void> endSession({required bool hadCatch, required String rating}) async {
    final session = activeSession;
    if (session == null) return;
    final endTime = DateTime.now();
    await database.endSession(
      sessionId: session.id,
      endTime: endTime,
      hadCatch: hadCatch,
      rating: rating,
    );
    await database.addEvent(SessionEventsCompanion.insert(
      sessionId: session.id,
      timestamp: endTime,
      type: 'session_end',
      rigId: Value(session.activeRigId),
    ));
    activeSession = null;
    events = [];
    notifyListeners();
  }

  Future<void> refreshEvents() async {
    final session = activeSession;
    if (session == null) return;
    events = await database.eventsForSession(session.id);
    notifyListeners();
  }
}
