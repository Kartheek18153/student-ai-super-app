import 'package:flutter/material.dart';
import 'package:student_ai_super_app/app_shell.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S57–S60 Setup — subject picker (min 3), CGPA goal stepper, career track,
/// parental-consent pending → approve preview (§38 onboarding order).
class S21Setup extends StatefulWidget {
  final bool minor;
  const S21Setup({super.key, this.minor = false});
  @override
  State<S21Setup> createState() => _S21SetupState();
}

class _S21SetupState extends State<S21Setup> {
  final picked = {'CN', 'DBMS', 'OS'};
  double cgpa = 8.2;
  String track = 'Cybersecurity';
  bool approved = false;

  static const _subs = ['CN', 'DBMS', 'OS', 'Maths', 'ML', 'Security'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Setup your semester')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('STEP 1 OF 2 • Pick subjects (${picked.length}/6)',
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.black45)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.4,
              children: [
                for (final s in _subs)
                  GestureDetector(
                    onTap: () => setState(() => picked.contains(s)
                        ? picked.remove(s)
                        : picked.add(s)),
                    child: AppCard(
                      border: picked.contains(s)
                          ? Border.all(
                              color: AppColors.ink, width: 2)
                          : null,
                      child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(s,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800)),
                            Icon(
                                picked.contains(s)
                                    ? Icons.check_circle
                                    : Icons.add_circle_outline,
                                color: picked.contains(s)
                                    ? AppColors.leaf
                                    : Colors.black26),
                          ]),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('STEP 2 • GOALS',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.black45)),
            const SizedBox(height: 10),
            AppCard(
                child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('🎯 CGPA goal',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    Text(cgpa.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900)),
                  ]),
              Slider(
                  value: cgpa,
                  min: 6,
                  max: 10,
                  divisions: 8,
                  activeColor: AppColors.ink,
                  onChanged: (v) => setState(() => cgpa = v)),
              Wrap(spacing: 6, children: [
                for (final t in ['Cybersecurity', 'SDE', 'Data'])
                  ChoiceChip(
                    label: Text(t,
                        style: const TextStyle(fontSize: 11.5)),
                    selected: track == t,
                    selectedColor: AppColors.ink,
                    labelStyle: TextStyle(
                        color: track == t
                            ? Colors.white
                            : AppColors.ink,
                        fontWeight: FontWeight.w700),
                    onSelected: (_) =>
                        setState(() => track = t),
                  ),
              ]),
            ])),
            if (widget.minor) ...[
              const SizedBox(height: 10),
              AppCard(
                color: approved
                    ? AppColors.leaf.withValues(alpha: 0.1)
                    : AppColors.sun.withValues(alpha: 0.15),
                border: Border.all(
                    color: approved
                        ? AppColors.leaf.withValues(alpha: 0.4)
                        : AppColors.sun.withValues(alpha: 0.5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          approved
                              ? '✅ Guardian approved'
                              : '🧒 Waiting for guardian…',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800)),
                      const Text(
                          'Meera • SMS + email • guardian keeps view-only progress + revoke-anytime.',
                          style: TextStyle(
                              fontSize: 12, color: Colors.black54)),
                      if (!approved)
                        TextButton(
                            onPressed: () =>
                                setState(() => approved = true),
                            child: const Text(
                                'Simulate approval (demo)',
                                style: TextStyle(fontSize: 12))),
                    ]),
              ),
            ],
            const SizedBox(height: 10),
            PrimaryButton(
                'Build my dashboard →',
                onTap: picked.length >= 3 &&
                        (!widget.minor || approved)
                    ? () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AppShell()),
                        (_) => false)
                    : null),
            if (picked.length < 3)
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text('Pick at least 3 subjects to continue.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 12, color: Colors.black45)),
              ),
          ],
        ),
      );
}
