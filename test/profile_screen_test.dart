import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nova_poshta_mail_tracker/main.dart';
import 'package:nova_poshta_mail_tracker/core/profile/profile_screen.dart';

void main() {
  testWidgets('Opens profile from the account icon and signs out', (
    tester,
  ) async {
    await tester.pumpWidget(const MainApp());
    await tester.tap(find.text('Увійти'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Акаунт'));
    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.text('Олена Мельник'), findsOneWidget);
    expect(find.text('olena.melnyk@gmail.com'), findsOneWidget);
    expect(find.text('+380 67 312 48 90'), findsOneWidget);
    expect(find.text('+380 93 805 16 42'), findsOneWidget);
    expect(find.text('ОМ'), findsNWidgets(2));
    expect(
      tester
          .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
          .currentIndex,
      2,
    );
    await tester.ensureVisible(find.text('Вийти з акаунта'));
    await tester.tap(find.text('Вийти з акаунта'));
    await tester.pumpAndSettle();
    expect(find.text('З поверненням!'), findsOneWidget);
    expect(
      Navigator.of(tester.element(find.text('З поверненням!'))).canPop(),
      isFalse,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Profile scrolls on a narrow screen', (tester) async {
    tester.view.physicalSize = const Size(320, 600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
    await tester.ensureVisible(find.text('Вийти з акаунта'));
    await tester.pumpAndSettle();
    expect(find.text('Вийти з акаунта').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
