import 'package:flutter/material.dart';
import '../../data/demo_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/attendance/s07_attendance.dart';

/// Timetable — Day / Week + date-only overrides.
class S06Timetable extends StatefulWidget {
  const S06Timetable({super.key});
  @override
  State<S06Timetable> createState() => _S06TimetableState();
}

class _S06TimetableState extends State<S06Timetable> {
  bool week = false;
  bool dateOnly = true;
  static const _grid = [
    ['9a', 'CN', 'CN', 'CN•', 'CN', 'CN'],
    ['11a', 'DB', 'DB', 'DB•', 'DB', '—'],
    ['2p', '—', 'OS', 'OS+', 'OS', '—'],
  ];

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Timetable', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              Text('Weekly series + date-only changes', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
            ])),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(999)), child: const Text('Wed 24 Sep', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white))),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            ChoiceChip(label: const Text('Day', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)), selected: !week, selectedColor: AppColors.ink, labelStyle: TextStyle(color: !week ? Colors.white : AppColors.ink), onSelected: (_) => setState(() => week = false)),
            const SizedBox(width: 6),
            ChoiceChip(label: const Text('Week', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)), selected: week, selectedColor: AppColors.ink, labelStyle: TextStyle(color: week ? Colors.white : AppColors.ink), onSelected: (_) => setState(() => week = true)),
            const Spacer(),
            FilledButton.icon(onPressed: _sheet, icon: const Icon(Icons.add_rounded, size: 16), label: const Text('Add', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)), style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), backgroundColor: AppColors.ink)),
          ]),
          const SizedBox(height: 12),
          if (!week)
            ...Demo.classes.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppCard(
                    color: c.state == 'now' ? AppColors.leafSoft : null,
                    border: c.state == 'now' ? Border.all(color: AppColors.leaf.withValues(alpha: 0.25)) : c.state == 'cancelled' ? Border.all(color: AppColors.line) : null,
                    child: Row(children: [
                      Container(width: 48, height: 48, decoration: BoxDecoration(color: c.state == 'cancelled' ? AppColors.ink20 : AppColors.creamDeep, borderRadius: BorderRadius.circular(12)), child: Center(child: Text(c.time, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: c.state == 'cancelled' ? AppColors.ink40 : AppColors.ink)))),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(c.title, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800, color: c.state == 'cancelled' ? AppColors.ink40 : AppColors.ink, decoration: c.state == 'cancelled' ? TextDecoration.lineThrough : null)),
                        Text(c.meta, style: const TextStyle(fontSize: 11.5, color: AppColors.ink60)),
                      ])),
                      if (c.state == 'now') const Pill('● Live', bg: AppColors.leaf, fontSize: 10),
                      if (c.state == 'cancelled') const Pill('Cancelled', bg: AppColors.ink20, fg: AppColors.ink40, fontSize: 10),
                    ]),
                  ),
                ))
          else
            AppCard(
              child: Column(children: [
                const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  SizedBox(width: 26),
                  Text('M', style: _dow), Text('T', style: _dow), Text('W', style: _dow), Text('T', style: _dow), Text('F', style: _dow),
                ]),
                const SizedBox(height: 8),
                for (final r in _grid)
                  Padding(padding: const EdgeInsets.only(top: 6), child: Row(children: [
                    SizedBox(width: 26, child: Text(r[0], style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.ink60))),
                    for (var i = 1; i < r.length; i++)
                      Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), padding: const EdgeInsets.symmetric(vertical: 9), decoration: BoxDecoration(color: r[i].endsWith('•') || r[i].endsWith('+') ? (r[i].startsWith('CN') ? AppColors.leaf : r[i].startsWith('DB') ? AppColors.sky : AppColors.sun) : AppColors.creamDeep, borderRadius: BorderRadius.circular(9), border: i == 3 ? Border.all(color: AppColors.ink, width: 1.2) : null), child: Text(r[i], textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: r[i].endsWith('•') || r[i].endsWith('+') ? Colors.white : AppColors.ink60)))),
                  ])),
                const SizedBox(height: 10),
                Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7), decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(10)), child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.info_outline_rounded, size: 13, color: Color(0xFF8A6E00)), SizedBox(width: 6), Text('• today  •  + extra Wed only  •  Sat/Sun holiday', style: TextStyle(fontSize: 11, color: Color(0xFF6B5900)))])),
              ]),
            ),
          const SizedBox(height: 10),
          PrimaryButton('Open attendance  →', onTap: () => Nav.go(context, const S07Attendance())),
        ],
      );

  static const _dow = TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.ink40);

  void _sheet() => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        builder: (_) => StatefulBuilder(builder: (ctx, setS) => Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(width: 36, height: 4, decoration: BoxDecoration(color: AppColors.line, borderRadius: BorderRadius.circular(999))),
                const SizedBox(height: 14),
                const Text('Add / edit class', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                const SizedBox(height: 12),
                const TextField(decoration: InputDecoration(hintText: 'Subject — e.g. OS Lab')),
                const SizedBox(height: 8),
                const TextField(decoration: InputDecoration(hintText: 'Time — 14:00 – 15:00')),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(child: ChoiceChip(label: const Text('Weekly series', style: TextStyle(fontSize: 12)), selected: !dateOnly, onSelected: (_) => setS(() => dateOnly = false))),
                  const SizedBox(width: 8),
                  Expanded(child: ChoiceChip(label: const Text('Only Wed 24 Sep', style: TextStyle(fontSize: 12)), selected: dateOnly, selectedColor: AppColors.sun, onSelected: (_) => setS(() => dateOnly = true))),
                ]),
                const SizedBox(height: 12),
                PrimaryButton('Save', onTap: () { Navigator.pop(ctx); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved for 24 Sep only — weekly series untouched ✓'))); }),
              ]),
            )),
      );
}
