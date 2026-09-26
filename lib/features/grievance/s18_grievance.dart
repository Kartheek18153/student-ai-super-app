import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S48–S50 Grievance — tracker with SLA stages, resolved case,
/// new-complaint composer with under-18 co-sign (§30).
class S18Grievance extends StatefulWidget {
  const S18Grievance({super.key});
  @override
  State<S18Grievance> createState() => _S18GrievanceState();
}

class _S18GrievanceState extends State<S18Grievance> {
  String category = 'Marks';
  final _body = TextEditingController();
  bool filed = false;

  static const _stages = ['Filed', 'Verified', 'Review', 'Resolved'];

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Row(children: [
            Expanded(
              child: Text('Grievance',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            ),
            SizedBox(width: 8),
            Pill('+ New'),
          ]),
          const Text('SLA tracker • new complaint', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(children: [
                  const Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Pill('#GR-1042 • IN REVIEW',
                          bg: AppColors.sun, fg: AppColors.ink),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('filed 20 Sep',
                      style: TextStyle(
                          fontSize: 11, color: Colors.black45)),
                ]),
                const SizedBox(height: 6),
                const Text('Wrong marks in DBMS internal',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                const Text('Hall ticket + marks-list photo attached.',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 10),
                Row(children: [
                  for (var i = 0; i < _stages.length; i++) ...[
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: i < 3
                              ? (i == 2
                                  ? AppColors.sun
                                  : AppColors.leaf)
                              : Colors.black12,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(_stages[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: i < 3
                                    ? Colors.white
                                    : Colors.black38)),
                      ),
                    ),
                    if (i < 3) const SizedBox(width: 3),
                  ],
                ]),
                const SizedBox(height: 6),
                const Text('SLA: resolution by 27 Sep • officer: exam cell',
                    style: TextStyle(fontSize: 11, color: Colors.black54)),
              ])),
          const SizedBox(height: 10),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text('New complaint',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                Wrap(spacing: 6, children: [
                  for (final c in ['Marks', 'Attendance', 'Content', 'Safety'])
                    ChoiceChip(
                      label: Text(c,
                          style: const TextStyle(fontSize: 11.5)),
                      selected: category == c,
                      selectedColor: AppColors.ink,
                      labelStyle: TextStyle(
                          color: category == c
                              ? Colors.white
                              : AppColors.ink,
                          fontWeight: FontWeight.w700),
                      onSelected: (_) =>
                          setState(() => category = c),
                    ),
                ]),
                const SizedBox(height: 10),
                TextField(
                  controller: _body,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      hintText: 'Describe + attach proof…'),
                ),
                const SizedBox(height: 6),
                const Text('🧒 Under 18? Guardian co-sign auto-added.',
                    style: TextStyle(fontSize: 11.5, color: Colors.black54)),
                const SizedBox(height: 10),
                PrimaryButton(
                    filed ? 'Filed as #GR-1043 ✓' : 'Submit grievance',
                    onTap: filed
                        ? null
                        : () => setState(() => filed = true)),
              ])),
        ],
      );
}
