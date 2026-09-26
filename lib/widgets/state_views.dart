import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'app_widgets.dart';

/// One state kit replacing all 282 generated state HTML files:
/// loading / empty / error / offline / success / confirm / sheet.
class StateViews {
  static Widget loading(String what) => AppCard(
        child: Column(children: [
          const SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                  strokeWidth: 3, color: AppColors.grape)),
          const SizedBox(height: 10),
          Text('Loading $what…',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        ]),
      );

  static Widget empty(
          {required String emoji,
          required String title,
          required String copy,
          required String cta,
          VoidCallback? onTap}) =>
      AppCard(
        child: Column(children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 6),
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          Text(copy,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.5, color: Colors.black54)),
          const SizedBox(height: 10),
          PrimaryButton(cta, onTap: onTap),
        ]),
      );

  static Widget error(String what, {VoidCallback? onRetry}) => AppCard(
        child: Column(children: [
          const Text('⚠️', style: TextStyle(fontSize: 36)),
          Text('Could not load $what',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          const Text('Check connection — your data is safe on device.',
              style: TextStyle(fontSize: 12.5, color: Colors.black54)),
          const SizedBox(height: 10),
          PrimaryButton('Retry',
              onTap: onRetry, bg: AppColors.coral),
        ]),
      );

  static Widget offline(String what) => AppCard(
        color: AppColors.ink,
        child: const Column(children: [
          Text('📡', style: TextStyle(fontSize: 32)),
          SizedBox(height: 6),
          Text('You are offline',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          Text('Saved items still open. Changes sync later.',
              style: TextStyle(fontSize: 12, color: Colors.white60)),
        ]),
      );

  static Widget success(String title, String copy) => AppCard(
        color: const Color(0xFFE9F7F0),
        border: Border.all(color: AppColors.leaf.withValues(alpha: 0.4)),
        child: Column(children: [
          const Text('🎉', style: TextStyle(fontSize: 32)),
          Text(title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          Text(copy,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.5, color: Colors.black54)),
        ]),
      );

  static Future<bool> confirm(BuildContext context,
      {required String title, required String copy}) async {
    final v = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        content: Text(copy, style: const TextStyle(fontSize: 13)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: AppColors.coral),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete')),
        ],
      ),
    );
    return v ?? false;
  }

  static Future<void> options(BuildContext context,
      {required String title, required List<String> options}) =>
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(28))),
        builder: (_) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(999))),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            ...options.map((o) => ListTile(
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  title: Text(o, style: const TextStyle(fontSize: 13.5)),
                  onTap: () => Navigator.pop(context),
                )),
          ]),
        ),
      );
}
