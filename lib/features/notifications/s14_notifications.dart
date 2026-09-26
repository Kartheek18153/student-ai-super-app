import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/timetable/s06_timetable.dart';
import 'package:student_ai_super_app/features/attendance/s07_attendance.dart';
import 'package:student_ai_super_app/features/tasks/s08_tasks.dart';

/// S34–S36 Notifications — severity-railed list, tap to mark read,
/// per-kind toggles + quiet hours (§19).
class S14Notifications extends StatefulWidget {
  const S14Notifications({super.key});
  @override
  State<S14Notifications> createState() => _S14NotificationsState();
}

class _Notif {
  final String title, meta, icon;
  final Color rail;
  bool read;
  _Notif(this.title, this.meta, this.icon, this.rail, this.read);
}

class _S14NotificationsState extends State<S14Notifications> {
  final items = [
    _Notif('DBMS at 11:00 • R204', 'Class in 40 min • 2m ago', '⏰', AppColors.coral, false),
    _Notif('CN report overdue', 'Due yesterday 11:59 PM • 1h ago', '📝', AppColors.coral, false),
    _Notif('OS attendance 58%', 'Attend next 4 straight • 3h ago', '⚠️', AppColors.sun, false),
    _Notif('Retest ready: Congestion 5Q', 'AI recommendation • yesterday', '✨', AppColors.grape, false),
    _Notif('DBMS mock graded: 68%', '2 days ago', '🏆', Colors.black12, true),
  ];
  final toggles = {
    '📚 Upcoming classes': true,
    '📝 Assignments': true,
    '⚠️ Attendance warnings': true,
    '🏆 Test results': true,
    '✨ Study recommendations': true,
    '🔁 Revision reminders': false,
  };

  int get unread => items.where((e) => !e.read).length;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Notifications',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.3,
                          color: AppColors.ink)),
                  const SizedBox(height: 2),
                  Text(
                      unread == 0
                          ? 'All caught up • quiet 22:00–07:00'
                          : '$unread new • tap to mark read',
                      style: const TextStyle(
                          fontSize: 11.5, color: AppColors.ink60, height: 1.2)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Pill(unread == 0 ? 'All read ✓' : '$unread new',
                bg: unread == 0 ? AppColors.leaf : AppColors.ink),
          ]),
          const SizedBox(height: 14),
          for (var idx = 0; idx < items.length; idx++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                border: Border(
                    left: BorderSide(color: items[idx].rail, width: 4)),
                child: Builder(builder: (ctx) {
                  final n = items[idx];
                  const dests = [
                    S06Timetable(),
                    S08Tasks(),
                    S07Attendance(),
                    S04Tests(),
                    S04Tests(),
                  ];
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => n.read = true);
                      Nav.go(ctx, dests[idx]);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                              color: AppColors.creamDeep,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(n.icon,
                                  style: const TextStyle(fontSize: 18))),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(n.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      height: 1.2,
                                      color: AppColors.ink,
                                      fontWeight: n.read
                                          ? FontWeight.w600
                                          : FontWeight.w800)),
                              const SizedBox(height: 2),
                              Text(n.meta,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.ink60,
                                      height: 1.3)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              color: n.read
                                  ? AppColors.ink20
                                  : AppColors.ink,
                              shape: BoxShape.circle),
                          child: Icon(
                              n.read
                                  ? Icons.check_rounded
                                  : Icons.arrow_forward_rounded,
                              size: 14,
                              color: n.read
                                  ? AppColors.ink40
                                  : Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          const SizedBox(height: 6),
          const SectionHead('Settings', icon: Icons.tune_rounded),
          AppCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Column(
                  children: toggles.keys
                      .map((k) => SwitchListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text(k,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.ink)),
                            value: toggles[k]!,
                            activeThumbColor: Colors.white,
                            activeTrackColor: AppColors.leaf,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: AppColors.ink20,
                            trackOutlineColor:
                                WidgetStateProperty.all(Colors.transparent),
                            onChanged: (v) =>
                                setState(() => toggles[k] = v),
                          ))
                      .toList())),
          const SizedBox(height: 10),
          AppCard(
              padding: const EdgeInsets.all(14),
              child: Row(children: [
                Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        color: AppColors.sunSoft,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.bedtime_rounded,
                        size: 16, color: Color(0xFF8A6E00))),
                const SizedBox(width: 12),
                const Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Quiet hours 22:00–07:00',
                          style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.ink)),
                      SizedBox(height: 2),
                      Text(
                          'Only attendance + deadline alerts break through.',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.ink60,
                              height: 1.35)),
                    ])),
              ])),
        ],
      );
}
