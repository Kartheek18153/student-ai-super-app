import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/auth/s20_auth.dart';

/// S51–S53 First launch — splash carousel + age gate.
/// 18+ flows to setup; under-18 routes through parental consent (§30).
class S19Onboarding extends StatefulWidget {
  const S19Onboarding({super.key});
  @override
  State<S19Onboarding> createState() => _S19OnboardingState();
}

class _S19OnboardingState extends State<S19Onboarding> {
  final _pages = PageController();
  int i = 0;
  bool gated = false;

  static const _slides = [
    ('◈', 'STUDY\nOS', 'One app for your complete academic + career journey.'),
    ('🔗', 'Stop juggling\n8 apps', 'Materials • PYQs • AI tutor • tests • attendance • CGPA — connected.'),
    ('🎂', 'How old\nare you?', 'Under 18 needs a parent/guardian to consent.'),
  ];

  @override
  Widget build(BuildContext context) => Column(children: [
        Expanded(
          child: PageView.builder(
            controller: _pages,
            onPageChanged: (v) => setState(() => i = v),
            itemCount: _slides.length,
            itemBuilder: (_, p) => Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x1A000000),
                                blurRadius: 18,
                                offset: Offset(0, 8)),
                          ]),
                      child: Center(
                          child: Text(_slides[p].$1,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: p == 0
                                      ? AppColors.lime
                                      : Colors.white,
                                  fontWeight: p == 0
                                      ? FontWeight.w900
                                      : FontWeight.w700))),
                    ),
                    const SizedBox(height: 18),
                    Text(_slides[p].$2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            height: 1.05,
                            letterSpacing: -0.8,
                            color: AppColors.ink)),
                    const SizedBox(height: 10),
                    Text(_slides[p].$3,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: AppColors.ink60)),
                    if (p == 2) ...[
                      const SizedBox(height: 18),
                      Row(children: [
                        Expanded(
                            child: AppCard(
                                onTap: () => _setup(false),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 16),
                                border: Border.all(color: AppColors.ink, width: 1.5),
                                child: const Column(children: [
                                  Text('🎓',
                                      style: TextStyle(fontSize: 28)),
                                  SizedBox(height: 6),
                                  Text('18+',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.ink)),
                                  SizedBox(height: 2),
                                  Text('Continue',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.ink60)),
                                ]))),
                        const SizedBox(width: 10),
                        Expanded(
                            child: AppCard(
                                onTap: () =>
                                    setState(() => gated = true),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 16),
                                color: gated ? AppColors.sunSoft : Colors.white,
                                border: gated
                                    ? Border.all(
                                        color: AppColors.sun
                                            .withValues(alpha: 0.45))
                                    : null,
                                child: Column(children: [
                                  const Text('🧒',
                                      style: TextStyle(fontSize: 28)),
                                  const SizedBox(height: 6),
                                  const Text('Under 18',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.ink)),
                                  const SizedBox(height: 2),
                                  Text('Parent flow →',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: gated
                                              ? const Color(0xFF8A6E00)
                                              : AppColors.ink60)),
                                ]))),
                      ]),
                      if (gated)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                              color: AppColors.sunSoft,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color:
                                      AppColors.sun.withValues(alpha: 0.35))),
                          child: Row(children: [
                            Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    color: AppColors.sun,
                                    borderRadius: BorderRadius.circular(9)),
                                child: const Icon(Icons.lock_rounded,
                                    size: 14, color: AppColors.ink)),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                  'Guardian invite sent — account unlocks on approval. Continuing to setup preview…',
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.35,
                                      color: AppColors.ink80)),
                            ),
                          ]),
                        ),
                    ],
                  ]),
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (d) => AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      width: d == i ? 22 : 6,
                      height: 6,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          color: d == i
                              ? AppColors.ink
                              : AppColors.ink20,
                          borderRadius: BorderRadius.circular(999)),
                    ))),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: PrimaryButton(
              i < 2
                  ? 'Next →'
                  : (gated ? 'Continue with consent →' : 'Select above ↑'),
              onTap: i < 2
                  ? () => _pages.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut)
                  : (gated ? () => _setup(true) : null)),
        ),
      ]);

  void _setup(bool minor) =>
      Nav.go(context, S20Auth(minor: minor));
}
