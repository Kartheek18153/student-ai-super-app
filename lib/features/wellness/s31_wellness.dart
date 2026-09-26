import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S109–S112 Wellness — focus/rest balance, water + steps counters,
/// break nudge. Study balance only, never medical/diet (§28). FUTURE.
class S31Wellness extends StatefulWidget {
  const S31Wellness({super.key});
  @override
  State<S31Wellness> createState() => _S31WellnessState();
}

class _S31WellnessState extends State<S31Wellness> {
  int water = 5;
  int steps = 4200;
  bool resting = false;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Text('Balance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const Text('Focus • water • breaks — study balance only', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.ink,
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('FOCUS TODAY',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Colors.white60)),
                        Text('3h 20m • on plan ✓',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: AppColors.lime)),
                      ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Expanded(
                        flex: 3,
                        child: ProgressBar(1.0, color: AppColors.lime)),
                    SizedBox(width: 4),
                    Expanded(
                        flex: 1,
                        child: ProgressBar(1.0, color: Colors.white24)),
                    SizedBox(width: 4),
                    Expanded(
                        flex: 2,
                        child: ProgressBar(1.0, color: AppColors.grape)),
                  ]),
                  SizedBox(height: 4),
                  Text('■ FOCUS 3.3h   ■ BREAK 1.1h   ■ CLASSES 2h',
                      style:
                          TextStyle(fontSize: 10, color: Colors.white60)),
                ]),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
              child: AppCard(
                  child: Column(children: [
                const Text('💧', style: TextStyle(fontSize: 24)),
                Text('$water/8 glasses',
                    style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                ProgressBar(water / 8, color: AppColors.sky),
                TextButton(
                    onPressed: () =>
                        setState(() => water = (water + 1).clamp(0, 8)),
                    child: const Text('+1 glass',
                        style: TextStyle(fontSize: 12))),
              ])),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppCard(
                  child: Column(children: [
                const Text('🚶', style: TextStyle(fontSize: 24)),
                Text('${(steps / 1000).toStringAsFixed(1)}k steps',
                    style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                ProgressBar(steps / 8000, color: AppColors.leaf),
                TextButton(
                    onPressed: () => setState(() => steps += 500),
                    child: const Text('+500 steps',
                        style: TextStyle(fontSize: 12))),
              ])),
            ),
          ]),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.sun.withValues(alpha: 0.15),
            border:
                Border.all(color: AppColors.sun.withValues(alpha: 0.5)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      resting
                          ? '⏸ Enjoy the stretch ✓'
                          : '⏸ Break in 10 min',
                      style: const TextStyle(
                          fontWeight: FontWeight.w800)),
                  const Text(
                      '50-min CN sprint nearly done — stretch + water, then DBMS.',
                      style:
                          TextStyle(fontSize: 12.5, color: Colors.black54)),
                  const SizedBox(height: 10),
                  Row(children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Snooze 5m',
                                style: TextStyle(fontSize: 12)))),
                    const SizedBox(width: 8),
                    Expanded(
                        child: FilledButton(
                            onPressed: resting
                                ? null
                                : () =>
                                    setState(() => resting = true),
                            child: Text(
                                resting ? 'Resting ✓' : 'Take now',
                                style:
                                    const TextStyle(fontSize: 12)))),
                  ]),
                ]),
          ),
        ],
      );
}
