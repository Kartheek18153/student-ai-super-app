import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S92–S96 Projects — discover, run with milestones/tasks,
/// publish straight to resume + portfolio (§25). FUTURE.
class S28Projects extends StatefulWidget {
  const S28Projects({super.key});
  @override
  State<S28Projects> createState() => _S28ProjectsState();
}

class _S28ProjectsState extends State<S28Projects> {
  final milestones = {
    'Capture engine': true,
    'Protocol tree': true,
    'Demo video (due Fri)': false,
    'Publish + docs': false,
  };
  bool published = false;

  double get pct =>
      milestones.values.where((v) => v).length / milestones.length;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Projects',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Pill('+ New'),
              ]),
          const Text('Milestones • ship to portfolio', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          AppCard(
            border: Border.all(color: AppColors.ink, width: 2),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Pill('SECURITY', bg: AppColors.grape),
                        Text('🔥 active',
                            style: TextStyle(
                                fontSize: 11, color: Colors.black54)),
                      ]),
                  const SizedBox(height: 6),
                  const Text('Packet Sniffer',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                  const Text('Python • live capture + protocol tree',
                      style:
                          TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 10),
                  ProgressBar(pct, color: AppColors.ink),
                  Text(
                      'Milestone ${(pct * 4).round()}/4 • ${(pct * 100).round()}%',
                      style: const TextStyle(
                          fontSize: 11, color: Colors.black54)),
                ]),
          ),
          const SizedBox(height: 10),
          const SectionHead('Milestones'),
          AppCard(
              child: Column(
                  children: milestones.keys
                      .map((m) => CheckboxListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text(m,
                                style: const TextStyle(fontSize: 13)),
                            value: milestones[m],
                            activeColor: AppColors.leaf,
                            onChanged: (v) => setState(
                                () => milestones[m] = v ?? false),
                          ))
                      .toList())),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.ink,
            child: Row(children: [
              const Expanded(
                  child: Text(
                      'Ship → auto-attaches to Resume + Portfolio.',
                      style: TextStyle(
                          fontSize: 12.5, color: Colors.white))),
              const SizedBox(width: 8),
              FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: AppColors.lime),
                onPressed: published
                    ? null
                    : () {
                        setState(() => published = true);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Shipped ✓ — attached to Resume + Portfolio')));
                      },
                child: Text(published ? 'Live ✓' : 'Publish',
                    style: const TextStyle(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w800,
                        fontSize: 12)),
              ),
            ]),
          ),
        ],
      );
}
