import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/prep/s23_prep.dart';
import 'package:student_ai_super_app/features/teams/s27_teams.dart';

/// S74–S78 Events & internships — match-ranked discovery, team finder,
/// application tracking with deadline sync (§23). FUTURE.
class S25Events extends StatefulWidget {
  const S25Events({super.key});
  @override
  State<S25Events> createState() => _S25EventsState();
}

class _S25EventsState extends State<S25Events> {
  bool savedHack = false;
  bool teamFound = false;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Text('Discover',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const Text('Matched to your skills • deadlines synced', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Pill('For you'),
              SizedBox(width: 6),
              Pill('Hackathons', bg: Colors.white, fg: AppColors.ink),
              SizedBox(width: 6),
              Pill('Internships', bg: Colors.white, fg: AppColors.ink),
              SizedBox(width: 6),
              Pill('Workshops', bg: Colors.white, fg: AppColors.ink),
            ]),
          ),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.grape,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Pill('HACKATHON • 94% MATCH',
                            bg: Colors.white24),
                        Text('⏳ 6d left',
                            style: TextStyle(
                                fontSize: 11, color: Colors.white70)),
                      ]),
                  const SizedBox(height: 6),
                  const Text('SecureHack 2026',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  const Text('48-hr • team of 4 • networking track fits you',
                      style:
                          TextStyle(fontSize: 12, color: Colors.white70)),
                  const SizedBox(height: 10),
                  Row(children: [
                    Expanded(
                        child: PrimaryButton(
                            teamFound ? 'Team 2/4 ✓' : 'Find team →',
                            bg: Colors.white,
                            fg: AppColors.ink,
                            onTap: () {
                              setState(
                                  () => teamFound = true);
                              Nav.go(
                                  context, const S27Teams());
                            })),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side:
                              const BorderSide(color: Colors.white38)),
                      onPressed: () =>
                          setState(() => savedHack = !savedHack),
                      child: Text(savedHack ? 'Saved ♥' : 'Save ♡',
                          style: const TextStyle(fontSize: 12)),
                    ),
                  ]),
                ]),
          ),
          const SizedBox(height: 10),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Pill('INTERNSHIP • ELIGIBLE ✓',
                    bg: Color(0x1A1B9E6B), fg: AppColors.leaf),
                const SizedBox(height: 6),
                const Text('NOC Intern — campus ISP',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                const Text(
                    'CGPA 7.5+ • CN 70%+ • you qualify • screening stage',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                TextButton(
                    onPressed: () =>
                        Nav.go(context, const S23Prep()),
                    child: const Text('Prep for screening →',
                        style: TextStyle(fontSize: 12))),
              ])),
          const SizedBox(height: 10),
          AppCard(
            color: AppColors.sun.withValues(alpha: 0.15),
            border:
                Border.all(color: AppColors.sun.withValues(alpha: 0.5)),
            child: const Text(
                '⏰ Deadlines\n3 Oct NOC test • 30 Sep SecureHack team lock • all synced to Tasks.',
                style: TextStyle(fontSize: 12.5)),
          ),
        ],
      );
}
