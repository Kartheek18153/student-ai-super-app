import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/resume/s24_resume.dart';

/// S66–S70 Prep — readiness, checklist, live mock player with timer,
/// transcript, retry + prior feedback (§22). FUTURE.
class S23Prep extends StatelessWidget {
  const S23Prep({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Text('Placement prep',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const Text('Mocks • readiness • feedback', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          const AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(children: [
                  Expanded(
                    child: Text('Readiness • 42%',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  SizedBox(width: 8),
                  Text('12 / 28 tasks',
                      style: TextStyle(
                          fontSize: 11, color: Colors.black54)),
                ]),
                SizedBox(height: 10),
                ProgressBar(0.42, color: AppColors.grape),
              ])),
          const SizedBox(height: 10),
          AppCard(
              border: Border.all(color: AppColors.ink, width: 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('🎤 Mock interview #3',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800)),
                    const Text('Networking + HR • 30 min • AI panel',
                        style: TextStyle(
                            fontSize: 12, color: Colors.black54)),
                    const SizedBox(height: 10),
                    PrimaryButton('Start →',
                        bg: AppColors.lime,
                        fg: AppColors.ink,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const MockPlayer()))),
                  ])),
          const SizedBox(height: 10),
          OutlinedButton(
              onPressed: () =>
                  Nav.go(context, const S24Resume()),
              child: const Text('Open resume builder →',
                  style: TextStyle(fontSize: 12.5))),
          const SizedBox(height: 10),
          const AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('📊 Last mock feedback',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                SizedBox(height: 4),
                Text(
                    'Clarity 7 • Depth 5 • Fix: structure with SYN→data→FIN phases.',
                    style: TextStyle(fontSize: 12.5)),
              ])),
        ],
      );
}

class MockPlayer extends StatefulWidget {
  const MockPlayer({super.key});
  @override
  State<MockPlayer> createState() => _MockPlayerState();
}

class _MockPlayerState extends State<MockPlayer> {
  int sec = 760;
  Timer? tick;
  bool done = false;

  @override
  void initState() {
    super.initState();
    tick = Timer.periodic(const Duration(seconds: 1), (t) {
      if (sec <= 1) {
        t.cancel();
        if (mounted) setState(() => done = true);
        return;
      }
      setState(() => sec--);
    });
  }

  @override
  void dispose() {
    tick?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('🎤 Mock #3 • Q2/8')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Pill('TECHNICAL • NETWORKING',
                      bg: Color(0x1A4A7CFF), fg: AppColors.sky),
                  Pill(
                      '● ${sec ~/ 60}:${(sec % 60).toString().padLeft(2, '0')}',
                      bg: AppColors.coral),
                ]),
            const SizedBox(height: 10),
            const ProgressBar(0.25, color: AppColors.coral),
            const SizedBox(height: 10),
            const AppCard(
                child: Text(
                    '“Your download stalls at 50% every time. Walk me through the TCP states you’d check.”',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700))),
            const SizedBox(height: 10),
            AppCard(
              color: AppColors.ink,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Your answer (transcript)',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                    const Text(
                        '“I’d check cwnd vs rwnd, look for… uh, retransmissions…”',
                        style: TextStyle(
                            fontSize: 12.5, color: Colors.white70)),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                          child: PrimaryButton(done ? 'Scored ✓' : '⏹ Finish',
                              bg: AppColors.lime,
                              fg: AppColors.ink,
                              onTap: done
                                  ? null
                                  : () {
                                      tick?.cancel();
                                      setState(() => done = true);
                                    })),
                      const SizedBox(width: 8),
                      Expanded(
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                      color: Colors.white24)),
                              onPressed: () {},
                              child: const Text('↻ Retry'))),
                    ]),
                    if (done)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                            'AI score: Clarity 8 • Depth 6 — better structure than #2 ✓',
                            style: TextStyle(
                                fontSize: 12.5,
                                color: AppColors.lime,
                                fontWeight: FontWeight.w700)),
                      ),
                  ]),
            ),
          ],
        ),
      );
}
