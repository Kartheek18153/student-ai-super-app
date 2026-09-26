import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S71–S73 Resume — auto-filled preview, AI fix-list with apply-all
/// (ATS 78→91), portfolio publish (§22). FUTURE.
class S24Resume extends StatefulWidget {
  const S24Resume({super.key});
  @override
  State<S24Resume> createState() => _S24ResumeState();
}

class _S24ResumeState extends State<S24Resume> {
  bool analyzed = false;
  bool applied = false;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Resume v2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            Pill(applied ? 'ATS 91' : 'ATS 78',
                bg: applied
                    ? AppColors.leaf.withValues(alpha: 0.15)
                    : Colors.white,
                fg: applied ? AppColors.leaf : AppColors.ink),
          ]),
          const Text('ATS fixes • portfolio sync', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20))),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Karthik S.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                      Text('CSE ’27 • Bangalore • CGPA 8.1',
                          style: TextStyle(
                              fontSize: 11, color: Colors.white60)),
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SKILLS',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.black45)),
                      Text('Python • Networking • SQL • Linux',
                          style: TextStyle(fontSize: 12.5)),
                      SizedBox(height: 6),
                      Text('PROJECTS',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.black45)),
                      Text(
                          'Packet sniffer (Python) • DBMS hospital DB',
                          style: TextStyle(fontSize: 12.5)),
                    ]),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
                child: OutlinedButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                            content:
                                Text('Inline editing lands with backend sync'))),
                    child: const Text('✏️ Edit',
                        style: TextStyle(fontSize: 12)))),
            const SizedBox(width: 6),
            Expanded(
                child: OutlinedButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                            content: Text('resume-v2.pdf exported ✓'))),
                    child: const Text('📄 PDF',
                        style: TextStyle(fontSize: 12)))),
            const SizedBox(width: 6),
            Expanded(
                child: FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: AppColors.grape),
                    onPressed: () =>
                        setState(() => analyzed = true),
                    child: const Text('✨ Analyze',
                        style: TextStyle(fontSize: 12)))),
          ]),
          if (analyzed) ...[
            const SizedBox(height: 10),
            AppCard(
              color: AppColors.grape,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ATS 78 → 91 • 3 FIXES',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    for (final f in [
                      'Quantify DBMS project: “queries ↓ 40%”',
                      'Add “Wireshark” — in 6 saved roles',
                      'One page: drop S1 electives',
                    ])
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(f,
                            style: const TextStyle(
                                fontSize: 12.5, color: Colors.white)),
                      ),
                    const SizedBox(height: 4),
                    PrimaryButton(applied ? 'Applied ✓' : 'Apply all →',
                        bg: Colors.white,
                        fg: AppColors.ink,
                        onTap: applied
                            ? null
                            : () =>
                                setState(() => applied = true)),
                  ]),
            ),
          ],
          const SizedBox(height: 10),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text('🌐 Portfolio',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                const Text('studentos.app/karthik • 2 projects • auto-syncs.',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () => ScaffoldMessenger.of(
                                  context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                                      'studentos.app/karthik — preview ✓'))),
                          child: const Text('Preview',
                              style: TextStyle(fontSize: 12)))),
                  const SizedBox(width: 6),
                  Expanded(
                      child: FilledButton(
                          onPressed: () => ScaffoldMessenger.of(
                                  context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                                      'Portfolio published ✓ — projects attached'))),
                          child: const Text('Publish',
                              style: TextStyle(fontSize: 12)))),
                ]),
              ])),
        ],
      );
}
