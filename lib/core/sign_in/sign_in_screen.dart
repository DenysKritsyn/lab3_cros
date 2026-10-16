import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/sign_in/widgets/forgot_password_button.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/account_option.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/favorites_screen.dart';
import 'package:nova_poshta_mail_tracker/core/forgot_password/forgot_password_screen.dart';
import 'package:nova_poshta_mail_tracker/core/sign_up/sign_up_screen.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/app_branding.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_input.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_main_button.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController(
    text: 'some.mail@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '*********',
  );

  // Main application color
  static const Color applicationMainColor = Color(0xFFE22629);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 12),

              // Logo and application's name
              AppBranding(mainColor: applicationMainColor),

              const SizedBox(height: 36),

              // Header
              const Text(
                'З поверненням!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF111827),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Увійдіть у свій акаунт', style: LargeFadeTextStyle()),

              const SizedBox(height: 32),

              // Email Input
              const Text('Електронна пошта', style: SemiBoldTextStyle()),
              const SizedBox(height: 8),
              NovaInput(
                controller: _emailController,
                placeholder: "some.mail.example@gmail.com",
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

              const SizedBox(height: 12),

              // "Forgot your password?" Button
              ForgotPasswordButton(
                onPressed: () {
                  // Open forgot password screen.
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                mainColor: applicationMainColor,
                fontSize: 13,
              ),

              const SizedBox(height: 24),

              // LogIn Button
              NovaMainButton(
                onPressed: () {
                  // Open FavoritesScreen.
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const FavoritesScreen(),
                    ),
                  );
                },
                text: 'Увійти',
                fontSize: 16,
                icon: Icons.login_rounded,
                iconSize: 20,
                color: applicationMainColor,
              ),

              // "Don't have an account yet?" Option
              AccountOption(
                text: 'Ще не маєте акаунту?',
                actionText: 'Зареєструватися',
                onTap: () {
                  // Open sign up screen.
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
