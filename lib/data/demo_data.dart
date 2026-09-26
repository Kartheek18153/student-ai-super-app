import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'models.dart';

/// Demo content for Karthik S. — mirrors the web build; replace with Supabase.
abstract final class Demo {
  static const name = 'Karthik S.';
  static const meta = 'CSE • Sem 6 • SIT • CGPA 7.84';

  static const subjects = [
    Subject('Computer Networks', 'CN', 0.65, AppColors.ink, '5 units • 12 topics • VTU'),
    Subject('Database Systems', 'DBMS', 0.72, AppColors.grape, '4 units • 10 topics'),
    Subject('Operating Systems', 'OS', 0.48, Colors.black38, '5 units • 11 topics'),
  ];

  static const weak = [
    WeakTopic('Congestion Control', 40),
    WeakTopic('Routing', 55),
  ];

  static const quiz = [
    QuizQ('cwnd=8 MSS, timeout hits. New ssthresh?', 'MCQ • CONGESTION',
        ['8 MSS', '4 MSS', '1 MSS', '16 MSS'], 1, 'Congestion'),
    QuizQ('Slow-start growth per loss-free RTT?', 'MCQ • CONGESTION',
        ['+1 MSS', 'Doubles', 'Halves', 'Stays flat'], 1, 'Congestion'),
    QuizQ('Reno restarts cwnd at 1 MSS after 3 dup-ACKs.', 'TRUE / FALSE',
        ['True', 'False'], 1, 'Congestion'),
    QuizQ('Tahoe reacts to loss by…', 'MCQ • CONGESTION',
        ['Halving cwnd', 'Dropping to 1 MSS', 'Fast recovery', 'Ignoring it'], 1, 'Congestion'),
    QuizQ('AIMD stands for…', 'MCQ • ROUTING BASE',
        ['Additive Increase, Multiplicative Decrease', 'Adaptive Internet Message Data', 'Ack Interval, Max Delay', 'Average In, Max Out'],
        0, 'Routing'),
  ];

  static final tasks = [
    TaskItem('CN — Congestion report', 'Due yesterday • 11:59 PM', TaskStatus.overdue),
    TaskItem('DBMS — ER diagram', 'Due 26 Sep • 5:00 PM', TaskStatus.pending),
    TaskItem('Maths — problem set 6', 'Due 28 Sep • 12 questions', TaskStatus.pending),
    TaskItem('OS — Deadlocks', 'Submitted 22 Sep ✓', TaskStatus.done),
  ];

  static const classes = [
    ClassSlot('09:00', 'Computer Networks', 'Room 301 • Prof. Rao', 'now'),
    ClassSlot('11:00', 'DBMS • Transactions', 'Room 204 • Prof. Mehta', 'upcoming'),
    ClassSlot('14:00', 'OS Lab • extra class', 'Lab 2 • date-only', 'upcoming'),
    ClassSlot('16:00', 'CN Lab — Cancelled', 'Holiday • excluded', 'cancelled'),
  ];

  static const continueLearning = [
    ContItem('CN • UNIT 3', 'Network Layer — Routing', '65% • 20 min left'),
    ContItem('PYQ • 2023', 'DBMS — Sem 5 • VTU', 'Bookmarked • 18 pages'),
    ContItem('AI NOTES', 'OS — Deadlocks (short)', '2 min read'),
  ];
}
