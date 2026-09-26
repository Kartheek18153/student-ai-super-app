import 'package:flutter/material.dart';
import '../../widgets/state_views.dart';

/// S113–S118 States gallery — every shared state widget live in one
/// place: loading, empty, error, offline, success, confirm, sheet.
class S32States extends StatelessWidget {
  const S32States({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        children: [
          const Text('States kit',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          const Text(
              'One kit powers every loading/empty/error/offline/success moment.',
              style: TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 10),
          StateViews.loading('saved papers'),
          const SizedBox(height: 8),
          StateViews.empty(
              emoji: '📭',
              title: 'Empty saved papers',
              copy: 'Nothing bookmarked yet.',
              cta: 'Browse PYQs →',
              onTap: () {}),
          const SizedBox(height: 8),
          StateViews.error('attendance', onRetry: () {}),
          const SizedBox(height: 8),
          StateViews.offline('3 tests queued to sync'),
          const SizedBox(height: 8),
          StateViews.success('Congestion 40% → 80%',
              'Retest synced • streak extended 🔥'),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(
                child: OutlinedButton(
                    onPressed: () => StateViews.confirm(context,
                        title: 'Delete note?',
                        copy:
                            'Removes it permanently. Linked revision stays.'),
                    child: const Text('Confirm ↗',
                        style: TextStyle(fontSize: 12)))),
            const SizedBox(width: 8),
            Expanded(
                child: FilledButton(
                    onPressed: () => StateViews.options(context,
                        title: 'Options • Note',
                        options: const [
                          '✏️ Edit',
                          '↗️ Share',
                          '🔔 Remind me',
                          '🗑 Delete'
                        ]),
                    child: const Text('Sheet ↗',
                        style: TextStyle(fontSize: 12)))),
          ]),
        ],
      );
}
