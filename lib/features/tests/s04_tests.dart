import 'dart:async';
import 'package:flutter/material.dart';
import '../../data/demo_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/mastery/flow_mastery.dart';

/// S04 Tests — playable sprint with timer, progress, and result dialog.
class S04Tests extends StatefulWidget {
  const S04Tests({super.key});
  @override
  State<S04Tests> createState() => _S04TestsState();
}

class _S04TestsState extends State<S04Tests> {
  int qi = 0;
  late List<int> ans;
  int sec = 300;
  Timer? tick;

  @override
  void initState() {
    super.initState();
    ans = List.filled(Demo.quiz.length, -1);
    tick = Timer.periodic(const Duration(seconds: 1), (t) {
      if (sec <= 1) { t.cancel(); _finish(); return; }
      setState(() => sec--);
    });
  }

  @override
  void dispose() { tick?.cancel(); super.dispose(); }
  String get clock => '${sec ~/ 60}:${(sec % 60).toString().padLeft(2, '0')}';

  void _finish() {
    tick?.cancel();
    int c = 0;
    final per = <String, List<int>>{};
    for (var i = 0; i < Demo.quiz.length; i++) {
      final q = Demo.quiz[i];
      per.putIfAbsent(q.topic, () => [0, 0]);
      per[q.topic]![1]++;
      if (ans[i] == q.answer) { c++; per[q.topic]![0]++; }
    }
    final pct = (c / Demo.quiz.length * 100).round();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Text(pct >= 80 ? '🎉  $pct% — Nice work!' : 'You scored $pct%', style: const TextStyle(fontWeight: FontWeight.w900)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: pct >= 80 ? AppColors.leafSoft : AppColors.sunSoft, borderRadius: BorderRadius.circular(12)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('$c', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: pct >= 80 ? AppColors.leaf : const Color(0xFF8A6E00))),
              Text(' / ${Demo.quiz.length}', style: const TextStyle(fontSize: 16, color: AppColors.ink60)),
              const SizedBox(width: 10),
              Text(pct >= 80 ? 'Passed' : 'Keep going', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: pct >= 80 ? AppColors.leaf : const Color(0xFF8A6E00))),
            ]),
          ),
          const SizedBox(height: 12),
          for (final t in per.keys)
            Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(t, style: const TextStyle(fontSize: 13)),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: per[t]![0] / per[t]![1] < 0.6 ? AppColors.coralSoft : AppColors.leafSoft, borderRadius: BorderRadius.circular(999)), child: Text('${(per[t]![0] / per[t]![1] * 100).round()}%${per[t]![0] / per[t]![1] < 0.6 ? ' • weak' : ''}', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: per[t]![0] / per[t]![1] < 0.6 ? AppColors.coral : AppColors.leaf))),
            ])),
          const SizedBox(height: 8),
          Text(pct >= 80 ? 'Weak cleared — loop closed!' : 'Retake recommended — revision queued.', style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.ink60)),
        ]),
        actions: [
          TextButton(onPressed: () { Navigator.pop(context); setState(() { qi = 0; ans = List.filled(Demo.quiz.length, -1); sec = 300; }); }, child: const Text('↻ Retry')),
          FilledButton(onPressed: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const FlowMastery())); }, child: const Text('Mastery flow →')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = Demo.quiz[qi];
    final answered = ans.where((a) => a >= 0).length;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      children: [
        // Top meta bar
        Row(children: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColors.grapeSoft, borderRadius: BorderRadius.circular(999)), child: const Text('CN SPRINT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.6, color: AppColors.grape))),
          const SizedBox(width: 8),
          Text('Q${qi + 1} / ${Demo.quiz.length}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.ink60)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: sec < 60 ? AppColors.coralSoft : AppColors.ink, borderRadius: BorderRadius.circular(999)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.timer_outlined, size: 13, color: sec < 60 ? AppColors.coral : Colors.white),
              const SizedBox(width: 4),
              Text(clock, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: sec < 60 ? AppColors.coral : Colors.white, fontFeatures: const [FontFeature.tabularFigures()])),
            ]),
          ),
        ]),
        const SizedBox(height: 10),
        // Progress
        Row(children: [
          Expanded(child: ProgressBar((qi) / Demo.quiz.length, color: AppColors.grape, height: 6)),
          const SizedBox(width: 10),
          Text('$answered/${Demo.quiz.length} answered', style: const TextStyle(fontSize: 11, color: AppColors.ink60, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 12),
        // Question card
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              SoftPill(q.tag, color: AppColors.grape),
              const Spacer(),
              Text('Q${qi + 1}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.ink40)),
            ]),
            const SizedBox(height: 12),
            Text(q.stem, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, height: 1.4)),
            const SizedBox(height: 14),
            for (var i = 0; i < q.options.length; i++)
              GestureDetector(
                onTap: () => setState(() => ans[qi] = i),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: ans[qi] == i ? AppColors.ink : AppColors.line, width: ans[qi] == i ? 1.8 : 1),
                    color: ans[qi] == i ? AppColors.ink.withValues(alpha: 0.04) : Colors.white,
                  ),
                  child: Row(children: [
                    Container(
                      width: 26, height: 26,
                      decoration: BoxDecoration(color: ans[qi] == i ? AppColors.ink : AppColors.creamDeep, shape: BoxShape.circle, border: Border.all(color: ans[qi] == i ? AppColors.ink : AppColors.line)),
                      child: Center(child: Text(String.fromCharCode(65 + i), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ans[qi] == i ? Colors.white : AppColors.ink60))),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(q.options[i], style: TextStyle(fontSize: 13, fontWeight: ans[qi] == i ? FontWeight.w700 : FontWeight.w500, color: ans[qi] == i ? AppColors.ink : AppColors.ink80))),
                    if (ans[qi] == i) const Icon(Icons.check_circle_rounded, size: 18, color: AppColors.ink),
                  ]),
                ),
              ),
          ]),
        ),
        const SizedBox(height: 12),
        // Nav
        Row(children: [
          if (qi > 0) Expanded(child: OutlinedButton(onPressed: () => setState(() => qi--), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13), side: const BorderSide(color: AppColors.line), shape: const StadiumBorder()), child: const Text('← Previous'))),
          if (qi > 0) const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: FilledButton(
              onPressed: ans[qi] < 0 ? null : () { if (qi < Demo.quiz.length - 1) { setState(() => qi++); } else { _finish(); } },
              style: FilledButton.styleFrom(backgroundColor: ans[qi] < 0 ? AppColors.ink20 : AppColors.ink, foregroundColor: ans[qi] < 0 ? AppColors.ink40 : Colors.white, padding: const EdgeInsets.symmetric(vertical: 13), shape: const StadiumBorder()),
              child: Text(ans[qi] < 0 ? 'Select an answer' : (qi < Demo.quiz.length - 1 ? 'Next  →' : 'Finish & see score')),
            ),
          ),
        ]),
        const SizedBox(height: 8),
        // Dots
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var i = 0; i < Demo.quiz.length; i++)
            Container(
              width: ans[i] >= 0 ? 18 : 8, height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(color: i == qi ? AppColors.ink : (ans[i] >= 0 ? AppColors.grapeMid : AppColors.line), borderRadius: BorderRadius.circular(999)),
            ),
        ]),
      ],
    );
  }
}
