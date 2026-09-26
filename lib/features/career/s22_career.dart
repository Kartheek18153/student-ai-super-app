import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/learn/s02_learn.dart';
import 'package:student_ai_super_app/features/resume/s24_resume.dart';
import 'package:student_ai_super_app/features/events/s25_events.dart';

/// S61–S65 Career — goal dashboard, skill-gap bars, role explorer,
/// 6-step roadmap timeline (Cybersecurity Engineer, §22). FUTURE.
class S22Career extends StatelessWidget {
  const S22Career({super.key});

  static const _gaps = [
    ('Programming ✓', 0.90, AppColors.leaf),
    ('Networking ✓', 0.75, AppColors.leaf),
    ('Linux ⏳', 0.30, AppColors.sun),
    ('Web Security ○', 0.04, AppColors.ink20),
  ];

  static const _steps = [
    ('Programming', 'Python • done via semesters', true, false),
    ('Networking', 'CN 65% • feeds security', true, false),
    ('Linux', '4-week plan • terminal labs', false, true),
    ('Web Security', 'OWASP Top 10 • labs', false, false),
    ('Tools → Projects → Certs', 'Burp • 2 projects • Security+', false, false),
    ('Internships → Career prep', '', false, false),
  ];

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Career',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Pill('FUTURE', bg: AppColors.grape),
              ]),
          const Text('Goal • skills • roadmap', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.ink,
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GOAL ROLE',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white60)),
                  Text('Cybersecurity Engineer',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  SizedBox(height: 10),
                  ProgressBar(0.42, color: AppColors.lime),
                  SizedBox(height: 4),
                  Text('42% • Next: Linux → Web Security',
                      style:
                          TextStyle(fontSize: 12, color: Colors.white60)),
                ]),
          ),
          const SizedBox(height: 10),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text('Skill gap',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                for (final g in _gaps)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(g.$1,
                                style: const TextStyle(fontSize: 12.5)),
                            Text('${(g.$2 * 100).round()}%',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800)),
                          ]),
                      const SizedBox(height: 4),
                      ProgressBar(g.$2, color: g.$3),
                    ]),
                  ),
              ])),
          const SizedBox(height: 10),
          const SectionHead('Roadmap'),
          PrimaryButton('Start Linux week 1 →',
              bg: AppColors.lime,
              fg: AppColors.ink,
              onTap: () => Nav.go(context, const S02Learn())),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
                child: OutlinedButton(
                    onPressed: () =>
                        Nav.go(context, const S24Resume()),
                    child: const Text('Resume →',
                        style: TextStyle(fontSize: 12)))),
            const SizedBox(width: 8),
            Expanded(
                child: OutlinedButton(
                    onPressed: () =>
                        Nav.go(context, const S25Events()),
                    child: const Text('Events →',
                        style: TextStyle(fontSize: 12)))),
          ]),
          const SizedBox(height: 10),
          for (var i = 0; i < _steps.length; i++)
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _steps[i].$3
                        ? AppColors.leaf
                        : _steps[i].$4
                            ? AppColors.sun
                            : Colors.white,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Center(
                      child: Text(
                          _steps[i].$3
                              ? '✓'
                              : _steps[i].$4
                                  ? '●'
                                  : '${i + 1}',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: _steps[i].$3 || _steps[i].$4
                                  ? Colors.white
                                  : Colors.black38))),
                ),
                if (i < _steps.length - 1)
                  Container(width: 2, height: 14, color: Colors.black12),
              ]),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(_steps[i].$1,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: _steps[i].$4
                                        ? AppColors.ink
                                        : _steps[i].$3
                                            ? AppColors.ink
                                            : Colors.black45)),
                          ),
                          if (_steps[i].$4) ...[
                            const SizedBox(width: 6),
                            const Pill('NOW', bg: AppColors.sun, fg: AppColors.ink),
                          ],
                        ]),
                        if (_steps[i].$2.isNotEmpty)
                          Text(_steps[i].$2,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                      ]),
                ),
              ),
            ]),
        ],
      );
}
