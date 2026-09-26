import 'package:flutter/material.dart';
import 'screens/s19_onboarding.dart';
import 'services/supabase_service.dart';
import 'theme/app_theme.dart';

/// Student AI Super-App — Flutter port of OpenDesign project Student_career.
/// Runs on bundled demo data unless SUPABASE_URL + SUPABASE_ANON_KEY are
/// passed via --dart-define (schema: Student_career/supabase-schema.sql).
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Supa.init();
  } catch (_) {
    // Offline demo mode — Supa.ready stays false, screens use Demo data.
  }
  runApp(const StudentOsApp());
}

class StudentOsApp extends StatelessWidget {
  const StudentOsApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Student OS',
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        home: const Scaffold(
          body: SafeArea(child: S19Onboarding())),
      );
}
