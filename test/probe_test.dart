import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_ai_super_app/screens/s01_dashboard.dart';

void main() {
  testWidgets('probe S01 overflow', (t) async {
    await t.pumpWidget(
        const MaterialApp(home: Scaffold(body: S01Dashboard())));
    await t.pump();
  });
}
