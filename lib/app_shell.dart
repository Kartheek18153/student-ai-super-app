import 'package:flutter/material.dart';
import 'screens/s01_dashboard.dart';
import 'screens/s02_learn.dart';
import 'screens/s03_ai_study.dart';
import 'screens/s04_tests.dart';
import 'screens/s13_search.dart';
import 'screens/s14_notifications.dart';
import 'screens/s15_profile.dart';
import 'theme/app_colors.dart';
import 'widgets/app_nav.dart';

/// Bottom-nav shell: Home · Learn · AI · Tests · You
/// Cream app bar with subtle bottom line + search/notification shortcuts.
class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int tab = 0;
  static const _tabs = [
    S01Dashboard(),
    S02Learn(),
    S03AiStudy(),
    S04Tests(),
    S15Profile(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.cream,
          title: Row(children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(8)),
              child: const Center(child: Text('S', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14))),
            ),
            const SizedBox(width: 8),
            const Text('STUDENT OS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: AppColors.grapeSoft, borderRadius: BorderRadius.circular(999)),
              child: const Text('BETA', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: AppColors.grape, letterSpacing: 0.6)),
            ),
          ]),
          actions: [
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search_rounded),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Scaffold(body: SafeArea(child: S13Search())))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Badge.count(
                count: 4,
                backgroundColor: AppColors.coral,
                child: IconButton(
                  tooltip: 'Notifications',
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Scaffold(body: SafeArea(child: S14Notifications())))),
                ),
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 1, color: AppColors.line),
          ),
        ),
        body: Column(children: [
          Expanded(child: _tabs[tab]),
          AppTabBar(current: tab, onTap: (i) => setState(() => tab = i)),
        ]),
      );
}
