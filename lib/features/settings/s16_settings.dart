import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/state_views.dart';
import 'package:student_ai_super_app/features/notifications/s14_notifications.dart';
import 'package:student_ai_super_app/features/privacy/s17_privacy.dart';

/// S40–S43 Settings — account, security, sessions with revoke +
/// logout-others, appearance/language/accessibility (§29).
class S16Settings extends StatefulWidget {
  const S16Settings({super.key});
  @override
  State<S16Settings> createState() => _S16SettingsState();
}

class _S16SettingsState extends State<S16Settings> {
  bool laptop = true;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Text('Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const Text('Account • sessions • appearance',
              style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 12),
          _row(
            icon: Icons.person_rounded,
            tint: AppColors.skySoft,
            tintFg: AppColors.sky,
            title: 'Account',
            sub: 'karthik@sit.edu • verified',
          ),
          _row(
            icon: Icons.lock_rounded,
            tint: AppColors.grapeSoft,
            tintFg: AppColors.grape,
            title: 'Password & security',
            sub: 'Changed 2 mo ago • 2FA on',
          ),
          AppCard(
            onTap: () => Nav.go(context, const S17Privacy()),
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(children: [
              _icon(Icons.shield_rounded, AppColors.leafSoft, AppColors.leaf),
              const SizedBox(width: 12),
              const Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text('Privacy center',
                        style: TextStyle(
                            fontSize: 13.5, fontWeight: FontWeight.w700)),
                    SizedBox(height: 2),
                    Text('Data • consents • deletion',
                        style: TextStyle(
                            fontSize: 11.5, color: AppColors.ink60)),
                  ])),
              const Icon(Icons.chevron_right_rounded,
                  size: 18, color: AppColors.ink40),
            ]),
          ),
          const SizedBox(height: 8),
          AppCard(
            onTap: () => Nav.go(context, const S14Notifications()),
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(children: [
              _icon(Icons.notifications_rounded, AppColors.sunSoft,
                  const Color(0xFF8A6E00)),
              const SizedBox(width: 12),
              const Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text('Notification settings',
                        style: TextStyle(
                            fontSize: 13.5, fontWeight: FontWeight.w700)),
                    SizedBox(height: 2),
                    Text('5 on • 1 off • quiet 22–7',
                        style: TextStyle(
                            fontSize: 11.5, color: AppColors.ink60)),
                  ])),
              const Icon(Icons.chevron_right_rounded,
                  size: 18, color: AppColors.ink40),
            ]),
          ),
          const SizedBox(height: 8),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(children: [
                  _icon(Icons.devices_rounded, AppColors.creamDeep,
                      AppColors.ink),
                  const SizedBox(width: 10),
                  const Text('Sessions & devices',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.w800)),
                ]),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.leafSoft,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color:
                              AppColors.leaf.withValues(alpha: 0.22))),
                  child: const Row(children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('This phone',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700)),
                            Text('now • Bangalore',
                                style: TextStyle(
                                    fontSize: 11.5,
                                    color: AppColors.ink60)),
                          ]),
                    ),
                    SizedBox(width: 8),
                    Pill('Current', bg: AppColors.leaf),
                  ]),
                ),
                if (laptop) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AppColors.creamDeep,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.line)),
                    child: Row(children: [
                      const Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Laptop • Chrome',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700)),
                              Text('2h ago • hostel',
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      color: AppColors.ink60)),
                            ]),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                          onPressed: () =>
                              setState(() => laptop = false),
                          child: const Text('Revoke',
                              style: TextStyle(fontSize: 11.5))),
                    ]),
                  ),
                ],
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final ok = await StateViews.confirm(context,
                          title: 'Logout all other devices?',
                          copy:
                              'Ends every session except this one. Password stays.');
                      if (ok && context.mounted) {
                        setState(() => laptop = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Logged out everywhere else')));
                      }
                    },
                    icon: const Icon(Icons.logout_rounded, size: 16),
                    label: const Text('Logout all devices'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.ink,
                      side: const BorderSide(color: AppColors.line),
                      padding:
                          const EdgeInsets.symmetric(vertical: 12),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
              ])),
          const SizedBox(height: 8),
          AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(children: [
                  _icon(Icons.palette_rounded, AppColors.grapeSoft,
                      AppColors.grape),
                  const SizedBox(width: 10),
                  const Text('Appearance • Language • Access',
                      style: TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.w800)),
                ]),
                const SizedBox(height: 8),
                const Text(
                    'Cream / high-contrast • English • larger text • reduce motion.',
                    style: TextStyle(
                        fontSize: 12.5, color: AppColors.ink60, height: 1.4)),
              ])),
        ],
      );

  Widget _row({
    required IconData icon,
    required Color tint,
    required Color tintFg,
    required String title,
    required String sub,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: AppCard(
          padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(children: [
            _icon(icon, tint, tintFg),
            const SizedBox(width: 12),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 13.5, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Text(sub,
                      style: const TextStyle(
                          fontSize: 11.5, color: AppColors.ink60)),
                ])),
          ]),
        ),
      );

  static Widget _icon(IconData icon, Color bg, Color fg) => Container(
        width: 38,
        height: 38,
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(11)),
        child: Icon(icon, size: 18, color: fg),
      );
}
