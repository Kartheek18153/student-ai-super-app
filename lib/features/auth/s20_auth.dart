import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/app_widgets.dart';
import 'package:student_ai_super_app/features/setup/s21_setup.dart';

/// S54–S56 Auth — Google + email login, OTP with auto-advance/paste/timer,
/// password reset with session-revoke note (§31).
class S20Auth extends StatefulWidget {
  final bool minor;
  const S20Auth({super.key, this.minor = false});
  @override
  State<S20Auth> createState() => _S20AuthState();
}

class _S20AuthState extends State<S20Auth> {
  bool verify = false;
  final boxes = List.generate(6, (_) => TextEditingController());
  final nodes = List.generate(6, (_) => FocusNode());
  int rs = 42;
  Timer? tick;

  @override
  void initState() {
    super.initState();
    boxes[0].text = '4';
    boxes[1].text = '8';
    tick = Timer.periodic(const Duration(seconds: 1), (t) {
      if (rs <= 1) {
        t.cancel();
      }
      if (mounted) setState(() => rs = rs > 0 ? rs - 1 : 0);
    });
  }

  @override
  void dispose() {
    tick?.cancel();
    for (final c in boxes) {
      c.dispose();
    }
    for (final n in nodes) {
      n.dispose();
    }
    super.dispose();
  }

  bool get done => boxes.every((b) => b.text.length == 1);

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        children: [
          if (!verify) ...[
            Center(
                child: Column(children: [
              const SizedBox(height: 8),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x1A000000),
                          blurRadius: 16,
                          offset: Offset(0, 6)),
                    ]),
                child: const Center(
                    child: Text('◈',
                        style: TextStyle(
                            color: AppColors.lime,
                            fontSize: 22,
                            fontWeight: FontWeight.w900))),
              ),
              const SizedBox(height: 14),
              const Text('Welcome back',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.4,
                      color: AppColors.ink)),
              const SizedBox(height: 4),
              const Text('Your semester is waiting.',
                  style:
                      TextStyle(fontSize: 12.5, color: AppColors.ink60)),
            ])),
            const SizedBox(height: 20),
            AppCard(
                onTap: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: Border.all(color: AppColors.line),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 11,
                          backgroundColor: AppColors.grape,
                          child: Text('G',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900))),
                      SizedBox(width: 10),
                      Text('Continue with Google',
                          style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ink)),
                    ])),
            const SizedBox(height: 12),
            const Row(children: [
              Expanded(child: Divider(color: AppColors.line)),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                          color: AppColors.ink40))),
              Expanded(child: Divider(color: AppColors.line)),
            ]),
            const SizedBox(height: 12),
            const TextField(
                style: TextStyle(fontSize: 13.5, color: AppColors.ink),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_rounded,
                        size: 18, color: AppColors.ink40),
                    hintText: 'karthik@sit.edu',
                    hintStyle: TextStyle(color: AppColors.ink40))),
            const SizedBox(height: 10),
            const TextField(
                obscureText: true,
                style: TextStyle(fontSize: 13.5, color: AppColors.ink),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded,
                        size: 18, color: AppColors.ink40),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: AppColors.ink40))),
            const SizedBox(height: 16),
            PrimaryButton('Log in →',
                onTap: () => setState(() => verify = true)),
            const SizedBox(height: 6),
            Row(children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Create account',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.ink60)))),
              Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                      color: AppColors.ink20, shape: BoxShape.circle)),
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password?',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.grape)))),
            ]),
          ] else ...[
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    color: AppColors.grapeSoft,
                    borderRadius: BorderRadius.circular(12)),
                child:
                    const Icon(Icons.mark_email_read_rounded, color: AppColors.grape),
              ),
            )),
            const SizedBox(height: 12),
            const Center(
                child: Text('Check your inbox',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.3,
                        color: AppColors.ink))),
            const SizedBox(height: 4),
            Center(
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.creamDeep,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppColors.line)),
                    child: const Text('6-digit code sent to karthik@sit.edu',
                    style: TextStyle(
                            fontSize: 11.5, color: AppColors.ink60)))),
            const SizedBox(height: 18),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    6,
                    (i) => Container(
                          width: 48,
                          margin:
                              const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              if (boxes[i].text.isNotEmpty)
                                BoxShadow(
                                    color: AppColors.ink
                                        .withValues(alpha: 0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4)),
                            ],
                          ),
                          child: TextField(
                            controller: boxes[i],
                            focusNode: nodes[i],
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: AppColors.ink),
                            decoration: InputDecoration(
                                counterText: '',
                                filled: true,
                                fillColor: boxes[i].text.isNotEmpty
                                    ? AppColors.ink.withValues(alpha: 0.05)
                                    : Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: boxes[i].text.isNotEmpty
                                            ? AppColors.ink
                                            : AppColors.line,
                                        width: boxes[i].text.isNotEmpty
                                            ? 1.6
                                            : 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: AppColors.grape, width: 1.6))),
                            onChanged: (v) {
                              final d = v.replaceAll(RegExp(r'\D'), '');
                              boxes[i].text = d.length > 1
                                  ? d[d.length - 1]
                                  : d;
                              if (boxes[i].text.isNotEmpty && i < 5) {
                                nodes[i + 1].requestFocus();
                              }
                              setState(() {});
                            },
                          ),
                        ))),
            const SizedBox(height: 12),
            Center(
                child: rs > 0
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            color: AppColors.creamDeep,
                            borderRadius: BorderRadius.circular(999)),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.timer_outlined,
                              size: 14, color: AppColors.ink40),
                          const SizedBox(width: 6),
                          Text('Resend in 0:${rs.toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.ink60)),
                        ]),
                      )
                    : TextButton(
                        onPressed: () => setState(() => rs = 42),
                        child: const Text('↻ Resend code',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.grape)))),
            const SizedBox(height: 12),
            PrimaryButton(
                done
                    ? 'Verify →'
                    : 'Enter all 6 digits (${boxes.where((b) => b.text.isNotEmpty).length}/6)',
                onTap: done
                    ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                S21Setup(minor: widget.minor)))
                    : null),
            const SizedBox(height: 12),
            AppCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.grapeSoft,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.key_rounded,
                              size: 16, color: AppColors.grape)),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password reset',
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.ink)),
                              SizedBox(height: 3),
                              Text(
                                  'Email link → new password → all other sessions revoked automatically.',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.ink60,
                                      height: 1.35)),
                            ]),
                      ),
                    ])),
          ],
        ],
      );
}
