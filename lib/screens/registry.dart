import 'package:flutter/material.dart';
import 'package:student_ai_super_app/features/features.dart';

class ScreenEntry {
  final String id, title, sub;
  final WidgetBuilder build;
  const ScreenEntry(this.id, this.title, this.sub, this.build);
}

/// Every ported screen registers here — All Screens browser reads this list.
/// Wave 1 done; Waves 2–8 append below in order.
final screenRegistry = <ScreenEntry>[
  ScreenEntry('S01', 'Dashboard', 'Home • classes • AI rec', (_) => const S01Dashboard()),
  ScreenEntry('S02', 'Learn', 'Subjects → topics', (_) => const S02Learn()),
  ScreenEntry('S03', 'AI Study', 'Context-aware tutor', (_) => const S03AiStudy()),
  ScreenEntry('S04', 'Tests', 'Playable quiz + analysis', (_) => const S04Tests()),
  ScreenEntry('S05', 'Revision', 'Weak topics → retest', (_) => const S05Revision()),
  ScreenEntry('S06', 'Timetable', 'Day • week • overrides', (_) => const S06Timetable()),
  ScreenEntry('S07', 'Attendance', 'Ring • mark • recovery', (_) => const S07Attendance()),
  ScreenEntry('S08', 'Tasks', 'Filters • sheet • done', (_) => const S08Tasks()),
  ScreenEntry('S09', 'Academic', 'SGPA • add marks', (_) => const S09Academic()),
  ScreenEntry('S10', 'PYQ', 'Search • reader • notes', (_) => const S10Pyq()),
  ScreenEntry('S11', 'Materials', 'Reader • AI summary', (_) => const S11Materials()),
  ScreenEntry('S12', 'AI Notes', 'Editor • AI commands', (_) => const S12Notes()),
  ScreenEntry('S13', 'Search', 'Global • grouped • live', (_) => const S13Search()),
  ScreenEntry('S14', 'Notifications', 'List • toggles • quiet', (_) => const S14Notifications()),
  ScreenEntry('S16', 'Settings', 'Sessions • revoke • access', (_) => const S16Settings()),
  ScreenEntry('S17', 'Privacy', 'Consents • deletion', (_) => const S17Privacy()),
  ScreenEntry('S18', 'Grievance', 'Tracker • composer', (_) => const S18Grievance()),
  ScreenEntry('S19', 'Onboarding', 'Carousel • age gate', (_) => const S19Onboarding()),
  ScreenEntry('S20', 'Auth', 'Login • OTP • reset', (_) => const S20Auth()),
  ScreenEntry('S21', 'Setup', 'Subjects • goals • consent', (_) => const S21Setup()),
  ScreenEntry('S22', 'Career', 'Roadmap • skill-gap', (_) => const S22Career()),
  ScreenEntry('S23', 'Prep', 'Mock player • feedback', (_) => const S23Prep()),
  ScreenEntry('S24', 'Resume', 'ATS fixes • portfolio', (_) => const S24Resume()),
  ScreenEntry('S25', 'Events', 'Match • team • track', (_) => const S25Events()),
  ScreenEntry('S26', 'Funding', 'Eligibility • apply', (_) => const S26Opportunities()),
  ScreenEntry('S27', 'Teams', 'Match • chat • invites', (_) => const S27Teams()),
  ScreenEntry('S28', 'Projects', 'Milestones • publish', (_) => const S28Projects()),
  ScreenEntry('S29', 'Community', 'Feed • likes • replies', (_) => const S29Community()),
  ScreenEntry('S30', 'GK', 'Feed • daily quiz', (_) => const S30Gk()),
  ScreenEntry('S31', 'Wellness', 'Balance • water • breaks', (_) => const S31Wellness()),
  ScreenEntry('S32', 'States', 'Live state gallery', (_) => const S32States()),
  ScreenEntry('★', 'Mastery Flow', 'Congestion 40→80, 6 steps', (_) => const FlowMastery()),
];
