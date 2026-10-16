import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_option.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/favorites_screen.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/auth_header.dart';
import 'package:nova_poshta_mail_tracker/core/sign_up/widgets/confirm_password_input.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_input.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_main_button.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Main application color
  static const Color applicationMainColor = Color(0xFFE22629);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 12),

                // Logo and application's name
                AuthHeader(mainColor: applicationMainColor),

                const SizedBox(height: 28),

                // Header
                const Text(
                  'Створіть акаунт',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF111827),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                // Subheader
                const Text(
                  'Зберігайте потрібні ТТН і швидко перевіряйте шлях посилок.',
                  style: LargeFadeTextStyle(),
                ),

                const SizedBox(height: 24),

                // Email Input
                const Text('Електронна пошта', style: SemiBoldTextStyle()),
                const SizedBox(height: 8),
                NovaInput(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  placeholder: 'name@example.com',
                  mainColor: applicationMainColor,
                ),

                const SizedBox(height: 20),

                // Password Input
                const Text('Пароль', style: SemiBoldTextStyle()),
                const SizedBox(height: 8),
                NovaInput(
                  controller: _passwordController,
                  placeholder: "*********",
                  mainColor: applicationMainColor,
                  isPassword: true,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Щонайменше 8 символів',
                  style: SmallFadeTextStyle(),
                ),
                const SizedBox(height: 16),

                // Confirm Password Input
                ConfirmPasswordInput(
                  passwordController: _passwordController,
                  controller: _confirmPasswordController,
                  mainColor: applicationMainColor,
                ),
                const SizedBox(height: 16),

                // Register Button
                NovaMainButton(
                  onPressed: () {
                    // Open favorites screen.
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const FavoritesScreen(),
                      ),
                    );
                  },
                  text: 'Зареєструватися',
                  fontSize: 16,
                  icon: Icons.person_add_alt_1_outlined,
                  iconSize: 20,
                  color: applicationMainColor,
                ),

                // "Already have an account?" Option
                AccountOption(
                  text: 'Вже маєте акаунт?',
                  actionText: 'Повернутися до входу',
                  onTap: () {
                    // Return to SignInScreen.
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
