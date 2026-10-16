import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nova_poshta_mail_tracker/main.dart';
import 'package:nova_poshta_mail_tracker/core/sign_up/sign_up_screen.dart';

void main() {
  testWidgets('Opens registration and password reset and returns to login', (
    tester,
  ) async {
    await tester.pumpWidget(const MainApp());
    await tester.enterText(
      find.byType(TextFormField).first,
      'user@example.com',
    );

    await tester.ensureVisible(find.text('Зареєструватися'));
    await tester.tap(find.text('Зареєструватися'));
    await tester.pumpAndSettle();
    expect(find.text('Створіть акаунт'), findsOneWidget);

    await tester.ensureVisible(find.text('Повернутися до входу'));
    await tester.tap(find.text('Повернутися до входу'));
    await tester.pumpAndSettle();
    expect(find.text('З поверненням!'), findsOneWidget);
    expect(find.text('user@example.com'), findsOneWidget);
    expect(
      Navigator.of(tester.element(find.text('З поверненням!'))).canPop(),
      isFalse,
    );

    await tester.ensureVisible(find.text('Забули пароль?'));
    await tester.tap(find.text('Забули пароль?'));
    await tester.pumpAndSettle();
    expect(find.text('Відновлення пароля'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pumpAndSettle();
    expect(find.text('З поверненням!'), findsOneWidget);
    expect(find.text('user@example.com'), findsOneWidget);
    expect(
      Navigator.of(tester.element(find.text('З поверненням!'))).canPop(),
      isFalse,
    );
  });

  testWidgets('Preserves the original login screen', (tester) async {
    await tester.pumpWidget(const MainApp());
    expect(find.text('З поверненням!'), findsOneWidget);
    expect(find.text('some.mail@gmail.com'), findsOneWidget);
    expect(find.text('Забули пароль?'), findsOneWidget);
    expect(find.text('Увійти'), findsOneWidget);
  });

  testWidgets('Accepts confirmation input without password validation', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(1), 'password123');
    await tester.enterText(fields.at(2), 'password123');
    await tester.pump();
    expect(find.text('Паролі збігаються'), findsNothing);
    await tester.enterText(fields.at(1), 'different123');
    await tester.pump();
    expect(find.text('Паролі не збігаються'), findsNothing);
    expect(find.text('Паролі збігаються'), findsNothing);
    await tester.tap(find.byIcon(Icons.visibility_off_outlined).last);
    await tester.pump();
    expect(
      tester.widget<TextField>(find.byType(TextField).last).obscureText,
      isFalse,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Scrolls on a narrow screen with the keyboard open', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(398, 852);
    tester.view.devicePixelRatio = 1;
    tester.view.viewInsets = const FakeViewPadding(bottom: 340);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));
    await tester.ensureVisible(find.text('Повернутися до входу'));
    await tester.pumpAndSettle();
    expect(find.text('Повернутися до входу').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
