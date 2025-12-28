# catchlog_android_mvp (Web MVP)
Offline‑first Angel-Logbuch als **Web‑App** (Netlify‑Deployment). Keine iOS/Mac/Apple Watch Schritte.

## Voraussetzungen (Windows/Linux)
1. **Flutter SDK installieren**: https://docs.flutter.dev/get-started/install
2. Optional für lokale Tests: Chrome oder Edge.
3. Prüfen:
   ```bash
   flutter doctor
   ```

---

## Setup (Copy/Paste)
```bash
# 1) Abhängigkeiten holen
flutter pub get

# 2) Code-Generierung (drift)
dart run build_runner build
```

## Lokal starten (Web)
```bash
flutter run -d chrome
```

---

## Netlify Deployment
Dieses Projekt enthält eine `netlify.toml`.

### Variante A: Netlify UI
1. Repository in Netlify importieren.
2. Build Command: `flutter build web --release`
3. Publish Directory: `build/web`
4. Deploy starten.

### Variante B: Netlify CLI
```bash
# Netlify CLI installieren (einmalig)
npm install -g netlify-cli

# Build
flutter build web --release

# Deploy (Draft)
netlify deploy --dir=build/web

# Deploy (Production)
netlify deploy --prod --dir=build/web
```

---

## Hinweise
- **Offline‑first**: Alle Daten bleiben lokal im Browser (IndexedDB via drift).
- **Kein Tracking, keine Werbung**.
- Empfehlungen sind **regelbasiert & erklärbar**.

Viel Erfolg am Wasser! 🎣
