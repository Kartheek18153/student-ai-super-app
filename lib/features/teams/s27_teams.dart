import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S86–S91 Team-up — skill-match discovery with invites, requests,
/// team dashboard + working chat (§24). FUTURE.
class S27Teams extends StatefulWidget {
  const S27Teams({super.key});
  @override
  State<S27Teams> createState() => _S27TeamsState();
}

class _S27TeamsState extends State<S27Teams> {
  final invited = <String>{};
  bool accepted = false;
  final chat = [
    (false, 'Meera: UI shells done — need API list 🔌'),
    (true, 'Pushing sniffer endpoints tonight ✓'),
    (false, 'You: Wireshark captures attached 📎'),
  ];
  final _ctl = TextEditingController();

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Find team',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Pill('+ Create'),
              ]),
          const Text('Skill-match • invites • chat', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 10),
          const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'SecureHack • need frontend…')),
          const SizedBox(height: 10),
          for (final m in [
            ('M', 'Meera • Frontend', 'React • CSE’26 • 92% match'),
            ('A', 'Arjun • Writer', 'Docs • ECE’27 • 85% match'),
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                  child: Row(children: [
                CircleAvatar(child: Text(m.$1)),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(m.$2,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700)),
                      Text(m.$3,
                          style: const TextStyle(
                              fontSize: 11.5, color: Colors.black54)),
                    ])),
                FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: invited.contains(m.$2)
                            ? AppColors.leaf
                            : AppColors.ink,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8)),
                    onPressed: () => setState(() => invited.contains(m.$2)
                        ? invited.remove(m.$2)
                        : invited.add(m.$2)),
                    child: Text(
                        invited.contains(m.$2) ? 'Invited ✓' : 'Invite',
                        style: const TextStyle(fontSize: 11.5))),
              ])),
            ),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text('📨 Requests (2)',
                    style: TextStyle(fontWeight: FontWeight.w800)),
                const Text(
                    'SecureHack team invite — Packet Pioneers, 2/4',
                    style:
                        TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 6),
                Row(children: [
                  Expanded(
                      child: PrimaryButton(
                          accepted ? 'Accepted ✓ — see dashboard' : 'Accept',
                          bg: accepted
                              ? AppColors.leaf
                              : AppColors.ink,
                          onTap: accepted
                              ? null
                              : () =>
                                  setState(() => accepted = true))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Decline',
                              style: TextStyle(fontSize: 12)))),
                ]),
              ])),
          if (accepted) ...[
            const SizedBox(height: 10),
            const SectionHead('Packet Pioneers • team chat'),
            AppCard(
                child: Column(children: [
              for (final m in chat)
                Align(
                  alignment: m.$1
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.all(10),
                    constraints:
                        const BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                      color: m.$1
                          ? AppColors.ink
                          : Colors.black.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(m.$2,
                        style: TextStyle(
                            fontSize: 12.5,
                            color:
                                m.$1 ? Colors.white : AppColors.ink)),
                  ),
                ),
              Row(children: [
                Expanded(
                    child: TextField(
                        controller: _ctl,
                        decoration: const InputDecoration(
                            hintText: 'Message…'))),
                const SizedBox(width: 6),
                FloatingActionButton.small(
                    onPressed: () {
                      if (_ctl.text.trim().isEmpty) return;
                      setState(() {
                        chat.add((true, 'You: ${_ctl.text.trim()}'));
                        _ctl.clear();
                      });
                    },
                    child: const Icon(Icons.arrow_upward, size: 18)),
              ]),
            ])),
          ],
        ],
      );
}
