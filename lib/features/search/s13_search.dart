import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/learn/s02_learn.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/pyq/s10_pyq.dart';
import 'package:student_ai_super_app/features/notes/s12_notes.dart';

/// S32–S33 Global Search — one bar across topics, notes, tests, PYQ (§21).
class S13Search extends StatefulWidget {
  const S13Search({super.key});
  @override
  State<S13Search> createState() => _S13SearchState();
}

class _S13SearchState extends State<S13Search> {
  String q = 'congestion control';
  String type = 'All';

  static const _index = [
    ('Topic', '📡 U3 • Congestion control — CN', '40%', AppColors.coral),
    ('Topic', '📡 U4 • TCP flow control — CN', 'new', AppColors.ink),
    ('Note', '📝 TCP timers + cwnd rules', 'formula • 1m', AppColors.sun),
    ('Note', '📝 CN Routing — exam ver.', '5m', AppColors.grape),
    ('Test', '🏆 Mock Q7 — ssthresh after timeout', 'missed', AppColors.coral),
    ('PYQ', '📕 Dec 2023 Q4(b) — 8 marks', 'p.7', AppColors.ink),
  ];

  IconData _iconFor(String kind) {
    switch (kind) {
      case 'Note':
        return Icons.edit_note_rounded;
      case 'Test':
        return Icons.quiz_rounded;
      case 'PYQ':
        return Icons.description_rounded;
      default:
        return Icons.menu_book_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hits = _index
        .where((e) =>
            (type == 'All' || e.$1 == type) &&
            (q.isEmpty ||
                '${e.$1} ${e.$2}'.toLowerCase().contains(q.toLowerCase())))
        .toList();
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
        child: Row(children: [
          const Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('Search',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Text('Subjects • PYQ • notes • tests • topics',
                    style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
              ])),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: AppColors.creamDeep,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.line)),
              child: Text('${hits.length} results',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink))),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: TextField(
          controller: TextEditingController(text: q),
          onChanged: (v) => setState(() => q = v),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_rounded, size: 20),
              hintText: 'Subjects • PYQ • notes • tests • topics…'),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(children: [
          for (final t in ['All', 'Topic', 'Note', 'Test', 'PYQ'])
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: ChoiceChip(
                label: Text(t, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                selected: type == t,
                selectedColor: AppColors.ink,
                backgroundColor: Colors.white,
                shape: const StadiumBorder(side: BorderSide(color: AppColors.line)),
                labelStyle: TextStyle(
                    color: type == t ? Colors.white : AppColors.ink,
                    fontWeight: FontWeight.w700),
                onSelected: (_) => setState(() => type = t),
              ),
            ),
        ]),
      ),
      if (hits.isNotEmpty)
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SectionHead('Results'),
        ),
      Expanded(
        child: hits.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: EmptyState(
                    icon: Icons.search_off_rounded,
                    title: 'No results',
                    subtitle: 'Try “congestion”, “Dijkstra”, “2023” or switch the type filter.',
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: hits.length,
                itemBuilder: (_, i) {
                  Widget dest;
                  switch (hits[i].$1) {
                    case 'Note':
                      dest = const S12Notes();
                      break;
                    case 'Test':
                      dest = const S04Tests();
                      break;
                    case 'PYQ':
                      dest = const S10Pyq();
                      break;
                    default:
                      dest = const S02Learn();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AppCard(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => Nav.go(context, dest),
                        child: Row(children: [
                          Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: hits[i].$4.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(_iconFor(hits[i].$1),
                                  size: 18, color: hits[i].$4)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(hits[i].$1,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.5,
                                        color: AppColors.ink40)),
                                const SizedBox(height: 2),
                                Text(hits[i].$2,
                                    style:
                                        const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.3)),
                              ])),
                          const SizedBox(width: 8),
                          Pill(hits[i].$3, bg: hits[i].$4),
                        ]),
                      ),
                    ),
                  );
                },
              ),
      ),
    ]);
  }
}
