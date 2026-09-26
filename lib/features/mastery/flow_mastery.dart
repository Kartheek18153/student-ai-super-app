import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/revision/s05_revision.dart';

/// ★ Mastery Flow — Congestion 40→80 in 6 steps (§4 loop as one journey).
/// Practice self-check gates the retest at 4+/5 (mirrors web build JS).
class FlowMastery extends StatefulWidget {
  const FlowMastery({super.key});
  @override
  State<FlowMastery> createState() => _FlowMasteryState();
}

class _FlowMasteryState extends State<FlowMastery> {
  int step = 0;
  final Map<int, bool> marked = {};
  int get got => marked.values.where((v) => v).length;

  static const _practice = [
    ('cwnd=10, timeout → ssthresh?', '5 MSS — half, then restart from 1.'),
    ('SS: cwnd 1→? after 3 clean RTTs?', '8 MSS — doubles per RTT.'),
    ('Reno, 3 dup-ACKs at cwnd 12?', 'cwnd=6, fast recovery — no restart.'),
    ('Why does ssthresh exist?', 'Remembers last safe speed.'),
    ('AIMD in one line?', 'Additive increase, multiplicative decrease.'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text('Congestion 40→80',
                style: TextStyle(fontWeight: FontWeight.w800))),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    6,
                    (i) => Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == step
                                  ? (step == 5
                                      ? AppColors.leaf
                                      : AppColors.ink)
                                  : (i < step
                                      ? AppColors.leaf
                                      : Colors.white),
                              border: Border.all(color: Colors.black12)),
                          child: Center(
                              child: Text('${i + 1}',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: i == step || i < step
                                          ? Colors.white
                                          : Colors.black54))),
                        ))),
          ),
          Expanded(
              child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [_body()])),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Row(children: [
              if (step > 0)
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => setState(() => step--),
                        child: const Text('← Back'))),
              if (step > 0) const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: PrimaryButton(
                    step == 5
                        ? 'Done 🎓'
                        : (step == 3
                            ? (got >= 4
                                ? 'Unlocked — retest →'
                                : 'Score 4+ to continue 🔒 ($got/5)')
                            : 'Next →'),
                    onTap: _canNext()
                        ? () => setState(() => step == 5
                            ? Navigator.pop(context)
                            : step++)
                        : null),
              ),
            ]),
          ),
        ]),
      );

  bool _canNext() => step != 3 || got >= 4;

  Widget _body() {
    switch (step) {
      case 0:
        return const AppCard(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('STEP 1 • DIAGNOSE',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppColors.coral)),
              SizedBox(height: 4),
              Text('Autopsy: 2/5 correct',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              SizedBox(height: 8),
              Text('Q7 ✗ ssthresh — halves, not resets',
                  style: TextStyle(fontSize: 13)),
              Text('Q9 ✗ growth math — per-ACK, not per-RTT',
                  style: TextStyle(fontSize: 13)),
              Text('Q12 ✗ Tahoe vs Reno merged',
                  style: TextStyle(fontSize: 13)),
              Text('Q6 ✓ Q10 ✓ AIMD basics solid',
                  style: TextStyle(fontSize: 13, color: AppColors.leaf)),
            ]));
      case 1:
        return const AppCard(
            color: AppColors.ink,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('STEP 2 • AI EXPLAINS',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white60)),
                  SizedBox(height: 4),
                  Text(
                      'Timeout = road blocked. New limit = half your old speed (ssthresh = cwnd/2), restart from a crawl.',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  SizedBox(height: 8),
                  Text(
                      'Exam version: ssthresh=cwnd/2, cwnd=1 MSS, slow-start resumes. 3 dup-ACKs (Reno) halve without restart; Tahoe always restarts.',
                      style:
                          TextStyle(fontSize: 12.5, color: Colors.white70)),
                ]));
      case 2:
        return const AppCard(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('STEP 3 • NOTE CAPTURED ✓',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: AppColors.sun)),
                  SizedBox(height: 4),
                  Text('Timeout ≠ dup-ACK. SS exponential, CA linear.',
                      style: TextStyle(fontSize: 13.5)),
                  SizedBox(height: 6),
                  Text('ssthresh = cwnd/2\nSS: +1/ACK • CA: +1/RTT',
                      style: TextStyle(
                          fontFamily: 'monospace', fontSize: 12.5)),
                  SizedBox(height: 6),
                  Text('Auto-linked to revision queue 📌',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ]));
      case 3:
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('STEP 4 • PRACTICE — $got/5 banked',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              for (var i = 0; i < _practice.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppCard(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('P${i + 1}. ${_practice[i].$1}',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w700)),
                        if (marked.containsKey(i))
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                                '${marked[i]! ? '✓' : '✗'} ${_practice[i].$2}',
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    color: marked[i]!
                                        ? AppColors.leaf
                                        : AppColors.coral)),
                          )
                        else
                          Row(children: [
                            const SizedBox(height: 40),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () =>
                                        setState(() => marked[i] = true),
                                    child: const Text('Got it ✓'))),
                            const SizedBox(width: 6),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () =>
                                        setState(() => marked[i] = false),
                                    child: const Text('Missed ✗'))),
                          ]),
                      ])),
                ),
            ]);
      case 4:
        return AppCard(
            child: Column(children: [
          const Text('STEP 5 • RETEST',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800)),
          const Text('80%',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900)),
          const Text('was 40% • +40 pts',
              style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 10),
          PrimaryButton('Play full retest',
              bg: AppColors.lime,
              fg: AppColors.ink,
              onTap: () => Nav.go(context, const S04Tests())),
        ]));
      default:
        return Column(children: [
          const AppCard(
              color: AppColors.leaf,
              child: Column(children: [
                Text('STEP 6 • LOOP CLOSED 🎉',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white70)),
                Text('40% → 80% in 32 min',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              ])),
          const SizedBox(height: 8),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text('Next AI pick: Routing (55%)',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                PrimaryButton('Open revision queue',
                    onTap: () =>
                        Nav.go(context, const S05Revision())),
              ])),
        ]);
    }
  }
}
