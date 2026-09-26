import 'package:flutter/material.dart';

/// Student OS — calm editorial palette.
/// Cream canvas, ink text, grape AI, leaf success, sun warning.
/// Extended with semantic surfaces so every screen stays coherent.
abstract final class AppColors {
  // Core
  static const cream = Color(0xFFFCF8EF);
  static const creamDeep = Color(0xFFF5EFE0);
  static const paper = Colors.white;
  static const ink = Color(0xFF101010);
  static const ink80 = Color(0xFF2A2A2A);
  static const ink60 = Color(0xFF6B6B6B);
  static const ink40 = Color(0xFF9A9A9A);
  static const ink20 = Color(0xFFE8E6E0);
  static const line = Color(0xFFE9E5D9);

  // Brand
  static const grape = Color(0xFF6C4BF2);
  static const grapeSoft = Color(0xFFEDE8FF);
  static const grapeMid = Color(0xFFB8A6FF);

  // Semantic
  static const leaf = Color(0xFF1B9E6B);
  static const leafSoft = Color(0xFFE6F4EE);
  static const sun = Color(0xFFFFB800);
  static const sunSoft = Color(0xFFFFF3CC);
  static const coral = Color(0xFFFF4A3D);
  static const coralSoft = Color(0xFFFFE9E9);
  static const sky = Color(0xFF4A7CFF);
  static const skySoft = Color(0xFFEAF0FF);
  static const lime = Color(0xFFCCFF00);
  static const limeSoft = Color(0xFFF0FFCC);

  // Gradients
  static const grapeGrad = LinearGradient(
    colors: [Color(0xFF6C4BF2), Color(0xFF8B6CFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const inkGrad = LinearGradient(
    colors: [Color(0xFF101010), Color(0xFF2E2E2E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
