import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/favorites_screen.dart';
import 'package:nova_poshta_mail_tracker/core/profile/profile_screen.dart';

class AccountBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const AccountBottomNavigation({super.key, required this.currentIndex});

  static const Color applicationMainColor = Color(0xFFE22629);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFDDE1E7))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == currentIndex) return;
            if (index == 1) {
              // TODO: Open search.
              return;
            }
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => index == 0
                    ? const FavoritesScreen()
                    : const ProfileScreen(),
              ),
            );
          },
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: applicationMainColor,
          unselectedItemColor: const Color(0xFF8993A5),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border_rounded, size: 22),
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.favorite_border_rounded, size: 22),
              ),
              label: 'Вибране',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded, size: 22),
              label: 'Пошук',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_rounded, size: 22),
              activeIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.person_outline_rounded, size: 22),
              ),
              label: 'Профіль',
            ),
          ],
        ),
      ),
    );
  }
}
