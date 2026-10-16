import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/favorites_screen.dart';
import 'package:nova_poshta_mail_tracker/core/sign_in/sign_in_screen.dart';
import 'package:nova_poshta_mail_tracker/core/sign_up/sign_up_screen.dart';

void main() {
  for (final registration in [false, true]) {
    testWidgets(
      'Opens favorites without validation: registration=$registration',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: registration ? const SignUpScreen() : const SignInScreen(),
          ),
        );
        for (final field in find.byType(TextFormField).evaluate().toList()) {
          await tester.enterText(find.byWidget(field.widget), '');
        }
        final button = find.text(registration ? 'Зареєструватися' : 'Увійти');
        await tester.ensureVisible(button);
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.byType(FavoritesScreen), findsOneWidget);
        expect(find.text('Немає активних посилок'), findsOneWidget);
        expect(find.text('ОМ'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('Fits a narrow screen and leaves actions inactive', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));
    for (final label in ['Знайти', 'Пошук']) {
      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }
    expect(find.byType(FavoritesScreen), findsOneWidget);
    expect(
      tester
          .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
          .currentIndex,
      0,
    );
    expect(tester.takeException(), isNull);
  });
}
