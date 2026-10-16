import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/profile/widgets/profile_actions.dart';
import 'package:nova_poshta_mail_tracker/core/profile/widgets/profile_avatar.dart';
import 'package:nova_poshta_mail_tracker/core/profile/widgets/edit_profile_button.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/saved_phone_card.dart';
import 'package:nova_poshta_mail_tracker/core/edit_profile/edit_profile_screen.dart';
import 'package:nova_poshta_mail_tracker/core/sign_in/sign_in_screen.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_header.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_bottom_navigation.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              title: 'Профіль',
              mainColor: applicationMainColor,
              onAccountPressed: () {},
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // Account details
                    const ProfileAvatar(
                      text: 'ОМ',
                      mainColor: applicationMainColor,
                    ),
                    const SizedBox(height: 12),

                    // Data
                    const Text(
                      'Олена Мельник',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'olena.melnyk@gmail.com',
                      textAlign: TextAlign.center,

                      style: FadeTextStyle(),
                    ),
                    const SizedBox(height: 12),

                    // Edit Profile Button
                    EditProfileButton(
                      onPressed: () {
                        // Open EditProfileScreen.
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 28),

                    // Saved Phone Numbers
                    const Text('ЗБЕРЕЖЕНІ НОМЕРИ', style: BoldFadeTextStyle()),
                    const SizedBox(height: 8),
                    const SavedPhoneCard(
                      number: '+380 67 312 48 90',
                      label: 'Основний',
                    ),
                    const SizedBox(height: 10),
                    const SavedPhoneCard(
                      number: '+380 93 805 16 42',
                      label: 'Робочий',
                    ),
                    const SizedBox(height: 18),

                    // Account Actions
                    ProfileActions(
                      mainColor: applicationMainColor,
                      onChangePassword: () {},
                      onSignOut: () {
                        // Transfers to sign in screen
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute<void>(
                            builder: (context) => const SignInScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: const AccountBottomNavigation(currentIndex: 2),
    );
  }
}
