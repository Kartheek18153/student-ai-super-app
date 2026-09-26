import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/ai_study/s03_ai_study.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';
import 'package:student_ai_super_app/features/notes/s12_notes.dart';

class S11Materials extends StatefulWidget {
  const S11Materials({super.key});
  @override
  State<S11Materials> createState() => _S11MaterialsState();
}

class _S11MaterialsState extends State<S11Materials> {
  String subject = 'CN';
  bool summary = false;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Materials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              Text('Maintainer-seeded • by subject → topic', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
            ])),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.creamDeep, borderRadius: BorderRadius.circular(999), border: Border.all(color: AppColors.line)), child: const Text('VTU Sem 6', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700))),
          ]),
          const SizedBox(height: 12),
          SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
            for (final s in ['CN', 'DBMS', 'OS'])
              Padding(padding: const EdgeInsets.only(right: 6), child: ChoiceChip(label: Text(s, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)), selected: subject == s, selectedColor: AppColors.ink, labelStyle: TextStyle(color: subject == s ? Colors.white : AppColors.ink), onSelected: (_) => setState(() => subject = s))),
          ])),
          const SizedBox(height: 10),
          AppCard(
            border: Border.all(color: AppColors.ink, width: 1.4),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(999)), child: const Text('CN  •  U3', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.5))),
                const Spacer(),
                const Text('PDF  •  24 pages', style: TextStyle(fontSize: 11, color: AppColors.ink40)),
              ]),
              const SizedBox(height: 8),
              const Text('Routing Algorithms + Congestion', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
              const SizedBox(height: 6),
              const Text('Each router floods link costs; all build the full map and run Dijkstra locally.', style: TextStyle(fontSize: 12.5, height: 1.4, color: AppColors.ink80)),
              const SizedBox(height: 8),
              Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.grapeSoft, borderRadius: BorderRadius.circular(12)), child: const Text('"…run Dijkstra locally on the complete topology."', style: TextStyle(fontSize: 12.5, fontStyle: FontStyle.italic, color: AppColors.grape))),
              const SizedBox(height: 10),
              Wrap(spacing: 6, runSpacing: 6, children: [
                ActionChip(avatar: const Icon(Icons.auto_awesome_rounded, size: 14, color: AppColors.grape), label: const Text('AI Summary', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)), backgroundColor: AppColors.grapeSoft, side: BorderSide.none, onPressed: () => setState(() => summary = !summary)),
                ActionChip(avatar: const Icon(Icons.edit_note_rounded, size: 14, color: AppColors.ink60), label: const Text('Notes', style: TextStyle(fontSize: 12)), side: const BorderSide(color: AppColors.line), backgroundColor: Colors.white, onPressed: () => Nav.go(context, const S12Notes())),
                ActionChip(avatar: const Icon(Icons.quiz_rounded, size: 14, color: AppColors.ink60), label: const Text('Test', style: TextStyle(fontSize: 12)), side: const BorderSide(color: AppColors.line), backgroundColor: Colors.white, onPressed: () => Nav.go(context, const S04Tests())),
              ]),
              const SizedBox(height: 6),
              TextButton.icon(onPressed: () => Nav.go(context, const S03AiStudy()), icon: const Icon(Icons.chat_bubble_outline_rounded, size: 14, color: AppColors.grape), label: const Text('Explain this page with AI', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.grape))),
              if (summary)
                Container(margin: const EdgeInsets.only(top: 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.grape, borderRadius: BorderRadius.circular(14)), child: const Text('LS = flood + Dijkstra everywhere; DV = Bellman-Ford with neighbours. Exam trap: count-to-infinity only hits DV.', style: TextStyle(fontSize: 12.5, color: Colors.white, height: 1.4))),
            ]),
          ),
          const SizedBox(height: 10),
          AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.lightbulb_rounded, size: 14, color: Color(0xFF8A6E00))), const SizedBox(width: 8), const Text('Key points', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800))]),
            const SizedBox(height: 8),
            const Text('• 8 important Qs  •  12 definitions  •  6 formulas', style: TextStyle(fontSize: 12, color: AppColors.ink60, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.creamDeep, borderRadius: BorderRadius.circular(10)), child: const Text('D(v) = min(D(v), D(w)+c(w,v))   •   cwnd += 1 MSS / RTT', style: TextStyle(fontSize: 12, fontFamily: 'monospace'))),
          ])),
          const SizedBox(height: 8),
          const SectionHead('More in CN'),
          AppCard(onTap: null, child: Row(children: [Container(width: 36, height: 36, decoration: BoxDecoration(color: AppColors.skySoft, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.description_rounded, size: 18, color: AppColors.sky)), const SizedBox(width: 10), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('IP Addressing — Subnetting', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), Text('12 pages • U3 • bookmarked', style: TextStyle(fontSize: 11.5, color: AppColors.ink60))])), Icon(Icons.bookmark_rounded, size: 16, color: AppColors.sky)])),
        ],
      );
}
