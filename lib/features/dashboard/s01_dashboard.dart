import 'package:flutter/material.dart';
import '../../data/demo_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/learn/s02_learn.dart';
import 'package:student_ai_super_app/features/ai_study/s03_ai_study.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/revision/s05_revision.dart';
import 'package:student_ai_super_app/features/timetable/s06_timetable.dart';
import 'package:student_ai_super_app/features/attendance/s07_attendance.dart';
import 'package:student_ai_super_app/features/tasks/s08_tasks.dart';
import 'package:student_ai_super_app/features/academic/s09_academic.dart';
import 'package:student_ai_super_app/features/pyq/s10_pyq.dart';
import 'package:student_ai_super_app/features/materials/s11_materials.dart';
import 'package:student_ai_super_app/features/notes/s12_notes.dart';
import 'package:student_ai_super_app/features/profile/s15_profile.dart';

/// S01 Dashboard — student home: greeting, focus cards, classes, stats, weak topics, continue.
class S01Dashboard extends StatelessWidget {
  const S01Dashboard({super.key});
  void _go(BuildContext context, Widget page) => Nav.go(context, page);

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          // Greeting row
          Row(children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Text('KS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13))),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Good morning, Karthik', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                Text('CSE • Sem 6 • SIT  •  CGPA 7.84', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(999), border: Border.all(color: AppColors.line)),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Text('🔥', style: TextStyle(fontSize: 11)),
                SizedBox(width: 4),
                Text('6', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
                SizedBox(width: 4),
                Text('day streak', style: TextStyle(fontSize: 11, color: AppColors.ink60)),
                SizedBox(width: 8),
                Text('💎 20', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
              ]),
            ),
          ]),
          const SizedBox.shrink(),

          // Performance strip — scr2 ref: horizontal stats of every user metric.
          Row(children: [
            const Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your progress',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.3)),
                    Text('Sem 6 • updated today',
                        style: TextStyle(
                            fontSize: 11.5, color: AppColors.ink60)),
                  ]),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.line)),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.calendar_today_rounded,
                    size: 12, color: AppColors.ink60),
                SizedBox(width: 5),
                Text('This week',
                    style: TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w700)),
              ]),
            ),
          ]),
          const SizedBox(height: 10),
          _ProgressStrip(go: (p) => _go(context, p)),

          // Hero: PYQ library — top only.
          AppCard(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C4BF2), Color(0xFF8B6CFF), Color(0xFFA48CFF)],
              begin: Alignment.topLeft, end: Alignment.bottomRight,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.22), borderRadius: BorderRadius.circular(999)),
                  child: const Text('PYQ LIBRARY', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.8, color: Colors.white)),
                ),
                const Spacer(),
                const Text('VTU • 2023 • 18 pages', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white70)),
              ]),
              const SizedBox(height: 10),
              const Text('Previous Year Questions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              const Text('Subject • Semester • University wise — tap to explore', style: TextStyle(fontSize: 12.5, color: Colors.white70, height: 1.4)),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _go(context, const S10Pyq()),
                  style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.ink, padding: const EdgeInsets.symmetric(vertical: 13), shape: const StadiumBorder()),
                  child: const Text('Browse PYQs  →', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800)),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 14),

          // Explore — just below PYQ: featured AI + palette grid (S02..S12).
          Row(children: [
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Explore', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -0.3)),
                Text('11 spaces • tap any block to jump in', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(999)),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.grid_view_rounded, size: 12, color: Colors.white),
                SizedBox(width: 5),
                Text('11', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white)),
              ]),
            ),
          ]),
          const SizedBox(height: 10),
          AppCard(
            gradient: const LinearGradient(
              colors: [Color(0xFF101010), Color(0xFF3A2EA6), Color(0xFF6C4BF2)],
              begin: Alignment.topLeft, end: Alignment.bottomRight,
            ),
            padding: const EdgeInsets.all(14),
            onTap: () => _go(context, const S03AiStudy()),
            child: Row(children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.auto_awesome_rounded, size: 22, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('AI STUDY • FEATURED', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.8, color: Colors.white60)),
                  SizedBox(height: 2),
                  Text('Ask the tutor anything', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Colors.white)),
                  Text('Knows CN U3 • 62% mock • 3 notes', style: TextStyle(fontSize: 11.5, color: Colors.white70)),
                ]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: AppColors.lime, borderRadius: BorderRadius.circular(999)),
                child: const Text('Open →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.ink)),
              ),
            ]),
          ),
          const SizedBox(height: 8),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.28,
            children: [
              _HomeBlock(title: 'Learn', sub: 'Subjects → topics', icon: Icons.menu_book_rounded, bg: AppColors.skySoft, fg: AppColors.sky, page: S02Learn()),
              _HomeBlock(title: 'Tests', sub: 'Mock • analysis', icon: Icons.quiz_rounded, bg: AppColors.coralSoft, fg: AppColors.coral, page: S04Tests()),
              _HomeBlock(title: 'Revision', sub: 'Weak → retest', icon: Icons.replay_rounded, bg: AppColors.sunSoft, fg: const Color(0xFF8A6E00), page: S05Revision()),
              _HomeBlock(title: 'Timetable', sub: 'Day • week', icon: Icons.calendar_month_rounded, bg: AppColors.leafSoft, fg: AppColors.leaf, page: S06Timetable()),
              _HomeBlock(title: 'Attendance', sub: '68% • target 75', icon: Icons.how_to_reg_rounded, bg: AppColors.limeSoft, fg: AppColors.ink, page: S07Attendance()),
              _HomeBlock(title: 'Tasks', sub: '3 pending • 1 due', icon: Icons.checklist_rounded, bg: AppColors.creamDeep, fg: AppColors.ink, page: S08Tasks()),
              _HomeBlock(title: 'Academic', sub: 'CGPA 7.84 • goals', icon: Icons.school_rounded, bg: AppColors.ink, fg: Colors.white, dark: true, page: S09Academic()),
              _HomeBlock(title: 'PYQ', sub: 'Search • reader', icon: Icons.description_rounded, bg: AppColors.grapeSoft, fg: AppColors.grape, page: S10Pyq()),
              _HomeBlock(title: 'Materials', sub: 'Reader • summary', icon: Icons.folder_rounded, bg: AppColors.skySoft, fg: AppColors.sky, page: S11Materials()),
              _HomeBlock(title: 'AI Notes', sub: 'Editor • export', icon: Icons.edit_note_rounded, bg: AppColors.leafSoft, fg: AppColors.leaf, page: S12Notes()),
            ].map((b) => _homeTile(context, b)).toList(),
          ),
          const SizedBox(height: 10),

          // Focus card
          AppCard(
            color: AppColors.ink,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(999)), child: const Text('TODAY • WED 24 SEP • SEM 6', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.7, color: Colors.white60))),
                const Spacer(),
                Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.lime, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                const Text('On track', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white60)),
              ]),
              const SizedBox(height: 10),
              const Text('Close the 7% gap today.', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              const Text('CN — Network Layer • 65% complete', style: TextStyle(fontSize: 12.5, color: Colors.white60)),
              const SizedBox(height: 6),
              const ProgressBar(0.65, color: AppColors.lime, bg: Color(0x33FFFFFF), height: 6),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: FilledButton(onPressed: () => _go(context, const S02Learn()), style: FilledButton.styleFrom(backgroundColor: AppColors.lime, foregroundColor: AppColors.ink, padding: const EdgeInsets.symmetric(vertical: 12), shape: const StadiumBorder()), child: const Text('Continue  →', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)))),
                const SizedBox(width: 8),
                Expanded(child: OutlinedButton(onPressed: () => _go(context, const S03AiStudy()), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white24), padding: const EdgeInsets.symmetric(vertical: 12), shape: const StadiumBorder()), child: const Text('Ask AI', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)))),
              ]),
            ]),
          ),
          const SizedBox(height: 14),

          // Today's classes header + list
          const SectionHead('Today', icon: Icons.calendar_today_rounded, action: 'Next 11:00'),
          ...Demo.classes.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: AppCard(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(children: [
                    Container(
                      width: 46, height: 46,
                      decoration: BoxDecoration(color: c.state == 'cancelled' ? AppColors.ink20 : AppColors.creamDeep, borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Text(c.time, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: c.state == 'cancelled' ? AppColors.ink40 : AppColors.ink))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(c.title, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: c.state == 'cancelled' ? AppColors.ink40 : AppColors.ink, decoration: c.state == 'cancelled' ? TextDecoration.lineThrough : null)),
                      const SizedBox(height: 2),
                      Text(c.meta, style: const TextStyle(fontSize: 11.5, color: AppColors.ink60)),
                    ])),
                    if (c.state == 'now') const Pill('● Live', bg: AppColors.leaf, fg: Colors.white, fontSize: 10),
                    if (c.state == 'cancelled') const Pill('Cancelled', bg: AppColors.ink20, fg: AppColors.ink40, fontSize: 10),
                    if (c.state == 'upcoming') const Icon(Icons.chevron_right_rounded, color: AppColors.ink40, size: 18),
                  ]),
                ),
              )),
          const SizedBox(height: 8),

          // Stats strip
          Row(children: [
            Expanded(child: StatTile('68%', 'Attendance', bg: AppColors.sunSoft, icon: Icons.how_to_reg_rounded, onTap: () => _go(context, const S07Attendance()))),
            const SizedBox(width: 8),
            Expanded(child: StatTile('54%', 'Syllabus', bg: AppColors.skySoft, icon: Icons.menu_book_outlined, onTap: () => _go(context, const S02Learn()))),
            const SizedBox(width: 8),
            Expanded(child: StatTile('62%', 'Last test', bg: AppColors.grapeSoft, icon: Icons.quiz_outlined, onTap: () => _go(context, const S04Tests()))),
            const SizedBox(width: 8),
            Expanded(child: StatTile('7.84', 'CGPA', bg: AppColors.ink, fg: Colors.white, icon: Icons.school_rounded, onTap: () => _go(context, const S09Academic()))),
          ]),
          const SizedBox(height: 12),

          // Weak topics
          AppCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.all(7), decoration: BoxDecoration(color: AppColors.coralSoft, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.warning_rounded, size: 14, color: AppColors.coral)),
                const SizedBox(width: 8),
                const Expanded(child: Text('Weak topics need attention', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800))),
                const Pill('2 topics', bg: AppColors.coralSoft, fg: AppColors.coral, fontSize: 10),
              ]),
              const SizedBox(height: 10),
              _weakRow('Congestion control', 0.40, AppColors.coral),
              const SizedBox(height: 8),
              _weakRow('Routing algorithms', 0.55, AppColors.sun),
              const SizedBox(height: 12),
              PrimaryButton('Retake weak topics →', bg: AppColors.ink, onTap: () => _go(context, const S04Tests())),
            ]),
          ),
          const SizedBox(height: 12),

          // Continue learning
          const SectionHead('Continue learning', icon: Icons.play_circle_outline_rounded),
          ...Demo.continueLearning.asMap().entries.map((en) {
            const dests = [S02Learn(), S10Pyq(), S12Notes()];
            const icons = [Icons.menu_book_rounded, Icons.description_rounded, Icons.auto_awesome_rounded];
            const tints = [AppColors.grapeSoft, AppColors.skySoft, AppColors.leafSoft];
            const tintsFg = [AppColors.grape, AppColors.sky, AppColors.leaf];
            final c = en.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: AppCard(
                onTap: () => _go(context, dests[en.key]),
                padding: const EdgeInsets.all(12),
                child: Row(children: [
                  Container(width: 42, height: 42, decoration: BoxDecoration(color: tints[en.key], borderRadius: BorderRadius.circular(12)), child: Icon(icons[en.key], size: 20, color: tintsFg[en.key])),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(c.tag, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.6, color: tintsFg[en.key])),
                    Text(c.title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
                    Text(c.meta, style: const TextStyle(fontSize: 11.5, color: AppColors.ink60)),
                  ])),
                  const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.ink40),
                ]),
              ),
            );
          }),
          const SizedBox(height: 8),

          // Streak / achievements
          AppCard(
            onTap: () => _go(context, const S15Profile()),
            child: Row(children: [
              Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(12)), child: const Text('🔥', style: TextStyle(fontSize: 18))),
              const SizedBox(width: 12),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('6-day streak  •  3/5 tasks done', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                Text('2 achievements unlocked — keep going!', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
              ])),
              const Icon(Icons.chevron_right_rounded, color: AppColors.ink40),
            ]),
          ),
        ],
      );

  Widget _weakRow(String name, double v, Color c) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(name, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
          Text('${(v * 100).round()}%', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: c)),
        ]),
        const SizedBox(height: 6),
        ProgressBar(v, color: c, height: 6),
      ]);

  Widget _homeTile(BuildContext context, _HomeBlock b) => AppCard(
        color: b.bg,
        padding: const EdgeInsets.all(13),
        border: b.dark ? null : Border.all(color: b.fg.withValues(alpha: 0.14)),
        onTap: () => _go(context, b.page),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: b.dark ? Colors.white.withValues(alpha: 0.16) : b.fg,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: (b.dark ? Colors.black : b.fg).withValues(alpha: 0.22),
                      blurRadius: 10,
                      offset: const Offset(0, 4)),
                ],
              ),
              child: Icon(b.icon, size: 19, color: Colors.white),
            ),
            const Spacer(),
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: b.dark
                    ? Colors.white.withValues(alpha: 0.14)
                    : Colors.white.withValues(alpha: 0.75),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_outward_rounded,
                  size: 14, color: b.dark ? Colors.white : AppColors.ink),
            ),
          ]),
          const Spacer(),
          Text(b.title,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: -0.2, color: b.dark ? Colors.white : AppColors.ink)),
          const SizedBox(height: 1),
          Text(b.sub,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600, color: b.dark ? Colors.white60 : AppColors.ink60)),
        ]),
      );

}

/// Center-focus carousel — middle card big + full color, sides small + faded.
class _ProgressStrip extends StatefulWidget {
  final void Function(Widget) go;
  const _ProgressStrip({required this.go});

  @override
  State<_ProgressStrip> createState() => _ProgressStripState();
}

class _ProgressStripState extends State<_ProgressStrip> {
  late final PageController _ctl;
  double _page = 0;

  static const _items = [
    _Metric(
        'Attendance',
        '68%',
        'OS 58% lowest • 9/13 to 75%',
        '9/13 to 75%',
        '+2%',
        true,
        0.68,
        AppColors.sun,
        Icons.how_to_reg_rounded,
        [0.9, 0.85, 0.3, 0.95, 0.8, 0.2, 1.0],
        false,
        ['DBMS 11 AM', 'CN lab off'],
        S07Attendance()),
    _Metric(
        'Syllabus • CN',
        '65%',
        'U3 65% • U4 next at 45%',
        '7/12 topics',
        '+5%',
        true,
        0.65,
        AppColors.grape,
        Icons.menu_book_rounded,
        [1.0, 1.0, 0.65, 0.45, 0.1, 0.0, 0.0],
        false,
        ['IP done', 'Routing 55%'],
        S02Learn()),
    _Metric(
        'Last test',
        '62%',
        'Congestion 40% • retake ready',
        '2 weak topics',
        '+8%',
        true,
        0.62,
        AppColors.coral,
        Icons.quiz_rounded,
        [0.4, 0.55, 0.8, 0.7, 0.9, 0.6, 0.75],
        false,
        ['2/5 correct', 'Q7 ssthresh'],
        S04Tests()),
    _Metric(
        'CGPA',
        '7.84',
        'S5 8.1 • S6 projected 7.9',
        'goal 8.2',
        '+0.22',
        true,
        0.784,
        AppColors.sky,
        Icons.school_rounded,
        [0.69, 0.72, 0.76, 0.78, 0.81, 0.0, 0.0],
        false,
        ['DBMS 8.6', 'OS 7.1'],
        S09Academic()),
    _Metric(
        'Day streak',
        '6',
        'Best 12 days • today pending',
        'best 12',
        '+1',
        true,
        0.5,
        AppColors.leaf,
        Icons.local_fire_department_rounded,
        [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.25],
        true,
        ['3/5 tasks', '2 badges'],
        S15Profile()),
    _Metric(
        'Tasks done',
        '3/5',
        'CN report overdue • DBMS Fri',
        '1 overdue',
        '-1',
        false,
        0.60,
        AppColors.ink,
        Icons.checklist_rounded,
        [1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0],
        false,
        ['1 overdue', '3 pending'],
        S08Tasks()),
  ];

  @override
  void initState() {
    super.initState();
    _ctl =
        PageController(viewportFraction: 0.85, initialPage: 2)..addListener(() {
      if (mounted) setState(() => _page = _ctl.page ?? 0);
    });
    _page = 2;
  }

  @override
  void dispose() {
    _ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        SizedBox(
          height: 218,
          child: PageView.builder(
            controller: _ctl,
            padEnds: true,
            itemCount: _items.length + 1,
            itemBuilder: (_, i) {
              final diff = (_page - i).abs().clamp(0.0, 1.0);
              final scale = 1.0 - diff * 0.12;
              final fade = 1.0 - diff * 0.45;
              return Center(
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: fade,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 2),
                      child: i < _items.length
                          ? _metricTile(_items[i])
                          : _studyBarsTile(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
                _items.length + 1,
                (i) {
                  final active = _page.round() == i;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: active ? 16 : 5,
                    height: 5,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 2.5),
                    decoration: BoxDecoration(
                        color: active
                            ? AppColors.ink
                            : AppColors.ink20,
                        borderRadius: BorderRadius.circular(999)),
                  );
                })),
        const SizedBox(height: 2),
      ]);

  Widget _metricTile(_Metric m) => AppCard(
        padding: const EdgeInsets.fromLTRB(13, 12, 13, 10),
        color: m.barColor.withValues(alpha: 0.07),
        border: Border.all(color: m.barColor.withValues(alpha: 0.16)),
        onTap: () => widget.go(m.page),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: m.barColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: m.barColor.withValues(alpha: 0.30),
                            blurRadius: 8,
                            offset: const Offset(0, 3)),
                      ]),
                  child: Icon(m.icon, size: 15, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.2,
                                color: AppColors.ink60)),
                        Text(m.detail,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10, color: AppColors.ink40)),
                      ]),
                ),
                const Icon(Icons.arrow_outward_rounded,
                    size: 12, color: AppColors.ink40),
              ]),
              const SizedBox(height: 10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(m.value,
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.6,
                            height: 1)),
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                          color: m.up
                              ? AppColors.leafSoft
                              : AppColors.coralSoft,
                          borderRadius: BorderRadius.circular(999)),
                      child: Text(m.delta,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: m.up
                                  ? AppColors.leaf
                                  : AppColors.coral)),
                    ),
                  ]),
              const Spacer(),
              Text(m.note,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink80)),
              const SizedBox(height: 6),
              if (m.dots) _streakDots(m) else _sparkBars(m),
              const SizedBox(height: 7),
              Row(children: [
                for (final k in m.keys)
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                        color: m.barColor.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                            color: m.barColor.withValues(alpha: 0.20))),
                    child: Text(k,
                        style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: m.barColor == AppColors.sun
                                ? const Color(0xFF8A6E00)
                                : m.barColor)),
                  ),
              ]),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                      color: m.barColor.withValues(alpha: 0.15)),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: m.bar,
                    child: Container(color: m.barColor),
                  ),
                ),
              ),
            ]),
      );

  Widget _studyBarsTile() {
    const bars = [0.25, 0.4, 0.5, 0.75, 0.6, 0.35, 1.0];
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return AppCard(
      padding: const EdgeInsets.fromLTRB(13, 12, 13, 10),
      color: AppColors.grape.withValues(alpha: 0.07),
      border: Border.all(color: AppColors.grape.withValues(alpha: 0.16)),
      onTap: () => widget.go(S02Learn()),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: AppColors.grape,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grape.withValues(alpha: 0.30),
                          blurRadius: 8,
                          offset: const Offset(0, 3)),
                    ]),
                child: const Icon(Icons.schedule_rounded,
                    size: 15, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Study hours',
                          style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2,
                              color: AppColors.ink60)),
                      Text('Today 2.1 h • this week',
                          style: TextStyle(
                              fontSize: 10, color: AppColors.ink40)),
                    ]),
              ),
              Icon(Icons.arrow_outward_rounded,
                  size: 12, color: AppColors.ink40),
            ]),
            const SizedBox(height: 10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('16',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.6,
                          height: 1)),
                  const Text(' h',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink40)),
                  const SizedBox(width: 7),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                        color: AppColors.leafSoft,
                        borderRadius: BorderRadius.circular(999)),
                    child: const Text('+2%',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppColors.leaf)),
                  ),
                  const Spacer(),
                  const Text('2.1 h today',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ink40)),
                ]),
            const Spacer(),
            SizedBox(
              height: 50,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                      7,
                      (i) => Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 2),
                              height: 10 + bars[i] * 36,
                              decoration: BoxDecoration(
                                  color: i == 6
                                      ? AppColors.grape
                                      : AppColors.grape
                                          .withValues(alpha: 0.28),
                                  borderRadius:
                                      const BorderRadius.vertical(
                                          top:
                                              Radius.circular(4))),
                            ),
                          ))),
            ),
            const SizedBox(height: 4),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (final d in days)
                    Text(d,
                        style: const TextStyle(
                            fontSize: 8.5,
                            color: AppColors.ink40)),
                ]),
            const SizedBox(height: 7),
            Row(children: [
              for (final k in ['Best Sat', 'Avg 2.3 h'])
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                      color: AppColors.grape.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                          color: AppColors.grape
                              .withValues(alpha: 0.20))),
                  child: Text(k,
                      style: const TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grape)),
                ),
            ]),
          ]),
    );
  }
}

  Widget _sparkBars(_Metric m) => SizedBox(
        height: 34,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
                7,
                (i) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 1.5),
                        height: 5 + m.spark[i] * 27,
                        decoration: BoxDecoration(
                            color: m.spark[i] ==
                                    m.spark.reduce(
                                        (a, b) => a > b ? a : b)
                                ? m.barColor
                                : m.barColor
                                    .withValues(alpha: 0.25),
                            borderRadius:
                                const BorderRadius.vertical(
                                    top: Radius.circular(3))),
                      ),
                    ))),
      );

  Widget _streakDots(_Metric m) {
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              7,
              (i) => Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: m.spark[i] >= 1
                          ? AppColors.leaf
                          : AppColors.leafSoft,
                      shape: BoxShape.circle,
                      border: i == 6
                          ? Border.all(
                              color: AppColors.ink, width: 1.4)
                          : null,
                    ),
                    child: m.spark[i] >= 1
                        ? const Icon(Icons.check_rounded,
                            size: 9, color: Colors.white)
                        : null,
                  ))),
      const SizedBox(height: 3),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final d in days)
              SizedBox(
                width: 15,
                child: Text(d,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 7.5, color: AppColors.ink40)),
              ),
          ]),
    ]);
  }

class _Metric {
  final String label, value, note, detail, delta;
  final bool up;
  final double bar;
  final Color barColor;
  final IconData icon;
  final List<double> spark;
  final bool dots;
  final List<String> keys;
  final Widget page;
  const _Metric(
      this.label,
      this.value,
      this.note,
      this.detail,
      this.delta,
      this.up,
      this.bar,
      this.barColor,
      this.icon,
      this.spark,
      this.dots,
      this.keys,
      this.page);
}

class _HomeBlock {
  final String title, sub;
  final IconData icon;
  final Color bg, fg;
  final Widget page;
  final bool dark;
  const _HomeBlock({
    required this.title,
    required this.sub,
    required this.icon,
    required this.bg,
    required this.fg,
    required this.page,
    this.dark = false,
  });
}
