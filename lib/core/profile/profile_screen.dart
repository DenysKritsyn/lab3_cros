import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/profile/widgets/saved_phone_card.dart';
import 'package:nova_poshta_mail_tracker/core/sign_in/sign_in_screen.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_header.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_bottom_navigation.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo, screen title and account
            AccountHeader(
              title: 'Профіль',
              onAccountPressed: () {
                // The account screen is already open.
              },
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
                    const Center(
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Color(0xFFFFF0F1),
                          child: Text(
                            'ОМ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: applicationMainColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
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
                      style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 12),

                    // Edit Profile Button
                    Center(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Open profile editing.
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1F2937),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          side: const BorderSide(color: Color(0xFFC8CEDA)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.edit_outlined, size: 20),
                        label: const Text(
                          'Редагувати профіль',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Saved Phone Numbers
                    const Text(
                      'ЗБЕРЕЖЕНІ НОМЕРИ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF6B7280),
                      ),
                    ),
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
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFFDDE1E7)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              // TODO: Open password changing.
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF6F7F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.key_outlined,
                                size: 18,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            title: const Text(
                              'Змінити пароль',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            indent: 14,
                            endIndent: 14,
                            color: Color(0xFFDDE1E7),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute<void>(
                                  builder: (context) => const SignInScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFECEF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.logout_rounded,
                                size: 18,
                                color: applicationMainColor,
                              ),
                            ),
                            title: const Text(
                              'Вийти з акаунта',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: applicationMainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
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
