import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// ─────────────────────────────────────────────────────────────
/// Design system — cream canvas, rounded cards, pill tags, soft shadows.
/// Every screen composes from these so the app feels like one product.
/// ─────────────────────────────────────────────────────────────

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Border? border;
  final Color? color;
  final Gradient? gradient;
  final VoidCallback? onTap;
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.border,
    this.color,
    this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final side = border is Border ? (border as Border).top : BorderSide.none;
    final card = Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? (color ?? Colors.white) : null,
        borderRadius: BorderRadius.circular(20),
        border: border != null ? Border.fromBorderSide(side) : null,
        boxShadow: const [
          BoxShadow(color: Color(0x0F000000), blurRadius: 16, offset: Offset(0, 4)),
          BoxShadow(color: Color(0x08000000), blurRadius: 32, offset: Offset(0, 12)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: side,
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
    if (onTap == null) return card;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: card,
    );
  }
}

class SectionHead extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;
  final IconData? icon;
  const SectionHead(this.title, {super.key, this.action, this.onAction, this.icon});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 4),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: AppColors.ink60),
              const SizedBox(width: 6),
            ],
            Expanded(
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: AppColors.ink60)),
            ),
            if (action != null)
              GestureDetector(
                onTap: onAction,
                child: Text(action!,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.grape)),
              ),
          ],
        ),
      );
}

class Pill extends StatelessWidget {
  final String text;
  final Color bg;
  final Color fg;
  final IconData? icon;
  final double fontSize;
  const Pill(this.text, {super.key, this.bg = AppColors.ink, this.fg = Colors.white, this.icon, this.fontSize = 10.5});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 11, color: fg), const SizedBox(width: 4)],
          Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w800, color: fg, letterSpacing: 0.3)),
        ]),
      );
}

class SoftPill extends StatelessWidget {
  final String text;
  final Color color;
  const SoftPill(this.text, {super.key, this.color = AppColors.grape});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: color.withValues(alpha: 0.18)),
        ),
        child: Text(text, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: color)),
      );
}

class ProgressBar extends StatelessWidget {
  final double value;
  final Color color;
  final double height;
  final Color? bg;
  const ProgressBar(this.value, {super.key, this.color = AppColors.ink, this.height = 6, this.bg});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: LinearProgressIndicator(
          value: value.clamp(0.0, 1.0),
          minHeight: height,
          backgroundColor: bg ?? Colors.black.withValues(alpha: 0.07),
          valueColor: AlwaysStoppedAnimation(color),
        ),
      );
}

class StatTile extends StatelessWidget {
  final String value, label;
  final Color? bg;
  final Color? fg;
  final IconData? icon;
  final VoidCallback? onTap;
  const StatTile(this.value, this.label, {super.key, this.bg, this.fg, this.icon, this.onTap});

  Widget _inner() => AppCard(
        color: bg,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(children: [
          if (icon != null) Icon(icon, size: 16, color: fg ?? AppColors.ink60),
          if (icon != null) const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: fg ?? AppColors.ink)),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: (fg ?? AppColors.ink).withValues(alpha: 0.55))),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return _inner();
    return InkWell(borderRadius: BorderRadius.circular(20), onTap: onTap, child: _inner());
  }
}

/// Push with its own Scaffold so any grid-opened page has a Material ancestor.
abstract final class Nav {
  static Future<T?> go<T>(BuildContext context, Widget page) => Navigator.push<T>(
        context,
        MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: page))),
      );
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color bg;
  final Color fg;
  final IconData? icon;
  final bool expanded;
  const PrimaryButton(this.label, {super.key, this.onTap, this.bg = AppColors.ink, this.fg = Colors.white, this.icon, this.expanded = true});

  @override
  Widget build(BuildContext context) {
    final btn = FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        backgroundColor: onTap == null ? Colors.black12 : bg,
        foregroundColor: onTap == null ? Colors.black38 : fg,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        shape: const StadiumBorder(),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
        if (icon != null) ...[Icon(icon, size: 16), const SizedBox(width: 6)],
        Text(label, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
      ]),
    );
    return expanded ? SizedBox(width: double.infinity, child: btn) : btn;
  }
}

class GhostButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  const GhostButton(this.label, {super.key, this.onTap, this.icon});
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.ink,
            side: const BorderSide(color: AppColors.line),
            padding: const EdgeInsets.symmetric(vertical: 13),
            shape: const StadiumBorder(),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            if (icon != null) ...[Icon(icon, size: 16), const SizedBox(width: 6)],
            Text(label, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
          ]),
        ),
      );
}

/// Small label + value row used in dashboards.
class LabeledValue extends StatelessWidget {
  final String label, value;
  final Color? valueColor;
  const LabeledValue(this.label, this.value, {super.key, this.valueColor});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.6, color: AppColors.ink40)),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: valueColor ?? AppColors.ink)),
      ]);
}

/// Empty state helper.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final String? cta;
  final VoidCallback? onCta;
  const EmptyState({super.key, required this.icon, required this.title, required this.subtitle, this.cta, this.onCta});
  @override
  Widget build(BuildContext context) => AppCard(
        child: Column(children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: AppColors.creamDeep, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, size: 28, color: AppColors.ink40),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12.5, color: AppColors.ink60, height: 1.4)),
          if (cta != null) ...[
            const SizedBox(height: 14),
            PrimaryButton(cta!, onTap: onCta, expanded: false),
          ],
        ]),
      );
}
