import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S79–S85 Funding — eligibility auto-checked from profile, application
/// tracking, saved + deadline sync (§23). FUTURE.
class S26Opportunities extends StatefulWidget {
  const S26Opportunities({super.key});
  @override
  State<S26Opportunities> createState() => _S26OpportunitiesState();
}

class _S26OpportunitiesState extends State<S26Opportunities> {
  bool applied = false;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Funding',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Pill('3 ELIGIBLE ✓',
                    bg: Color(0x1A1B9E6B), fg: AppColors.leaf),
              ]),
          const Text('Eligibility checked • deadlines synced', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          AppCard(
            border:
                Border.all(color: AppColors.leaf.withValues(alpha: 0.5)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Pill('SCHOLARSHIP • ELIGIBLE',
                            bg: AppColors.leaf),
                        Text('⏳ 12d',
                            style: TextStyle(
                                fontSize: 11, color: Colors.black45)),
                      ]),
                  const SizedBox(height: 6),
                  const Text('Merit-cum-means • ₹25k/yr',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                  const Text(
                      'CGPA 7.84 ≥ 7.5 ✓ • income docs pending 1',
                      style:
                          TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 10),
                  PrimaryButton(applied ? 'Applied ✓ — tracking' : 'Apply →',
                      onTap: applied
                          ? null
                          : () => setState(() => applied = true)),
                ]),
          ),
          const SizedBox(height: 10),
          const AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Pill('RESEARCH • PROF. RAO',
                    bg: Color(0x1A4A7CFF), fg: AppColors.sky),
                SizedBox(height: 6),
                Text('UG Research: campus network measurement',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                Text(
                    'Needs CN 70%+ • you: 72% ✓ • 6 mo • stipend',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
              ])),
          const SizedBox(height: 10),
          const AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('♡ Saved (4) • 📅 Deadlines',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                SizedBox(height: 4),
                Text(
                    'All synced to Tasks + Notifications. Registration status tracked per item.',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
              ])),
        ],
      );
}
