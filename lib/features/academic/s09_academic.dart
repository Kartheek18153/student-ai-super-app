import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/career/s22_career.dart';

class S09Academic extends StatefulWidget {
  const S09Academic({super.key});
  @override
  State<S09Academic> createState() => _S09AcademicState();
}

class _S09AcademicState extends State<S09Academic> {
  final _internal = TextEditingController(text: '34');
  int get _in => int.tryParse(_internal.text) ?? 0;
  double get _impact => _in / 40 * 0.12;
  static const _sgpa = [6.9, 7.2, 7.6, 7.8, 8.1];
  static const _subs = [('DBMS', 8.6, AppColors.leaf), ('CN', 7.8, AppColors.grape), ('OS', 7.1, AppColors.sun)];

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Academic', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              Text('SGPA history & what-if', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
            ])),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.ink, borderRadius: BorderRadius.circular(999)), child: const Text('CGPA 7.84', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white))),
          ]),
          const SizedBox(height: 12),
          AppCard(
            color: AppColors.ink,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('SGPA HISTORY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.7, color: Colors.white60)),
              const SizedBox(height: 12),
              SizedBox(height: 88, child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                for (var i = 0; i < _sgpa.length; i++)
                  Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 3), height: 30 + i * 12.0, decoration: BoxDecoration(color: i == 4 ? Colors.white : i == 3 ? AppColors.lime : Colors.white24, borderRadius: const BorderRadius.vertical(top: Radius.circular(6))))),
                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 3), height: 86, decoration: BoxDecoration(border: Border.all(color: Colors.white38, width: 1.4, style: BorderStyle.solid), borderRadius: const BorderRadius.vertical(top: Radius.circular(6))), child: const Center(child: Text('~7.9', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white70))))),
              ])),
              const SizedBox(height: 6),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text('S1', style: _lbl), Text('S2', style: _lbl), Text('S3', style: _lbl), Text('S4', style: _lbl), Text('S5 8.1', style: _lbl), Text('S6 ?', style: _lbl),
              ]),
            ]),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: AppCard(child: Column(children: [const Text('7.9', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)), const Text('S6 projected', style: TextStyle(fontSize: 11, color: AppColors.ink60, fontWeight: FontWeight.w600)), const SizedBox(height: 6), const ProgressBar(0.79, color: AppColors.leaf, height: 4)]))),
            const SizedBox(width: 8),
            Expanded(child: AppCard(child: Column(children: [const Text('8.2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)), const Text('Goal CGPA', style: TextStyle(fontSize: 11, color: AppColors.ink60, fontWeight: FontWeight.w600)), const SizedBox(height: 6), ProgressBar(0.82, color: AppColors.grape, height: 4)]))),
          ]),
          const SizedBox(height: 10),
          PrimaryButton('Open career roadmap  →', bg: AppColors.grape, onTap: () => Nav.go(context, const S22Career())),
          const SizedBox(height: 10),
          AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Subject performance  •  Sem 5', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 0.3)),
            const SizedBox(height: 10),
            for (final s in _subs)
              Padding(padding: const EdgeInsets.only(bottom: 10), child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(s.$1, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: s.$3.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(999)), child: Text('${s.$2}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: s.$3)))]),
                const SizedBox(height: 6),
                ProgressBar(s.$2 / 10, color: s.$3, height: 5),
              ])),
          ])),
          const SizedBox(height: 10),
          AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: AppColors.grapeSoft, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.calculate_rounded, size: 14, color: AppColors.grape)), const SizedBox(width: 8), const Text('What-if — CN internal /40', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800))]),
            const SizedBox(height: 10),
            TextField(controller: _internal, keyboardType: TextInputType.number, onChanged: (_) => setState(() {}), decoration: const InputDecoration(hintText: 'Internal marks out of 40')),
            const SizedBox(height: 10),
            Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.leafSoft, borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.trending_up_rounded, size: 16, color: AppColors.leaf), const SizedBox(width: 8), Text('SGPA impact  +${_impact.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.leaf, fontSize: 13))])),
            const SizedBox(height: 10),
            PrimaryButton('Save marks', onTap: () {}),
          ])),
        ],
      );
  static const _lbl = TextStyle(fontSize: 9, color: Colors.white60, fontWeight: FontWeight.w700);
}
