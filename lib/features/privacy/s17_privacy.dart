import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/state_views.dart';

/// S44–S47 Privacy — data access/export/sharing, consent toggles with
/// withdraw, retention rules, guarded deletion (§30).
class S17Privacy extends StatefulWidget {
  const S17Privacy({super.key});
  @override
  State<S17Privacy> createState() => _S17PrivacyState();
}

class _S17PrivacyState extends State<S17Privacy> {
  final consents = {
    'Personalized AI': true,
    'Study reminders': true,
    'Anonymous research': false,
  };

  static const _rows = [
    (Icons.visibility_rounded, 'See my data', 'everything stored on you',
        AppColors.skySoft, AppColors.sky),
    (Icons.archive_rounded, 'Export my data', 'notes • tests • marks • ZIP',
        AppColors.grapeSoft, AppColors.grape),
    (Icons.share_rounded, 'Sharing', '1 shared note • 0 third parties',
        AppColors.leafSoft, AppColors.leaf),
  ];

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: [
          const Text('Privacy center',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const Text('Your data • consents • deletion',
              style: TextStyle(fontSize: 11.5, color: AppColors.ink60)),
          const SizedBox(height: 12),
          AppCard(
            color: AppColors.leafSoft,
            border: Border.all(
                color: AppColors.leaf.withValues(alpha: 0.25)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        color: AppColors.leaf,
                        borderRadius: BorderRadius.circular(11)),
                    child: const Icon(Icons.shield_rounded,
                        size: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                        'Your data trains YOUR tutor only. Never sold, never shared with colleges without consent.',
                        style: TextStyle(
                            fontSize: 12.5,
                            height: 1.4,
                            color: AppColors.ink80)),
                  ),
                ]),
          ),
          const SizedBox(height: 8),
          for (final row in _rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 12),
                onTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(
                        content: Text('${row.$2} — prepared'),
                        duration: const Duration(seconds: 1))),
                child: Row(children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        color: row.$4,
                        borderRadius: BorderRadius.circular(11)),
                    child: Icon(row.$1, size: 18, color: row.$5),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(row.$2,
                            style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text(row.$3,
                            style: const TextStyle(
                                fontSize: 11.5,
                                color: AppColors.ink60)),
                      ])),
                  const Icon(Icons.chevron_right_rounded,
                      size: 18, color: AppColors.ink40),
                ]),
              ),
            ),
          AppCard(
              child: Column(children: [
            for (final k in consents.keys)
              SwitchListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(k, style: const TextStyle(fontSize: 13)),
                value: consents[k]!,
                activeThumbColor: AppColors.leaf,
                onChanged: (v) {
                  setState(() => consents[k] = v);
                  if (!v) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '$k withdrawn — derived data purged')));
                  }
                },
              ),
          ])),
          const SizedBox(height: 8),
          AppCard(
            border:
                Border.all(color: AppColors.coral.withValues(alpha: 0.35)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                          color: AppColors.coralSoft,
                          borderRadius: BorderRadius.circular(11)),
                      child: const Icon(Icons.delete_rounded,
                          size: 18, color: AppColors.coral),
                    ),
                    const SizedBox(width: 12),
                    const Text('Delete account',
                        style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.coral)),
                  ]),
                  const SizedBox(height: 8),
                  const Text(
                      'Exports first, erases everything in 30 days. Needs password + OTP.',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.ink60,
                          height: 1.4)),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.coral,
                          side: const BorderSide(
                              color: AppColors.coral),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12),
                          shape: const StadiumBorder()),
                      onPressed: () async {
                        final ok = await StateViews.confirm(context,
                            title: 'Request deletion?',
                            copy:
                                'Starts with a full export, then erases everything in 30 days.');
                        if (ok && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Export started — deletion scheduled')));
                        }
                      },
                      child: const Text('Request deletion'),
                    ),
                  ),
                ]),
          ),
        ],
      );
}
