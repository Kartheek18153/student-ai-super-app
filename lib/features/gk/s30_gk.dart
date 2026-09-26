import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S103–S108 GK & Affairs — 5-min feed, playable daily quiz with
/// streak + result (§27). FUTURE.
class S30Gk extends StatefulWidget {
  const S30Gk({super.key});
  @override
  State<S30Gk> createState() => _S30GkState();
}

class _S30GkState extends State<S30Gk> {
  bool playing = false;
  int qi = 0;
  int correct = 0;

  static const _qs = [
    ('Which body allocates IP addresses globally?',
        ['IEEE', 'IANA/ICANN', 'W3C', 'ITU'], 1),
    ('6G trials recently hit what lab record?',
        ['100 Gbps', '1 Tbps', '10 Tbps', '1 Gbps'], 1),
    ('Count-to-infinity only affects…',
        ['Link-state', 'Distance-vector', 'BGP', 'OSPF'], 1),
  ];

  @override
  Widget build(BuildContext context) {
    if (!playing) {
      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Pill('24 Sep • 5 min'),
              ]),
          const Text('5-min feed • daily quiz • streak', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          const AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Pill('NATIONAL', bg: Color(0x1AFF4A3D), fg: AppColors.coral),
                SizedBox(height: 6),
                Text('Semiconductor mission: 3rd fab approved',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                Text('Why it matters for ECE/CSE placements →',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
              ])),
          const SizedBox(height: 10),
          const AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Pill('TECH', bg: Color(0x1A4A7CFF), fg: AppColors.sky),
                SizedBox(height: 6),
                Text('6G trials hit 1 Tbps lab record',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                Text('Links to your CN syllabus: U5 📡',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
              ])),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.grape,
            child: Row(children: [
              const Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text('Daily GK Quiz',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                    Text('10 Qs • 4 min • streak +1 🔥',
                        style: TextStyle(
                            fontSize: 11.5, color: Colors.white70)),
                  ])),
              FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12)),
                onPressed: () => setState(() {
                  playing = true;
                  qi = 0;
                  correct = 0;
                }),
                child: const Icon(Icons.play_arrow,
                    color: AppColors.grape),
              ),
            ]),
          ),
        ],
      );
    }
    if (qi >= _qs.length) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AppCard(
              child: Column(children: [
            Text('$correct/${_qs.length} 🎉',
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w900)),
            const Text('Streak 4 🔥 • 2 saved • seminar pack updated',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5, color: Colors.black54)),
            const SizedBox(height: 10),
            PrimaryButton('Back to feed',
                onTap: () => setState(() => playing = false)),
          ])),
        ),
      );
    }
    final q = _qs[qi];
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      children: [
        Text('GK Quiz • Q${qi + 1}/${_qs.length}',
            style: const TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        ProgressBar((qi) / _qs.length, color: AppColors.grape),
        const SizedBox(height: 10),
        AppCard(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(q.$1,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              for (var i = 0; i < q.$2.length; i++)
                GestureDetector(
                  onTap: () => setState(() {
                    if (i == q.$3) correct++;
                    qi++;
                  }),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(14)),
                    child: Text(q.$2[i],
                        style: const TextStyle(fontSize: 12.5)),
                  ),
                ),
            ])),
      ],
    );
  }
}
