import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

/// S97–S102 Community — feed with working likes + replies,
/// staff posts, members + rules (§26). FUTURE.
class S29Community extends StatefulWidget {
  const S29Community({super.key});
  @override
  State<S29Community> createState() => _S29CommunityState();
}

class _Post {
  final String who, body, meta;
  int likes;
  bool liked = false;
  final List<String> replies;
  _Post(this.who, this.body, this.meta, this.likes, this.replies);
}

class _S29CommunityState extends State<S29Community> {
  final posts = [
    _Post('Divya', 'Dec 2023 Q4(b) solution with cwnd diagram — check before mocks 👇',
        '2h • 📌 PYQ', 48, ['You: This fixed my mock Q7 🙏']),
    _Post('Prof. Rao [STAFF]', 'Extra OS lab moved to Lab 2, 2 PM Wed — timetable updated.',
        '5h', 112, []),
  ];
  final _ctl = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CN • 2.1k',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900)),
                    Pill('+ Join'),
                  ]),
              SizedBox(height: 2),
              Text('Feed • likes • replies',
                  style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: posts.length,
            itemBuilder: (_, i) {
              final p = posts[i];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AppCard(
                    child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                      Text(p.who,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800)),
                      Text(p.meta,
                          style: const TextStyle(
                              fontSize: 11, color: Colors.black45)),
                      const SizedBox(height: 4),
                      Text(p.body,
                          style: const TextStyle(fontSize: 13)),
                      for (final r in p.replies)
                        Container(
                          width: double.infinity,
                          margin:
                              const EdgeInsets.only(top: 6),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black
                                  .withValues(alpha: 0.04),
                              borderRadius:
                                  BorderRadius.circular(10)),
                          child: Text(r,
                              style: const TextStyle(
                                  fontSize: 12.5)),
                        ),
                      Row(children: [
                        TextButton.icon(
                          onPressed: () => setState(() {
                            p.liked = !p.liked;
                            p.likes += p.liked ? 1 : -1;
                          }),
                          icon: Icon(
                              p.liked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 16,
                              color: p.liked
                                  ? AppColors.coral
                                  : Colors.black45),
                          label: Text('${p.likes}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54)),
                        ),
                        TextButton.icon(
                          onPressed: () => _reply(p),
                          icon: const Icon(Icons.chat_bubble_outline,
                              size: 16, color: Colors.black45),
                          label: Text('${p.replies.length}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54)),
                        ),
                      ]),
                    ])),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Row(children: [
            Expanded(
                child: TextField(
                    controller: _ctl,
                    decoration: const InputDecoration(
                        hintText: 'Ask the community…'))),
            const SizedBox(width: 8),
            FilledButton(
                onPressed: () {
                  if (_ctl.text.trim().isEmpty) return;
                  setState(() {
                    posts.insert(
                        0,
                        _Post('You', _ctl.text.trim(), 'now', 0,
                            []));
                    _ctl.clear();
                  });
                },
                child: const Text('Post',
                    style: TextStyle(fontSize: 12.5))),
          ]),
        ),
      ]);

  void _reply(_Post p) {
    final c = TextEditingController();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
              controller: c,
              decoration:
                  const InputDecoration(hintText: 'Write a reply…')),
          const SizedBox(height: 10),
          PrimaryButton('Reply',
              onTap: () {
                if (c.text.trim().isNotEmpty) {
                  setState(
                      () => p.replies.add('You: ${c.text.trim()}'));
                }
                Navigator.pop(context);
              }),
        ]),
      ),
    );
  }
}
