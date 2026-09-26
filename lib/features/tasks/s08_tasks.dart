import 'package:flutter/material.dart';
import '../../data/demo_data.dart';
import '../../data/models.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';

class S08Tasks extends StatefulWidget {
  const S08Tasks({super.key});
  @override
  State<S08Tasks> createState() => _S08TasksState();
}

class _S08TasksState extends State<S08Tasks> {
  String filter = 'all';
  List<TaskItem> get visible => Demo.tasks.where((t) {
        if (filter == 'all') return true;
        if (filter == 'done') return t.status == TaskStatus.done;
        return t.status != TaskStatus.done;
      }).toList();
  int get pending => Demo.tasks.where((t) => t.status != TaskStatus.done).length;
  int get done => Demo.tasks.where((t) => t.status == TaskStatus.done).length;

  @override
  Widget build(BuildContext context) => Column(children: [
        Padding(padding: const EdgeInsets.fromLTRB(16, 6, 16, 0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            Text('Assignments & reminders', style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          ]),
          if (Demo.tasks.any((t) => t.status == TaskStatus.overdue)) const Pill('1 overdue', bg: AppColors.coral, fg: Colors.white),
        ])),
        SingleChildScrollView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), child: Row(children: [
          for (final f in ['all', 'pending', 'done'])
            Padding(padding: const EdgeInsets.only(right: 6), child: ChoiceChip(label: Text('${f[0].toUpperCase()}${f.substring(1)} (${f == 'all' ? Demo.tasks.length : f == 'pending' ? pending : done})', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)), selected: filter == f, selectedColor: AppColors.ink, labelStyle: TextStyle(color: filter == f ? Colors.white : AppColors.ink), onSelected: (_) => setState(() => filter = f))),
        ])),
        Expanded(
          child: visible.isEmpty
              ? const Center(child: Text('Nothing here — try another filter.'))
              : ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: visible.length, itemBuilder: (_, i) {
                    final t = visible[i];
                    final isDone = t.status == TaskStatus.done;
                    final overdue = t.status == TaskStatus.overdue;
                    return Padding(padding: const EdgeInsets.only(bottom: 8), child: AppCard(
                      color: overdue ? const Color(0xFFFFF1F0) : null,
                      border: overdue ? Border.all(color: AppColors.coral.withValues(alpha: 0.3)) : null,
                      onTap: isDone ? null : () => _sheet(t),
                      padding: const EdgeInsets.all(14),
                      child: Row(children: [
                        Container(width: 36, height: 36, decoration: BoxDecoration(color: isDone ? AppColors.leafSoft : overdue ? AppColors.coralSoft : AppColors.creamDeep, borderRadius: BorderRadius.circular(10)), child: Icon(isDone ? Icons.check_rounded : overdue ? Icons.warning_rounded : Icons.schedule_rounded, size: 18, color: isDone ? AppColors.leaf : overdue ? AppColors.coral : AppColors.ink60)),
                        const SizedBox(width: 12),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(t.title, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, decoration: isDone ? TextDecoration.lineThrough : null, color: isDone ? AppColors.ink40 : AppColors.ink)),
                          const SizedBox(height: 2),
                          Text(t.meta, style: const TextStyle(fontSize: 11.5, color: AppColors.ink60)),
                        ])),
                        if (isDone) const Pill('Done', bg: AppColors.leaf, fontSize: 10)
                        else if (overdue) const Pill('Overdue', bg: AppColors.coral, fontSize: 10)
                        else const Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.ink40),
                      ]),
                    ));
                  }),
        ),
        Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 10), child: PrimaryButton('+ Add assignment', icon: Icons.add_rounded, onTap: () {})),
      ]);

  void _sheet(TaskItem t) => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        builder: (_) => Padding(padding: const EdgeInsets.fromLTRB(20, 14, 20, 28), child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 36, height: 4, decoration: BoxDecoration(color: AppColors.line, borderRadius: BorderRadius.circular(999))),
          const SizedBox(height: 14),
          Text(t.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
          Text(t.meta, style: const TextStyle(fontSize: 12, color: AppColors.ink60)),
          const SizedBox(height: 10),
          Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.sunSoft, borderRadius: BorderRadius.circular(12)), child: const Row(children: [Icon(Icons.notifications_active_rounded, size: 14, color: Color(0xFF8A6E00)), SizedBox(width: 6), Text('Reminders: 1 day + 2 hrs before', style: TextStyle(fontSize: 12.5, color: Color(0xFF6B5900)))])),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(context), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13), side: const BorderSide(color: AppColors.line), shape: const StadiumBorder()), child: const Text('Close'))),
            const SizedBox(width: 10),
            Expanded(child: FilledButton(style: FilledButton.styleFrom(backgroundColor: AppColors.leaf, padding: const EdgeInsets.symmetric(vertical: 13), shape: const StadiumBorder()), onPressed: () { setState(() => t.status = TaskStatus.done); Navigator.pop(context); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Marked done ✓ — dashboard updated'))); }, child: const Text('Mark done'))),
          ]),
        ])),
      );
}
