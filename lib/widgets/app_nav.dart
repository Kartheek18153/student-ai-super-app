import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Floating pill bottom bar — Home · Learn · AI · Tests · Profile.
/// Active tab is a dark pill + label; others are subtle icons. Soft shadow, cream-aware.
class AppTabBar extends StatelessWidget {
  final int current;
  final ValueChanged<int> onTap;
  const AppTabBar({super.key, required this.current, required this.onTap});

  static const _items = [
    (Icons.home_rounded, 'Home'),
    (Icons.menu_book_rounded, 'Learn'),
    (Icons.auto_awesome_rounded, 'AI'),
    (Icons.quiz_rounded, 'Tests'),
    (Icons.person_rounded, 'You'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.line),
          boxShadow: const [
            BoxShadow(color: Color(0x14000000), blurRadius: 24, offset: Offset(0, 8)),
            BoxShadow(color: Color(0x08000000), blurRadius: 48, offset: Offset(0, 20)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < _items.length; i++)
              GestureDetector(
                onTap: () => onTap(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: EdgeInsets.symmetric(horizontal: i == current ? 14 : 10, vertical: 9),
                  decoration: BoxDecoration(
                    color: i == current ? AppColors.ink : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(_items[i].$1, size: 20, color: i == current ? Colors.white : AppColors.ink40),
                    if (i == current) ...[
                      const SizedBox(width: 7),
                      Text(_items[i].$2,
                          style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.2)),
                    ],
                  ]),
                ),
              ),
          ],
        ),
      );
}
