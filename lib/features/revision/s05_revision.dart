import 'package:flutter/material.dart';
import '../../data/demo_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/notes/s12_notes.dart';

/// S05 Revision — weak-topic queue, no flashcards.
class S05Revision extends StatefulWidget {
  const S05Revision({super.key});
  @override
  State<S05Revision> createState() => _S05RevisionState();
}

class _S05RevisionState extends State<S05Revision> {
  final steps = {'note': true, 'practice': false, 'retest': false};

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.coralSoft, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.replay_rounded, size: 18, color: AppColors.coral)),
            const SizedBox(width: 10),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Revision queue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              Text('From CN Mock • 6 wrong • 2 weak topics', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
            ])),
            const Pill('2 topics', bg: AppColors.coral, fg: Colors.white),
          ]),
          const SizedBox(height: 14),
          AppCard(
            border: Border.all(color: AppColors.coral.withValues(alpha: 0.22)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.coralSoft, borderRadius: BorderRadius.circular(999)), child: const Text('CONGESTION  •  40%', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: AppColors.coral))),
                const Spacer(),
                const Text('2 / 5 correct', style: TextStyle(fontSize: 11, color: AppColors.ink60, fontWeight: FontWeight.w600)),
              ]),
              const SizedBox(height: 12),
              _step('note', 'Read note — cwnd vs rwnd', '5 min'),
              _step('practice', 'Practice 5 Qs', 'Now'),
              _step('retest', 'Retake mini-test', ''),
              const SizedBox(height: 10),
              PrimaryButton('Open note  →', onTap: () => Nav.go(context, const S12Notes())),
            ]),
          ),
          const SizedBox(height: 8),
          AppCard(
            border: Border.all(color: AppColors.sun.withValues(alpha: 0.28)),
            child: Row(children: [
              Container(padding: const EdgeInsets.all(7), decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.warning_amber_rounded, size: 14, color: Color(0xFF8A6E00))),
              const SizedBox(width: 10),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('ROUTING  •  55%', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: Color(0xFF8A6E00))),
                SizedBox(height: 2),
                Text('Review Dijkstra + Link State note → practice → retake.', style: TextStyle(fontSize: 12.5, color: AppColors.ink80)),
              ])),
            ]),
          ),
          const SizedBox(height: 12),
          const SectionHead('Syllabus — CN 54%'),
          AppCard(
            child: Column(children: [
              for (final u in ['U1  Intro  •  100%', 'U2  Data Link  •  100%', 'U3  Network  •  65%', 'U4  Transport  •  45%', 'U5  Application  •  0%'])
                Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Row(children: [
                  Expanded(child: Text(u, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600))),
                  const SizedBox(width: 12),
                  Expanded(child: ProgressBar(u.contains('100%') ? 1 : u.contains('65%') ? 0.65 : u.contains('45%') ? 0.45 : 0, color: u.contains('100%') ? AppColors.leaf : u.contains('65%') ? AppColors.grape : AppColors.ink20, height: 5)),
                ])),
            ]),
          ),
          const SizedBox(height: 12),
          PrimaryButton('Retake now  →', bg: (steps['note']! && steps['practice']!) ? AppColors.ink : AppColors.ink20, fg: (steps['note']! && steps['practice']!) ? Colors.white : AppColors.ink40, onTap: (steps['note']! && steps['practice']!) ? () => Nav.go(context, const S04Tests()) : null),
          const SizedBox(height: 6),
          Text(Demo.weak.map((w) => '${w.name} ${w.pct}%').join('  •  '), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: AppColors.ink40)),
        ],
      );

  Widget _step(String key, String label, String tag) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: InkWell(
          onTap: () => setState(() => steps[key] = !(steps[key]!)),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(color: steps[key]! ? AppColors.leafSoft : AppColors.creamDeep, borderRadius: BorderRadius.circular(12), border: Border.all(color: steps[key]! ? AppColors.leaf.withValues(alpha: 0.25) : AppColors.line)),
            child: Row(children: [
              Icon(steps[key]! ? Icons.check_circle_rounded : Icons.circle_outlined, size: 18, color: steps[key]! ? AppColors.leaf : AppColors.ink40),
              const SizedBox(width: 9),
              Expanded(child: Text(label, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: steps[key]! ? AppColors.ink : AppColors.ink60, decoration: steps[key]! ? TextDecoration.lineThrough : null))),
              if (tag.isNotEmpty) Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3), decoration: BoxDecoration(color: tag == 'Now' ? AppColors.sun : AppColors.ink20, borderRadius: BorderRadius.circular(999)), child: Text(tag, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: tag == 'Now' ? AppColors.ink : AppColors.ink60))),
            ]),
          ),
        ),
      );
}
