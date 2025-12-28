import 'package:drift/drift.dart';

LazyDatabase openDatabaseConnection() {
  return LazyDatabase(() async {
    throw UnsupportedError('Keine DB-Implementierung für diese Plattform.');
  });
}
