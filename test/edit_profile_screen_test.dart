import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/favorites_screen.dart';
import 'package:nova_poshta_mail_tracker/core/profile/profile_screen.dart';
import 'package:nova_poshta_mail_tracker/core/edit_profile/edit_profile_screen.dart';

void main() {
  testWidgets('Switches tabs and returns from editing without saving', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: FavoritesScreen()));
    final navigation = find.byType(BottomNavigationBar);
    await tester.tap(
      find.descendant(of: navigation, matching: find.text('Профіль')),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);
    await tester.tap(
      find.descendant(of: navigation, matching: find.text('Вибране')),
    );
    await tester.pumpAndSettle();
    expect(find.byType(FavoritesScreen), findsOneWidget);
    await tester.tap(
      find.descendant(of: navigation, matching: find.text('Профіль')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Редагувати профіль'));
    await tester.pumpAndSettle();
    expect(find.byType(EditProfileScreen), findsOneWidget);
    expect(find.text('Олена Мельник'), findsOneWidget);
    expect(find.text('olena.melnyk@gmail.com'), findsOneWidget);
    expect(find.text('+380 67 312 48 90'), findsOneWidget);
    expect(find.text('+380 93 805 16 42'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).first, 'Інше ім’я');
    await tester.ensureVisible(find.text('Зберегти зміни'));
    await tester.tap(find.text('Зберегти зміни'));
    await tester.pumpAndSettle();
    expect(find.byType(EditProfileScreen), findsOneWidget);
    await tester.tap(find.byTooltip('Назад'));
    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.text('Олена Мельник'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Editing scrolls with the keyboard on a narrow screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpWidget(const MaterialApp(home: EditProfileScreen()));
    await tester.ensureVisible(find.text('Зберегти зміни'));
    await tester.pumpAndSettle();
    expect(find.text('Зберегти зміни').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
