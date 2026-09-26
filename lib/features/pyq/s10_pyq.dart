import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/ai_study/s03_ai_study.dart';
import 'package:student_ai_super_app/features/tests/s04_tests.dart';

/// S10 PYQ — clean exam navbar + filter sheet + reader.
class S10Pyq extends StatefulWidget {
  const S10Pyq({super.key});
  @override
  State<S10Pyq> createState() => _S10PyqState();
}

class _Paper {
  final String title, meta;
  final Color color;
  final String exam, state, uni, branch, sem, subject, year, category;
  const _Paper(this.title, this.meta, this.color, this.exam, this.state,
      this.uni, this.branch, this.sem, this.subject, this.year,
      [this.category = 'University']);
}

class _S10PyqState extends State<S10Pyq> {
  String tab = 'browse';
  String query = '';
  String nav = 'All'; // PYQ sub-navbar selection
  String? year, state, sem, subject;
  final _searchCtrl = TextEditingController();

  static const _navItems = [
    'All',
    'University',
    'GATE',
    'CAT',
    'JEE Main',
    'NEET',
    'UPSC CSE',
  ];
  static const _years = ['2024', '2023', '2022', '2021', '2020'];
  static const _states = ['All India', 'Karnataka', 'Telangana', 'Tamil Nadu', 'Maharashtra'];
  static const _sems = ['Sem 2', 'Sem 3', 'Sem 4', 'Sem 5', 'Sem 6', 'Sem 8'];
  static const _subjects = ['CN', 'DBMS', 'OS', 'DSA', 'QA', 'Physics', 'Biology', 'Polity', 'Maths'];

  static const _papers = [
    _Paper('VTU CN — Dec 2023', '18 pages • 4.8★ • U3 heavy', AppColors.grape,
        'Semester', 'Karnataka', 'VTU', 'CSE', 'Sem 6', 'CN', '2023'),
    _Paper('DBMS — Jun 2022', '14 pages • viewed 2d ago', AppColors.sun,
        'Semester', 'Karnataka', 'VTU', 'CSE', 'Sem 5', 'DBMS', '2022'),
    _Paper('OS — Dec 2022', '16 pages • 🔖 saved', AppColors.sky,
        'Semester', 'Karnataka', 'VTU', 'CSE', 'Sem 6', 'OS', '2022'),
    _Paper('JNTU-H DSA — May 2023', '20 pages • 4.6★ • trees heavy',
        AppColors.leaf, 'Semester', 'Telangana', 'JNTU-H', 'CSE', 'Sem 4', 'DSA', '2023'),
    _Paper('Anna Univ DBMS — Nov 2023', '15 pages • normalized Qs',
        AppColors.coral, 'Supplementary', 'Tamil Nadu', 'Anna Univ', 'CSE', 'Sem 5', 'DBMS', '2023'),
    _Paper('Mumbai Univ Maths — Dec 2024', '22 pages • calculus heavy',
        AppColors.ink, 'Semester', 'Maharashtra', 'Mumbai Univ', 'ECE', 'Sem 3', 'Maths', '2024'),
    _Paper('VTU CN — Jun 2021', '17 pages • repeats 40%',
        AppColors.grape, 'Supplementary', 'Karnataka', 'VTU', 'CSE', 'Sem 6', 'CN', '2021'),
    _Paper('Osmania OS — Mar 2023', '12 pages • Mid-Term set A',
        AppColors.sky, 'Mid-Term', 'Telangana', 'Osmania', 'CSE', 'Sem 6', 'OS', '2023'),
    _Paper('GATE CS — Feb 2024', '65 Qs • with keys • 4.9★', AppColors.ink,
        'Entrance', 'All India', 'GATE', 'CSE', 'Sem 8', 'DSA', '2024', 'Entrance'),
    _Paper('GATE CS — Feb 2023', '65 Qs • with keys', AppColors.ink,
        'Entrance', 'All India', 'GATE', 'CSE', 'Sem 8', 'OS', '2023', 'Entrance'),
    _Paper('CAT — Nov 2023 Slot 2', '66 Qs • QA + VARC + DILR', AppColors.coral,
        'Entrance', 'All India', 'CAT', 'Aptitude', 'Sem 6', 'QA', '2023', 'Entrance'),
    _Paper('JEE Main — Jan 2024 S1', '90 Qs • physics heavy', AppColors.grape,
        'Entrance', 'All India', 'JEE Main', 'ECE', 'Sem 2', 'Physics', '2024', 'Entrance'),
    _Paper('NEET — May 2023', '200 Qs • NCERT mapped', AppColors.leaf,
        'Entrance', 'All India', 'NEET', 'EEE', 'Sem 2', 'Biology', '2023', 'Entrance'),
    _Paper('UPSC CSE Prelims — 2023 GS-I', '100 Qs • polity heavy', AppColors.sun,
        'Entrance', 'All India', 'UPSC CSE', 'GS', 'Sem 6', 'Polity', '2023', 'Govt Job'),
  ];

  int get _filterCount =>
      (year != null ? 1 : 0) +
      (state != null ? 1 : 0) +
      (sem != null ? 1 : 0) +
      (subject != null ? 1 : 0);

  void _clear() => setState(() {
        year = state = sem = subject = null;
        query = '';
        _searchCtrl.clear();
      });

  List<_Paper> get _filtered {
    Iterable<_Paper> list = _papers;
    if (tab == 'saved') {
      list = list.where((p) => p.title == 'OS — Dec 2022');
    } else if (tab == 'recent') {
      list = [list.elementAt(1), list.elementAt(0)];
    }
    // PYQ navbar drives the board/category scope.
    if (nav == 'University') {
      list = list.where((p) => p.category == 'University');
    } else if (nav != 'All') {
      list = list.where((p) => p.uni == nav);
    }
    if (query.isNotEmpty) {
      final q = query.toLowerCase();
      list = list.where((p) =>
          p.title.toLowerCase().contains(q) ||
          p.subject.toLowerCase().contains(q) ||
          p.uni.toLowerCase().contains(q) ||
          p.year.contains(q));
    }
    if (year != null) list = list.where((p) => p.year == year);
    if (state != null) list = list.where((p) => p.state == state);
    if (sem != null) list = list.where((p) => p.sem == sem);
    if (subject != null) list = list.where((p) => p.subject == subject);
    return list.toList();
  }

  void _openFilters() {
    var y = year, st = state, s = sem, sub = subject;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: AppColors.cream,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (c) => StatefulBuilder(
        builder: (c, setS) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Filters',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                  _sheetGroup('Year', _years, y, (v) => setS(() => y = v)),
                  _sheetGroup('State', _states, st, (v) => setS(() => st = v)),
                  _sheetGroup('Semester', _sems, s, (v) => setS(() => s = v)),
                  _sheetGroup('Subject', _subjects, sub,
                      (v) => setS(() => sub = v)),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(
                        child: PrimaryButton('Clear',
                            bg: Colors.black12,
                            fg: AppColors.ink,
                            onTap: () {
                              setS(() {
                                y = st = s = sub = null;
                              });
                            })),
                    const SizedBox(width: 8),
                    Expanded(
                        child: PrimaryButton('Show results', onTap: () {
                      setState(() {
                        year = y;
                        state = st;
                        sem = s;
                        subject = sub;
                      });
                      Navigator.pop(context);
                    })),
                  ]),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _sheetGroup(String label, List<String> options, String? selected,
      ValueChanged<String?> onPick) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        Wrap(
            spacing: 6,
            runSpacing: 6,
            children: options
                .map((o) => ChoiceChip(
                      label: Text(o, style: const TextStyle(fontSize: 12)),
                      selected: selected == o,
                      selectedColor: AppColors.ink,
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(side: BorderSide(color: AppColors.line)),
                      labelStyle: TextStyle(
                          color: selected == o
                              ? Colors.white
                              : AppColors.ink,
                          fontWeight: FontWeight.w700),
                      onSelected: (_) =>
                          onPick(selected == o ? null : o),
                    ))
                .toList()),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = _filtered;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      children: [
        Row(children: [
          const Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('PYQ Papers',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Text('University • GATE • CAT • JEE • NEET • UPSC',
                    style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
              ])),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: AppColors.creamDeep,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.line)),
              child: Text('${list.length} papers',
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.ink))),
        ]),
        const SizedBox(height: 12),
        // PYQ sub-navbar: exam scope.
        _PyqNavBar(
            items: _navItems,
            selected: nav,
            onPick: (v) => setState(() {
                  nav = v;
                  tab = 'browse';
                })),
        const SizedBox(height: 10),
        TextField(
            controller: _searchCtrl,
            onChanged: (v) => setState(() => query = v.trim()),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded, size: 20),
                hintText: 'Search $nav papers…',
                suffixIcon: query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: _clear))),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (final t in ['browse', 'saved', 'recent'])
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ChoiceChip(
                  label: Text(
                      t == 'browse'
                          ? 'Browse'
                          : t == 'saved'
                              ? 'Saved (6)'
                              : 'Recent',
                      style: const TextStyle(fontSize: 11.5)),
                  selected: tab == t,
                  selectedColor: AppColors.ink,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(side: BorderSide(color: AppColors.line)),
                  labelStyle: TextStyle(
                      color: tab == t ? Colors.white : AppColors.ink,
                      fontWeight: FontWeight.w700),
                  onSelected: (_) => setState(() => tab = t),
                ),
              ),
            const SizedBox(width: 4),
            Badge.count(
              count: _filterCount,
              isLabelVisible: _filterCount > 0,
              child: OutlinedButton.icon(
                onPressed: _openFilters,
                icon: const Icon(Icons.tune_rounded, size: 16),
                label: const Text('Filters',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.ink,
                    side: const BorderSide(color: AppColors.line),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    shape: const StadiumBorder()),
              ),
            ),
          ]),
        ),
        if (_filterCount > 0)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Wrap(spacing: 6, runSpacing: 6, children: [
              if (year != null)
                Chip(
                    label: Text(year!,
                        style: const TextStyle(fontSize: 11)),
                    backgroundColor: AppColors.creamDeep,
                    side: const BorderSide(color: AppColors.line),
                    onDeleted: () => setState(() => year = null)),
              if (state != null)
                Chip(
                    label: Text(state!,
                        style: const TextStyle(fontSize: 11)),
                    backgroundColor: AppColors.creamDeep,
                    side: const BorderSide(color: AppColors.line),
                    onDeleted: () => setState(() => state = null)),
              if (sem != null)
                Chip(
                    label:
                        Text(sem!, style: const TextStyle(fontSize: 11)),
                    backgroundColor: AppColors.creamDeep,
                    side: const BorderSide(color: AppColors.line),
                    onDeleted: () => setState(() => sem = null)),
              if (subject != null)
                Chip(
                    label: Text(subject!,
                        style: const TextStyle(fontSize: 11)),
                    backgroundColor: AppColors.creamDeep,
                    side: const BorderSide(color: AppColors.line),
                    onDeleted: () => setState(() => subject = null)),
              ActionChip(
                  label: const Text('Clear all',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: AppColors.line),
                  onPressed: _clear),
            ]),
          ),
        const SizedBox(height: 8),
        SectionHead('Papers', action: '${list.length} in $nav'),
        if (list.isEmpty)
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text('No papers here yet.',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                const Text(
                    'Try another exam tab or clear filters.',
                    style:
                        TextStyle(fontSize: 12.5, color: AppColors.ink60)),
                const SizedBox(height: 8),
                PrimaryButton('Clear filters', onTap: _clear),
              ])),
        for (final p in list)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppCard(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PyqReader(title: p.title))),
                child: Row(children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: p.color.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(p.uni.characters.first,
                              style: TextStyle(
                                  color: p.color,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13)))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(p.uni,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: AppColors.grape)),
                        Text(p.title,
                            style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700)),
                        Text('${p.meta} • ${p.year}',
                            style: const TextStyle(
                                fontSize: 11.5, color: AppColors.ink60)),
                      ])),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.ink40, size: 18),
                ]),
              ),
            ),
          ),
      ],
    );
  }
}

/// PYQ-only sub-navbar: one-tap exam scope switching.
class _PyqNavBar extends StatelessWidget {
  final List<String> items;
  final String selected;
  final ValueChanged<String> onPick;
  const _PyqNavBar(
      {required this.items, required this.selected, required this.onPick});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.line)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: items
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: ChoiceChip(
                          label: Text(e,
                              style: const TextStyle(fontSize: 12)),
                          selected: selected == e,
                          selectedColor: AppColors.ink,
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                              color: selected == e
                                  ? Colors.white
                                  : AppColors.ink,
                              fontWeight: FontWeight.w700),
                          shape: const StadiumBorder(
                              side: BorderSide.none),
                          onSelected: (_) => onPick(e),
                        ),
                      ))
                  .toList()),
        ),
      );
}

class PyqReader extends StatefulWidget {
  final String title;
  const PyqReader({super.key, required this.title});
  @override
  State<PyqReader> createState() => _PyqReaderState();
}

class _PyqReaderState extends State<PyqReader> {
  final _find = TextEditingController();
  bool saved = false;
  final notes = <String>[];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.cream,
        appBar: AppBar(
            backgroundColor: AppColors.cream,
            surfaceTintColor: AppColors.cream,
            foregroundColor: AppColors.ink,
            elevation: 0,
            title: Text(widget.title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: AppColors.line),
            ),
            actions: [
              IconButton(
                  tooltip: saved ? 'Saved' : 'Bookmark',
                  icon: Icon(
                      saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded),
                  onPressed: () =>
                      setState(() => saved = !saved)),
            ]),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppCard(
                child: Row(children: [
              Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: AppColors.grape.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.description_rounded,
                      color: AppColors.grape, size: 18)),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700)),
                    Text(saved ? 'Saved to library' : 'PYQ paper',
                        style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.ink60)),
                  ])),
              Pill(saved ? 'Saved ✓' : 'Open',
                  bg: saved ? AppColors.leaf : AppColors.ink),
            ])),
            const SizedBox(height: 8),
            TextField(
              controller: _find,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.search_rounded, size: 18),
                  hintText: 'Search inside PDF…',
                  suffixText: _find.text.isEmpty
                      ? null
                      : '${_find.text.length} hits'),
            ),
            const SizedBox(height: 8),
            AppCard(
                child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                  const Text('Q4(b) • 8 MARKS',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink40)),
                  const SizedBox(height: 6),
                  const Text(
                      'Explain TCP congestion control with slow-start and congestion-avoidance phases. Illustrate cwnd evolution after a timeout…',
                      style: TextStyle(fontSize: 12.5, height: 1.4)),
                  const SizedBox(height: 8),
                  Wrap(spacing: 6, runSpacing: 6, children: [
                    ActionChip(
                        avatar: const Icon(Icons.highlight_rounded, size: 14, color: AppColors.ink60),
                        label: const Text('Highlight',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                        backgroundColor: AppColors.creamDeep,
                        side: const BorderSide(color: AppColors.line),
                        onPressed: () {}),
                    ActionChip(
                        avatar: const Icon(Icons.edit_note_rounded, size: 14, color: AppColors.ink60),
                        label: const Text('Note',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                        backgroundColor: AppColors.creamDeep,
                        side: const BorderSide(color: AppColors.line),
                        onPressed: () => setState(() => notes.add(
                            'cwnd halved on timeout — same miss as mock Q7!'))),
                  ]),
                ])),
            for (final n in notes)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AppCard(
                    color: AppColors.sun
                        .withValues(alpha: 0.12),
                    child: Row(children: [
                      Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: AppColors.sun.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.edit_note_rounded,
                              size: 14, color: Color(0xFF8A6E00))),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text(n,
                              style:
                                  const TextStyle(fontSize: 12.5, height: 1.4))),
                    ])),
              ),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child: PrimaryButton('✨ Ask AI',
                      bg: AppColors.grape,
                      onTap: () =>
                          Nav.go(context, const S03AiStudy()))),
              const SizedBox(width: 8),
              Expanded(
                  child: PrimaryButton('Make 5Q test',
                      onTap: () =>
                          Nav.go(context, const S04Tests()))),
            ]),
          ],
        ),
      );
}
