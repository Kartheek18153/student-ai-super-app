import 'package:flutter/material.dart';
import '../../data/models.dart';
import '../../theme/app_colors.dart';
// app_widgets imported via theme where needed

/// S03 AI Study — context-aware tutor, not a generic chatbot.
class S03AiStudy extends StatefulWidget {
  const S03AiStudy({super.key});
  @override
  State<S03AiStudy> createState() => _S03AiStudyState();
}

class _S03AiStudyState extends State<S03AiStudy> {
  final _msgs = <ChatMsg>[
    const ChatMsg(false, 'Hi Karthik — I know CN Unit 3, your 62% mock and 3 saved notes. What are we fixing today?'),
  ];
  final _ctl = TextEditingController();
  final _scroll = ScrollController();

  String _brain(String q) {
    final s = q.toLowerCase();
    if (s.contains('beginner') || s.contains('simple')) return 'Think of TCP handshake like knocking: you knock (SYN) → friend says “come in!” (SYN-ACK) → you step inside (ACK). Same 3 steps, zero jargon.';
    if (s.contains('5-mark') || s.contains('mark')) return '5-mark answer drafted ✓: roles of SYN / SYN-ACK / ACK, sequence sync, why 3 not 2, TIME_WAIT note. Saved to Notes — say “make test” for 5 Qs.';
    if (s.contains('test') || s.contains('quiz')) return 'Generated a 5Q mini-test from your weak topics (Congestion 40%). Open Tests tab → Retake weak.';
    if (s.contains('handshake') || s.contains('tcp')) return 'Client SYN → server SYN-ACK → client ACK. Connection = ESTABLISHED; sequence numbers sync both sides. Say “beginner” for the simple version.';
    return 'Linked to CN U3 + your 62% mock. Try “beginner”, “5-mark”, or “test me”.';
  }

  void _send([String? preset]) {
    final text = (preset ?? _ctl.text).trim();
    if (text.isEmpty) return;
    setState(() {
      _msgs.add(ChatMsg(true, text));
      _msgs.add(ChatMsg(false, _brain(text)));
    });
    _ctl.clear();
    Future.delayed(const Duration(milliseconds: 100), () => _scroll.jumpTo(_scroll.position.maxScrollExtent + 200));
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        // Top header bar
        Container(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
          decoration: const BoxDecoration(color: AppColors.cream, border: Border(bottom: BorderSide(color: AppColors.line))),
          child: Column(children: [
            Row(children: [
              Container(width: 36, height: 36, decoration: BoxDecoration(color: AppColors.grape, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 18)),
              const SizedBox(width: 10),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('AI Study', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                Text('Knows CN U3 • last test 62% • 3 notes', style: TextStyle(fontSize: 11, color: AppColors.ink60)),
              ])),
              Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4), decoration: BoxDecoration(color: AppColors.leafSoft, borderRadius: BorderRadius.circular(999)), child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.circle, size: 7, color: AppColors.leaf), SizedBox(width: 5), Text('Context-aware', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.leaf))])),
            ]),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.sun.withValues(alpha: 0.3))),
              child: const Row(children: [
                Icon(Icons.lightbulb_rounded, size: 13, color: Color(0xFF8A6E00)),
                SizedBox(width: 6),
                Expanded(child: Text('Tip: ask “explain like beginner” or “give me a 5-mark answer”.', style: TextStyle(fontSize: 11.5, color: Color(0xFF6B5900)))),
              ]),
            ),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scroll,
            padding: const EdgeInsets.all(16),
            itemCount: _msgs.length,
            itemBuilder: (_, i) {
              final m = _msgs[i];
              return Align(
                alignment: m.me ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                  constraints: const BoxConstraints(maxWidth: 300),
                  decoration: BoxDecoration(
                    color: m.me ? AppColors.ink : Colors.white,
                    borderRadius: BorderRadius.circular(18).copyWith(
                      bottomRight: m.me ? const Radius.circular(4) : const Radius.circular(18),
                      bottomLeft: m.me ? const Radius.circular(18) : const Radius.circular(4),
                    ),
                    border: m.me ? null : Border.all(color: AppColors.line),
                    boxShadow: m.me ? null : const [BoxShadow(color: Color(0x08000000), blurRadius: 10, offset: Offset(0, 2))],
                  ),
                  child: Text(m.text, style: TextStyle(fontSize: 13, height: 1.45, color: m.me ? Colors.white : AppColors.ink80)),
                ),
              );
            },
          ),
        ),
        // Quick chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(children: [
            for (final c in <(String, IconData)>[
              ('Simplify', Icons.lightbulb_outline_rounded),
              ('Detailed', Icons.menu_book_outlined),
              ('Example', Icons.science_outlined),
              ('Make notes', Icons.edit_note_rounded),
              ('Test me', Icons.quiz_outlined),
            ])
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ActionChip(
                  avatar: Icon(c.$2, size: 14, color: AppColors.ink60),
                  label: Text(c.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: AppColors.line),
                  onPressed: () => _send(c.$1),
                ),
              ),
          ]),
        ),
        const SizedBox(height: 6),
        // Composer
        Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
          decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: AppColors.line))),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _ctl,
                onSubmitted: (_) => _send(),
                decoration: InputDecoration(
                  hintText: 'Ask about any material…',
                  prefixIcon: const Icon(Icons.auto_awesome_rounded, size: 18, color: AppColors.grape),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: const BorderSide(color: AppColors.line)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: () => _send(),
              style: FilledButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(13), backgroundColor: AppColors.ink),
              child: const Icon(Icons.arrow_upward_rounded, size: 18),
            ),
          ]),
        ),
      ]);
}
