import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/rigs_controller.dart';
import 'state/session_controller.dart';
import 'state/stats_controller.dart';
import 'storage/app_database.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/new_session_screen.dart';
import 'ui/screens/rig_form_screen.dart';
import 'ui/screens/rigs_screen.dart';
import 'ui/screens/session_live_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'ui/screens/stats_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  runApp(CatchlogApp(database: database));
}

class CatchlogApp extends StatelessWidget {
  final AppDatabase database;

  const CatchlogApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: database),
        ChangeNotifierProvider(create: (_) => RigsController(database)..loadRigs()),
        ChangeNotifierProvider(create: (_) => SessionController(database)..loadActiveSession()),
        ChangeNotifierProvider(create: (_) => StatsController(database)),
      ],
      child: MaterialApp(
        title: 'Catchlog',
        theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey.shade900,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          appBarTheme: const AppBarTheme(centerTitle: false),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/new_session': (_) => const NewSessionScreen(),
          '/session_live': (_) => const SessionLiveScreen(),
          '/rigs': (_) => const RigsScreen(),
          '/rig_form': (_) => const RigFormScreen(),
          '/stats': (_) => const StatsScreen(),
          '/settings': (_) => const SettingsScreen(),
        },
      ),
    );
  }
}
