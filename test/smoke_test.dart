import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_ai_super_app/app_shell.dart';
import 'package:student_ai_super_app/screens/registry.dart';

/// Tap-through smoke test at real phone width (412dp, like the emulator).
/// Scaffold harness matches the real app (AppShell always provides one).
Widget _page(ScreenEntry e) =>
    MaterialApp(home: Scaffold(body: Builder(builder: e.build)));

ScreenEntry _byId(String id) =>
    screenRegistry.firstWhere((e) => e.id == id);

Future<void> _clean(WidgetTester t) async {
  await t.pumpWidget(Container());
  await t.pump(const Duration(seconds: 1));
}

void main() {
  setUp(() {
    final view = TestWidgetsFlutterBinding.instance.platformDispatcher.views.first;
    view.physicalSize = const Size(412 * 3, 900 * 3);
    view.devicePixelRatio = 3.0;
  });
  tearDown(() {
    final view = TestWidgetsFlutterBinding.instance.platformDispatcher.views.first;
    view.resetPhysicalSize();
    view.resetDevicePixelRatio();
  });

  for (final e in screenRegistry) {
    testWidgets('builds ${e.id} ${e.title}', (t) async {
      await t.pumpWidget(_page(e));
      await t.pump(const Duration(seconds: 2));
      expect(t.takeException(), isNull);
      await _clean(t);
    });
  }

  testWidgets('shell header reaches search + notifications', (t) async {
    await t.pumpWidget(const MaterialApp(home: AppShell()));
    await t.tap(find.byIcon(Icons.search));
    await t.pumpAndSettle();
    expect(find.text('Search'), findsWidgets);
    Navigator.of(t.element(find.text('Search'))).pop();
    await t.pumpAndSettle();
    await t.tap(find.byIcon(Icons.notifications_outlined));
    await t.pumpAndSettle();
    expect(find.text('Notifications'), findsWidgets);
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('Onboarding → auth chain', (t) async {
    await t.pumpWidget(_page(_byId('S19')));
    await t.tap(find.text('Next →'));
    await t.pumpAndSettle();
    await t.tap(find.text('Next →'));
    await t.pumpAndSettle();
    await t.tap(find.text('18+'));
    await t.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('Dashboard tiles fan out', (t) async {
    await t.pumpWidget(const MaterialApp(home: AppShell()));
    await t.scrollUntilVisible(find.text('7.84'), 200);
    await t.tap(find.text('7.84'));
    await t.pumpAndSettle();
    expect(find.text('Academic'), findsWidgets);
    await _clean(t);
  });

  testWidgets('S01 navigates to quiz', (t) async {
    await t.pumpWidget(const MaterialApp(home: AppShell()));
    await t.scrollUntilVisible(
        find.text('Retake weak topics'), 200);
    await t.tap(find.text('Retake weak topics'));
    await t.pumpAndSettle();
    expect(find.textContaining('CN Sprint'), findsWidgets);
    await _clean(t);
  });

  testWidgets('S03 chat send does not throw', (t) async {
    await t.pumpWidget(const MaterialApp(home: AppShell()));
    await t.tap(find.byIcon(Icons.auto_awesome));
    await t.pumpAndSettle();
    await t.enterText(find.byType(TextField), 'TCP handshake');
    await t.tap(find.byIcon(Icons.arrow_upward));
    await t.pump(const Duration(milliseconds: 500));
    expect(find.textContaining('SYN'), findsWidgets);
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('S04 full quiz run + dispose-safe timer', (t) async {
    await t.pumpWidget(_page(_byId('S04')));
    for (var q = 0; q < 5; q++) {
      final opts = find.byWidgetPredicate((w) =>
          w is GestureDetector &&
          w.child is Container &&
          (w.child as Container).child is Text);
      await t.tap(opts.first);
      await t.pump();
      await t.tap(find.text(q < 4 ? 'Next →' : 'Finish • See score'));
      await t.pump();
    }
    await t.pump();
    expect(find.textContaining('You scored'), findsOneWidget);
    await t.tap(find.text('↻ Retry'));
    await t.pump();
    await _clean(t);
    expect(t.takeException(), isNull);
  });

  testWidgets('S06 week toggle + override sheet', (t) async {
    await t.pumpWidget(_page(_byId('S06')));
    await t.tap(find.text('Week'));
    await t.pump();
    await t.tap(find.text('Day'));
    await t.pump();
    await t.tap(find.text('+ Add'));
    await t.pumpAndSettle();
    await t.tap(find.text('Save date override'));
    await t.pumpAndSettle();
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('S08 filters + sheet + done', (t) async {
    await t.pumpWidget(_page(_byId('S08')));
    await t.tap(find.textContaining('Pending ('));
    await t.pump();
    await t.tap(find.text('DBMS — ER diagram'));
    await t.pumpAndSettle();
    await t.tap(find.text('✓ Mark done'));
    await t.pumpAndSettle();
    expect(find.textContaining('Done ('), findsWidgets);
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('S10 reader note', (t) async {
    await t.pumpWidget(_page(_byId('S10')));
    await t.tap(find.text('Saved (6)'));
    await t.pump();
    await t.tap(find.text('OS — Dec 2022'));
    await t.pumpAndSettle();
    await t.tap(find.text('📝 Note'));
    await t.pump();
    expect(find.textContaining('mock Q7'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S12 AI rewrite commands', (t) async {
    await t.pumpWidget(_page(_byId('S12')));
    await t.tap(find.text('Exam'));
    await t.pump();
    await t.tap(find.text('CN — Routing (5-mark ready)'));
    await t.pumpAndSettle();
    await t.tap(find.text('Add example'));
    await t.pump();
    expect(find.textContaining('single track'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S14 mark read + toggle', (t) async {
    await t.pumpWidget(_page(_byId('S14')));
    await t.tap(find.text('DBMS at 11:00 • R204'));
    await t.pump();
    expect(find.text('3 new'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S16 revoke + logout-all confirm', (t) async {
    await t.pumpWidget(_page(_byId('S16')));
    await t.tap(find.text('Revoke'));
    await t.pump();
    await t.ensureVisible(find.text('🚪 Logout all devices'));
    await t.tap(find.text('🚪 Logout all devices'));
    await t.pumpAndSettle();
    await t.tap(find.text('Delete'));
    await t.pumpAndSettle();
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('S17 withdraw + guarded delete', (t) async {
    await t.pumpWidget(_page(_byId('S17')));
    await t.tap(find.text('Personalized AI'));
    await t.pump();
    await t.ensureVisible(find.text('Request deletion…'));
    await t.tap(find.text('Request deletion…'));
    await t.pumpAndSettle();
    await t.tap(find.text('Delete'));
    await t.pumpAndSettle();
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('S18 file a grievance', (t) async {
    await t.pumpWidget(_page(_byId('S18')));
    await t.enterText(find.byType(TextField), 'Test complaint body');
    await t.ensureVisible(find.text('Submit grievance'));
    await t.tap(find.text('Submit grievance'));
    await t.pump();
    expect(find.text('Filed as #GR-1043 ✓'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S20 OTP full flow into app', (t) async {
    await t.pumpWidget(_page(_byId('S20')));
    await t.tap(find.text('Log in →'));
    await t.pumpAndSettle();
    final boxes = find.byWidgetPredicate(
        (w) => w is TextField && w.maxLength == 1);
    expect(boxes, findsNWidgets(6));
    for (var i = 0; i < 6; i++) {
      await t.enterText(boxes.at(i), '${(i + 1) % 10}');
      await t.pump();
    }
    await t.tap(find.text('Verify →'));
    await t.pumpAndSettle();
    expect(find.text('Setup your semester'), findsOneWidget);
    await t.tap(find.text('Build my dashboard →'));
    await t.pumpAndSettle();
    expect(find.text('STUDENT OS'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S21 setup gates + enters app', (t) async {
    await t.pumpWidget(_page(_byId('S21')));
    await t.tap(find.text('ML'));
    await t.pump();
    await t.ensureVisible(find.text('Build my dashboard →'));
    await t.tap(find.text('Build my dashboard →'));
    await t.pumpAndSettle();
    expect(find.text('STUDENT OS'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S24 analyze + apply flips ATS', (t) async {
    await t.pumpWidget(_page(_byId('S24')));
    await t.ensureVisible(find.text('✨ Analyze'));
    await t.tap(find.text('✨ Analyze'));
    await t.pump();
    await t.ensureVisible(find.text('Apply all →'));
    await t.tap(find.text('Apply all →'));
    await t.pump();
    expect(find.text('Applied ✓'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S27 invite + accept + chat', (t) async {
    await t.pumpWidget(_page(_byId('S27')));
    await t.tap(find.text('Invite').first);
    await t.pump();
    await t.ensureVisible(find.text('Accept'));
    await t.tap(find.text('Accept'));
    await t.pump();
    await t.enterText(find.byType(TextField).last, 'hello team');
    await t.tap(find.byIcon(Icons.arrow_upward));
    await t.pump();
    expect(find.textContaining('hello team'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S29 like + reply + post', (t) async {
    await t.pumpWidget(_page(_byId('S29')));
    await t.tap(find.byIcon(Icons.favorite_border).first);
    await t.pump();
    await t.tap(find.byIcon(Icons.chat_bubble_outline).first);
    await t.pumpAndSettle();
    await t.enterText(find.byType(TextField).last, 'nice post');
    await t.tap(find.text('Reply'));
    await t.pumpAndSettle();
    expect(find.textContaining('nice post'), findsWidgets);
    await _clean(t);
  });

  testWidgets('S30 quiz to result', (t) async {
    await t.pumpWidget(_page(_byId('S30')));
    await t.tap(find.byIcon(Icons.play_arrow));
    await t.pump();
    for (var q = 0; q < 3; q++) {
      final opts = find.byWidgetPredicate((w) =>
          w is GestureDetector &&
          w.child is Container &&
          (w.child as Container).child is Text);
      await t.tap(opts.first);
      await t.pump();
    }
    expect(find.text('Back to feed'), findsOneWidget);
    await _clean(t);
  });

  testWidgets('S32 confirm + sheet', (t) async {
    await t.pumpWidget(_page(_byId('S32')));
    await t.drag(find.byType(ListView), const Offset(0, -700));
    await t.pump();
    await t.tap(find.text('Confirm ↗'));
    await t.pump();
    await t.tap(find.text('Cancel'));
    await t.pump();
    await t.tap(find.text('Sheet ↗'));
    await t.pump();
    await t.tap(find.text('✏️ Edit'));
    await t.pump();
    expect(t.takeException(), isNull);
    await _clean(t);
  });

  testWidgets('Mastery flow gates retest until 4+', (t) async {
    await t.pumpWidget(_page(screenRegistry.last));
    for (var i = 0; i < 3; i++) {
      await t.tap(find.text('Next →'));
      await t.pump();
    }
    await t.tap(find.textContaining('Score 4+ to continue'));
    await t.pump();
    for (var k = 0; k < 5; k++) {
      await t.tap(find.text('Got it ✓').first);
      await t.pump();
    }
    await t.tap(find.text('Unlocked — retest →'));
    await t.pump();
    expect(find.textContaining('80%'), findsWidgets);
    await _clean(t);
  });
}
