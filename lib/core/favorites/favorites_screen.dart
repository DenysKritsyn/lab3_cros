import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_header.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_bottom_navigation.dart';
import 'package:nova_poshta_mail_tracker/core/profile/profile_screen.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/widgets/shipments_list.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_main_button.dart';

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
          children: [
            // Logo, screen title and account
            AccountHeader(
              title: 'Вибране',
              mainColor: applicationMainColor,
              onAccountPressed: () {
                // Open ProfileScreen.
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),

            Row(children: [

            // Shipments
            Expanded(
              child: ShipmentsList(
                shipments: const [],
                mainColor: applicationMainColor,
              ),
            ),
            const SizedBox(width: 12),

            // Find button
            NovaMainButton(
              onPressed: (){},
              text: 'Знайти',
              fontSize: 13,
              icon: Icons.add,
              iconSize: 20,
              color: applicationMainColor,
              width: null,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(right: 16),
            ),
            ],)
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: const AccountBottomNavigation(currentIndex: 0),
    );
  }
}
