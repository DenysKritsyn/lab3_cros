import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_header.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_bottom_navigation.dart';
import 'package:nova_poshta_mail_tracker/core/profile/profile_screen.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/main_button.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // Main application color
  static const Color applicationMainColor = Color(0xFFE22629);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo, screen title and account
            AccountHeader(
              title: 'Вибране',
              onAccountPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),

            // Shipments
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Мої відправлення',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF111827),
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Немає активних посилок',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    MainButton(
                      onPressed: () {
                        // TODO: Open shipment search.
                      },
                      text: 'Знайти',
                      fontSize: 13,
                      icon: Icons.add,
                      iconSize: 20,
                      color: applicationMainColor,
                      width: null,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: const AccountBottomNavigation(currentIndex: 0),
    );
  }
}
