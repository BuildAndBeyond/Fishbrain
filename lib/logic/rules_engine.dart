import '../models/recommendation.dart';
import '../storage/app_database.dart';

enum Season { spring, summer, autumn, winter }

enum TimeOfDay { morning, midday, evening, night }

Season seasonFromDate(DateTime now) {
  final month = now.month;
  if (month >= 3 && month <= 5) return Season.spring;
  if (month >= 6 && month <= 8) return Season.summer;
  if (month >= 9 && month <= 11) return Season.autumn;
  return Season.winter;
}

TimeOfDay timeOfDayFromDate(DateTime now) {
  final hour = now.hour;
  if (hour >= 5 && hour < 10) return TimeOfDay.morning;
  if (hour >= 10 && hour < 16) return TimeOfDay.midday;
  if (hour >= 16 && hour < 22) return TimeOfDay.evening;
  return TimeOfDay.night;
}

List<Recommendation> buildRecommendations(Session session) {
  final season = seasonFromDate(DateTime.now());
  final timeOfDay = timeOfDayFromDate(DateTime.now());
  if (session.mode == 'Raubfisch') {
    return _predatorRecommendations(session, season, timeOfDay);
  }
  return _carpRecommendations(session, season, timeOfDay);
}

List<Recommendation> _predatorRecommendations(
  Session session,
  Season season,
  TimeOfDay timeOfDay,
) {
  final target = session.target;
  final water = session.waterType;
  final timeHint = switch (timeOfDay) {
    TimeOfDay.morning => 'Früh aktiv: Raubfische ziehen flach ein.',
    TimeOfDay.midday => 'Mittag: such Schatten, Kanten und Strukturen.',
    TimeOfDay.evening => 'Abend: Beutefische werden nervös, Beißfenster möglich.',
    TimeOfDay.night => 'Nacht: langsam führen und Vibration nutzen.',
  };
  final seasonHint = switch (season) {
    Season.spring => 'Frühjahr: flache Bereiche und erste Krautfelder checken.',
    Season.summer => 'Sommer: tieferes Wasser und Sauerstoffzonen suchen.',
    Season.autumn => 'Herbst: Fische fressen sich Reserven an, aggressiver führen.',
    Season.winter => 'Winter: langsame Köderführung, warmere Zonen finden.',
  };
  final waterHint = water == 'See'
      ? 'Am See an Kanten und Plateaus entlang führen.'
      : water == 'Fluss'
          ? 'Im Fluss die Kehrwasser und strömungsberuhigten Bereiche abfischen.'
          : 'Am Kanal Spundwände und Häfen abklopfen.';

  final first = Recommendation(
    title: '$target aktiv suchen',
    bullets: [
      'Kante für Kante absuchen',
      'Ködergröße variieren',
      if (timeOfDay == TimeOfDay.night) 'Mehr Vibration: Spinner oder Wobbler',
    ],
    reasons: [timeHint, seasonHint, waterHint],
  );

  final second = Recommendation(
    title: 'Bewährte Farben & Führung',
    bullets: [
      'Naturfarben bei klarem Wasser',
      'Schockfarben bei trübem Wasser',
      'Pausen einbauen, dann Beschleunigen',
    ],
    reasons: [
      'Beutefische werden so besser imitiert.',
      'Wechsel bei Bissflaute sorgt oft für Reaktion.',
    ],
  );

  return [first, second];
}

List<Recommendation> _carpRecommendations(
  Session session,
  Season season,
  TimeOfDay timeOfDay,
) {
  final water = session.waterType;
  final seasonHint = switch (season) {
    Season.spring => 'Frühjahr: kleinere Köder und wenig Futter.',
    Season.summer => 'Sommer: aktive Zeiten morgens/abends nutzen.',
    Season.autumn => 'Herbst: mehr Futter, Fische fressen sich satt.',
    Season.winter => 'Winter: sehr sparsam füttern, warme Zonen suchen.',
  };
  final timeHint = switch (timeOfDay) {
    TimeOfDay.morning => 'Morgens sind Fressfenster oft kurz, schnell reagieren.',
    TimeOfDay.midday => 'Mittags tiefere Bereiche und Schatten testen.',
    TimeOfDay.evening => 'Abends ziehen Karpfen oft flacher ein.',
    TimeOfDay.night => 'Nachts ruhig präsentieren und länger liegen lassen.',
  };
  final waterHint = water == 'See'
      ? 'Am See an Plateaus oder Krautkanten anfüttern.'
      : water == 'Fluss'
          ? 'Im Fluss eher in ruhigeren Bereichen platzieren.'
          : 'Im Kanal strukturreiche Stellen nutzen.';

  final first = Recommendation(
    title: 'Futterplatz ruhig halten',
    bullets: [
      'Kleine Futtermenge, gezielt platzieren',
      'Köder sauber präsentieren',
      'Hakenköder regelmäßig prüfen',
    ],
    reasons: [seasonHint, timeHint, waterHint],
  );

  final second = Recommendation(
    title: 'Köder-Typ passend wählen',
    bullets: [
      'Pop-Up bei Kraut oder Schlamm',
      'Wafter bei vorsichtigen Fischen',
      'Boilie für Selektion größerer Fische',
    ],
    reasons: [
      'Köderhöhe bestimmt Sichtbarkeit und Bissfrequenz.',
      'Variation hält den Platz interessant.',
    ],
  );

  return [first, second];
}
