import 'package:flutter/material.dart';
import '../../data/demo_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/ai_study/s03_ai_study.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/revision/s05_revision.dart';
import 'package:student_ai_super_app/features/materials/s11_materials.dart';
import 'package:student_ai_super_app/features/notes/s12_notes.dart';

/// S02 Learn — Subject → Unit → Chapter → Topic
class S02Learn extends StatelessWidget {
  const S02Learn({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Learn', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
              Text('Subject → Units → Chapters → Topics', style: TextStyle(fontSize: 12, color: AppColors.ink60)),
            ])),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.leafSoft, borderRadius: BorderRadius.circular(999)), child: const Text('6 subjects', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.leaf))),
          ]),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded, size: 20),
              hintText: 'Search subjects, chapters, topics…',
              suffixIcon: Container(margin: const EdgeInsets.all(6), padding: const EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(999)), child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.tune_rounded, size: 14, color: Colors.white), SizedBox(width: 4), Text('Filter', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white))])),
            ),
          ),
          const SizedBox(height: 12),
          // Featured subject: CN
          AppCard(
            border: Border.all(color: AppColors.ink, width: 1.6),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(width: 38, height: 38, decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(10)), child: const Center(child: Text('CN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12)))),
                const SizedBox(width: 10),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Computer Networks', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                  Text('5 units • 12 topics • VTU Sem 6', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
                ])),
                Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4), decoration: BoxDecoration(color: AppColors.leafSoft, borderRadius: BorderRadius.circular(999)), child: const Text('65% done', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.leaf))),
              ]),
              const SizedBox(height: 12),
              _unitRow('U1  Intro + Models', 1.0, AppColors.leaf, true),
              _unitRow('U2  Data Link Layer', 1.0, AppColors.leaf, true),
              // Active unit — highlighted
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.sun.withValues(alpha: 0.35))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('U3  Network Layer', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.sun, borderRadius: BorderRadius.circular(999)), child: const Text('65%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800))),
                  ]),
                  const SizedBox(height: 8),
                  _topicDone('IP addressing'),
                  const SizedBox(height: 6),
                  // Focus topic — dark card with actions
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(12)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        const Text('◉ Routing algorithms', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2), decoration: BoxDecoration(color: AppColors.sun, borderRadius: BorderRadius.circular(999)), child: const Text('55%', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800))),
                      ]),
                      const SizedBox(height: 8),
                      Wrap(spacing: 5, runSpacing: 5, children: [
                        for (final l in <(String, Widget, IconData)>[
                          ('Material', const S11Materials(), Icons.description_rounded),
                          ('Notes', const S12Notes(), Icons.edit_note_rounded),
                          ('AI explain', const S03AiStudy(), Icons.auto_awesome_rounded),
                          ('12 Qs', const S04Tests(), Icons.help_outline_rounded),
                          ('Test', const S04Tests(), Icons.quiz_rounded),
                          ('Revise', const S05Revision(), Icons.replay_rounded),
                        ])
                          ActionChip(
                            avatar: Icon(l.$3, size: 12, color: Colors.white70),
                            label: Text(l.$1, style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w600)),
                            backgroundColor: Colors.white.withValues(alpha: 0.14),
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () => Nav.go(context, l.$2),
                          ),
                      ]),
                    ]),
                  ),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Icon(Icons.error_outline_rounded, size: 13, color: AppColors.coral),
                    const SizedBox(width: 4),
                    const Text('Congestion control — 40% weak', style: TextStyle(fontSize: 12.5, color: AppColors.coral, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    GestureDetector(onTap: () => Nav.go(context, const S05Revision()), child: const Text('Revise →', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.coral))),
                  ]),
                ]),
              ),
              _unitRow('U4  Transport Layer', 0.45, AppColors.sun, false),
              _unitRow('U5  Application Layer', 0.0, AppColors.ink20, false),
            ]),
          ),
          const SizedBox(height: 10),
          for (final s in Demo.subjects.skip(1))
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                onTap: () {},
                child: Row(children: [
                  Container(width: 36, height: 36, decoration: BoxDecoration(color: s.color.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(10)), child: Center(child: Text(s.code, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 11, color: s.color)))),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(s.name, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    ProgressBar(s.pct, color: s.color, height: 5),
                  ])),
                  const SizedBox(width: 10),
                  Text('${(s.pct * 100).round()}%', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: s.color)),
                  const SizedBox(width: 4),
                  const Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.ink40),
                ]),
              ),
            ),
        ],
      );

  static Widget _unitRow(String t, double v, Color c, bool done) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          Icon(done ? Icons.check_circle_rounded : Icons.circle_outlined, size: 16, color: c),
          const SizedBox(width: 8),
          Expanded(child: Text(t, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: done ? AppColors.ink : AppColors.ink60))),
          Text('${(v * 100).round()}%', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: c)),
          const SizedBox(width: 8),
          SizedBox(width: 48, child: ProgressBar(v, color: c, height: 4)),
        ]),
      );

  static Widget _topicDone(String t) => Row(children: [
        const Icon(Icons.check_circle_rounded, size: 13, color: AppColors.leaf),
        const SizedBox(width: 6),
        Text(t, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
        const Spacer(),
        const Text('✓', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.leaf)),
      ]);
}
