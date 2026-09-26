import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData buildTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: const ColorScheme.light(
        primary: AppColors.ink,
        secondary: AppColors.grape,
        surface: Colors.white,
        error: AppColors.coral,
        onSurface: AppColors.ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
          color: AppColors.ink,
        ),
        iconTheme: IconThemeData(color: AppColors.ink),
      ),
      cardTheme: const CardThemeData(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      chipTheme: const ChipThemeData(
        shape: StadiumBorder(),
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.ink),
        secondaryLabelStyle: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(fontSize: 13, color: AppColors.ink40),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.grape, width: 1.4),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, height: 1.1, color: AppColors.ink),
        headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.ink),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.ink),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.ink),
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.6, color: AppColors.ink60),
        bodyMedium: TextStyle(fontSize: 13.5, height: 1.5, color: AppColors.ink80),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.ink60),
        labelSmall: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w800, letterSpacing: 0.7, color: AppColors.ink60),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.ink,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.line, thickness: 1, space: 1),
    );
