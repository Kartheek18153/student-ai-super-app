import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/revision/s05_revision.dart';

class S12Notes extends StatefulWidget {
  const S12Notes({super.key});
  @override
  State<S12Notes> createState() => _S12NotesState();
}

class _S12NotesState extends State<S12Notes> {
  String kind = 'All';
  static const _all = [
    ('SHORT', 'OS — Deadlocks', '4 conditions • prevention vs avoidance', AppColors.ink),
    ('EXAM', 'CN — Routing (5-mark ready)', 'Dijkstra + LS vs DV', AppColors.grape),
    ('FORMULA', 'TCP timers + cwnd rules', 'ssthresh = cwnd / 2', AppColors.sun),
  ];

  @override
  Widget build(BuildContext context) {
    final list = _all.where((n) => kind == 'All' || n.$1.toLowerCase() == kind.toLowerCase()).toList();
    return Column(children: [
      Padding(padding: const EdgeInsets.fromLTRB(16, 6, 16, 0), child: Row(children: [
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('My Notes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          Text('AI notes • edit • export', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
        ])),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add_rounded, size: 16), label: const Text('New', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)), style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8))),
      ])),
      SingleChildScrollView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), child: Row(children: [
        for (final k in ['All', 'Short', 'Exam', 'Formula'])
          Padding(padding: const EdgeInsets.only(right: 6), child: ChoiceChip(label: Text(k, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)), selected: kind == k, selectedColor: AppColors.ink, labelStyle: TextStyle(color: kind == k ? Colors.white : AppColors.ink), onSelected: (_) => setState(() => kind = k))),
      ])),
      Expanded(
        child: list.isEmpty
            ? const Center(child: EmptyState(icon: Icons.edit_note_rounded, title: 'No notes yet', subtitle: 'Generate from any material or ask AI.'))
            : ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: list.length, itemBuilder: (_, i) => Padding(padding: const EdgeInsets.only(bottom: 8), child: AppCard(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NoteEditor(title: list[i].$2, body: 'Deadlock = 4 conditions together: mutual exclusion, hold-and-wait, no preemption, circular wait. Break any one → prevented. Avoidance: Banker\'s test before granting.'))),
              child: Row(children: [
                Container(width: 40, height: 40, decoration: BoxDecoration(color: list[i].$4.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)), child: Icon(list[i].$1 == 'SHORT' ? Icons.short_text_rounded : list[i].$1 == 'EXAM' ? Icons.school_rounded : Icons.calculate_rounded, size: 18, color: list[i].$4)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(list[i].$2, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
                  Text(list[i].$3, style: const TextStyle(fontSize: 11.5, color: AppColors.ink60)),
                ])),
                Pill(list[i].$1, bg: list[i].$4.withValues(alpha: 0.12), fg: list[i].$4, fontSize: 10),
              ]),
            ))),
      ),
    ]);
  }
}

class NoteEditor extends StatefulWidget {
  final String title, body;
  const NoteEditor({super.key, required this.title, required this.body});
  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late String body;
  @override
  void initState() { super.initState(); body = widget.body; }
  void _cmd(String c) {
    setState(() {
      if (c == 'shorter') { body = body.split('.').first.trim(); if (!body.endsWith('.')) body += '.'; }
      else if (c == 'mark') { body = '${widget.title} — 5-mark answer:\n• Define (1m)\n• $body\n• Example: dining philosophers (1m)\n• Diagram: wait-for graph (1m)\n• Prevention vs avoidance (1m)'; }
      else if (c == 'example') { body = '$body\nExample: two trains needing the same single track from opposite ends — neither can proceed.'; }
      else { body = 'Deadlock means everyone waiting forever. Four things must ALL be true. Remove any one and the jam clears.'; }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.cream,
        appBar: AppBar(title: Text(widget.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)), actions: [
          IconButton(tooltip: 'Export', icon: const Icon(Icons.ios_share_rounded), onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Exported ✓')))),
        ]),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [const Pill('AI draft', bg: AppColors.grapeSoft, fg: AppColors.grape, fontSize: 10), const Spacer(), TextButton.icon(onPressed: () => Nav.go(context, const S05Revision()), icon: const Icon(Icons.replay_rounded, size: 14), label: const Text('Revise', style: TextStyle(fontSize: 11)))]),
            const SizedBox(height: 10),
            Text(body, style: const TextStyle(fontSize: 13.5, height: 1.5)),
          ])),
          const SizedBox(height: 10),
          Wrap(spacing: 6, runSpacing: 6, children: [
            for (final c in [('Shorter', 'shorter', Icons.short_text_rounded), ('5-mark', 'mark', Icons.school_rounded), ('Example', 'example', Icons.lightbulb_outline_rounded), ('Simpler', 'simple', Icons.auto_awesome_rounded)])
              ActionChip(avatar: Icon(c.$3, size: 14, color: AppColors.grape), label: Text(c.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)), backgroundColor: AppColors.grapeSoft, side: BorderSide.none, onPressed: () => _cmd(c.$2)),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13), side: const BorderSide(color: AppColors.line), shape: const StadiumBorder()), child: const Text('Done'))),
            const SizedBox(width: 10),
            Expanded(child: FilledButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved ✓'))), style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13), shape: const StadiumBorder()), child: const Text('Save'))),
          ]),
        ]),
      );
}
