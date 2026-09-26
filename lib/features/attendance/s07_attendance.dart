import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

class S07Attendance extends StatefulWidget {
  const S07Attendance({super.key});
  @override
  State<S07Attendance> createState() => _S07AttendanceState();
}

class _S07AttendanceState extends State<S07Attendance> {
  String dbms = 'unmarked';
  static const subs = [
    ('CN', '72%', Color(0xFF101010), 0.72),
    ('DBMS', '81%', Color(0xFF101010), 0.81),
    ('OS  • low', '58%', AppColors.coral, 0.58),
    ('Maths', '64%', Color(0xFF101010), 0.64),
  ];

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Attendance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              Text('Tap to mark • cancelled & holidays excluded', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
            ])),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(999)), child: const Text('target 75%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white))),
          ]),
          const SizedBox(height: 12),
          AppCard(
            child: Row(children: [
              SizedBox(
                width: 110,
                height: 110,
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                          value: 0.68,
                          strokeWidth: 10,
                          backgroundColor: AppColors.ink20,
                          valueColor: const AlwaysStoppedAnimation(AppColors.ink),
                          strokeCap: StrokeCap.round)),
                  const Column(mainAxisSize: MainAxisSize.min, children: [
                    Text('68%', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                    Text('OVERALL', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.7, color: AppColors.ink40)),
                  ]),
                ]),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(children: [
                  for (final s in subs)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(s.$1, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: s.$3)),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(color: s.$3.withValues(alpha: 0.10), borderRadius: BorderRadius.circular(999)),
                              child: Text(s.$2, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: s.$3))),
                        ]),
                        const SizedBox(height: 4),
                        ProgressBar(s.$4, color: s.$3, height: 4),
                      ]),
                    ),
                ]),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          AppCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: AppColors.grapeSoft, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.edit_rounded, size: 14, color: AppColors.grape)),
                const SizedBox(width: 8),
                const Text('Mark today  •  11:00  DBMS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              ]),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(child: _markChip('Present', dbms == 'present', AppColors.leaf, () => setState(() => dbms = 'present'))),
                const SizedBox(width: 8),
                Expanded(child: _markChip('Absent', dbms == 'absent', AppColors.coral, () => setState(() => dbms = 'absent'))),
              ]),
              const SizedBox(height: 8),
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7), decoration: BoxDecoration(color: AppColors.creamDeep, borderRadius: BorderRadius.circular(10)), child: const Row(children: [Icon(Icons.info_outline_rounded, size: 12, color: AppColors.ink40), SizedBox(width: 6), Expanded(child: Text('16:00 CN Lab is cancelled today — excluded from the %', style: TextStyle(fontSize: 11, color: AppColors.ink60)))])),
            ]),
          ),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.sun,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('RECOVERY PLANNER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.7)),
              const SizedBox(height: 4),
              const Text('Attend 9 of next 13  →  75%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const ProgressBar(0.68, color: AppColors.ink, bg: Color(0x33000000)),
              const SizedBox(height: 8),
              const Text('OS needs the most help (58%)  •  1 bunk allowed after target', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ]),
          ),
          const SizedBox(height: 10),
          const SectionHead('Last 14 days'),
          AppCard(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              for (var i = 0; i < 7; i++)
                Column(children: [
                  Container(width: 28, height: 28, decoration: BoxDecoration(color: i == 2 ? AppColors.coralSoft : i == 5 ? AppColors.ink20 : AppColors.leafSoft, shape: BoxShape.circle), child: Icon(i == 2 ? Icons.close_rounded : i == 5 ? Icons.remove_rounded : Icons.check_rounded, size: 14, color: i == 2 ? AppColors.coral : i == 5 ? AppColors.ink40 : AppColors.leaf)),
                  const SizedBox(height: 4),
                  Text(['M', 'T', 'W', 'T', 'F', 'S', 'S'][i], style: const TextStyle(fontSize: 10, color: AppColors.ink40, fontWeight: FontWeight.w600)),
                ]),
            ]),
          ),
        ],
      );

  Widget _markChip(String label, bool sel, Color c, VoidCallback tap) => GestureDetector(
        onTap: tap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(color: sel ? c : Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: sel ? c : AppColors.line, width: sel ? 1.4 : 1)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(sel ? Icons.check_circle_rounded : Icons.circle_outlined, size: 16, color: sel ? Colors.white : AppColors.ink40),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: sel ? Colors.white : AppColors.ink)),
          ]),
        ),
      );
}
