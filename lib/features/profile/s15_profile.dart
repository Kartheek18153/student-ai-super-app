import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/academic/s09_academic.dart';
import 'package:student_ai_super_app/features/settings/s16_settings.dart';
import 'package:student_ai_super_app/features/privacy/s17_privacy.dart';
import 'package:student_ai_super_app/features/career/s22_career.dart';

/// S15 Profile — view (§20). Edit + achievements live in the same screen
/// via tabs to respect §34 (no page-per-feature).
class S15Profile extends StatelessWidget {
  const S15Profile({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          Row(children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Profile',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.3,
                          color: AppColors.ink)),
                  SizedBox(height: 2),
                  Text('SIT • CSE • Sem 6 • your academic identity',
                      style: TextStyle(
                          fontSize: 11.5, color: AppColors.ink60, height: 1.2)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: AppColors.leafSoft,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.leaf.withValues(alpha: 0.18))),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Text('●', style: TextStyle(fontSize: 8, color: AppColors.leaf)),
                SizedBox(width: 6),
                Text('Verified',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppColors.leaf)),
              ]),
            ),
          ]),
          const SizedBox(height: 14),
          AppCard(
              padding: const EdgeInsets.all(14),
              child: Row(children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      color: AppColors.ink,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                      child: Text('K',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.white))),
                ),
                const SizedBox(width: 14),
                const Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Karthik S.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.2,
                              color: AppColors.ink)),
                      SizedBox(height: 2),
                      Text('SIT • CSE • Sem 6 • 2023–27',
                          style: TextStyle(
                              fontSize: 11.5, color: AppColors.ink60)),
                      SizedBox(height: 6),
                      Row(children: [
                        SoftPill('🔥 6-day streak', color: AppColors.leaf),
                        SizedBox(width: 6),
                        SoftPill('🏅 2 achievements', color: AppColors.grape),
                      ]),
                    ])),
              ])),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(child: StatTile('6', 'Subjects', bg: AppColors.grapeSoft, icon: Icons.menu_book_rounded)),
            SizedBox(width: 8),
            Expanded(child: StatTile('8.1', 'SGPA S5', bg: AppColors.leafSoft, icon: Icons.trending_up_rounded)),
            SizedBox(width: 8),
            Expanded(child: StatTile('12', 'Tests', bg: AppColors.skySoft, icon: Icons.quiz_rounded)),
          ]),
          const SizedBox(height: 10),
          AppCard(
              padding: const EdgeInsets.all(14),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: AppColors.grapeSoft,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.handyman_rounded,
                              size: 14, color: AppColors.grape)),
                      SizedBox(width: 8),
                      Text('Skills',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppColors.ink)),
                    ]),
                    SizedBox(height: 10),
                    Wrap(spacing: 6, runSpacing: 6, children: [
                      _SkillChip('Python'),
                      _SkillChip('Networking'),
                      _SkillChip('SQL'),
                      _SkillChip('Linux • in progress', muted: true),
                    ]),
                  ])),
          const SizedBox(height: 10),
          AppCard(
              padding: const EdgeInsets.all(14),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: AppColors.sunSoft,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.flag_rounded,
                              size: 14, color: Color(0xFF8A6E00))),
                      SizedBox(width: 8),
                      Text('Goals',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppColors.ink)),
                      Spacer(),
                      SoftPill('Sem 6', color: AppColors.ink),
                    ]),
                    SizedBox(height: 10),
                    Text('Academic: 8.2 CGPA • Career: Cybersecurity Engineer',
                        style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                            height: 1.35)),
                    SizedBox(height: 4),
                    Text('Prefers short notes + evening revision.',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.ink60, height: 1.35)),
                  ])),
          const SizedBox(height: 12),
          const SectionHead('Explore', icon: Icons.grid_view_rounded),
          AppCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Column(
                  children: [
                    for (final m in [
                      (
                        '🎓',
                        'Academic',
                        'SGPA • CGPA • goals',
                        S09Academic()
                      ),
                      (
                        '💼',
                        'Career',
                        'Roadmap • skill-gap',
                        S22Career()
                      ),
                      (
                        '⚙️',
                        'Settings',
                        'Sessions • appearance',
                        S16Settings()
                      ),
                      (
                        '🛡',
                        'Privacy',
                        'Data • consents',
                        S17Privacy()
                      ),
                    ])
                      _NavTile(m.$1, m.$2, m.$3, m.$4),
                  ])),
        ],
      );
}

class _SkillChip extends StatelessWidget {
  final String label;
  final bool muted;
  const _SkillChip(this.label, {this.muted = false});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.line)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (!muted)
            Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                    color: AppColors.leaf, shape: BoxShape.circle)),
          if (!muted) const SizedBox(width: 6),
          if (muted)
            const Icon(Icons.hourglass_top_rounded,
                size: 12, color: AppColors.ink40),
          if (muted) const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: muted ? AppColors.ink60 : AppColors.ink)),
        ]),
      );
}

class _NavTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Widget dest;
  const _NavTile(this.emoji, this.title, this.subtitle, this.dest);
  @override
  Widget build(BuildContext context) => ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
            color: AppColors.creamDeep,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 18))),
      ),
      title: Text(title,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.ink)),
      subtitle: Text(subtitle,
          style: const TextStyle(fontSize: 11.5, color: AppColors.ink60)),
      trailing: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.line)),
        child:
            const Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.ink40),
      ),
      onTap: () => Nav.go(context, dest));
}
