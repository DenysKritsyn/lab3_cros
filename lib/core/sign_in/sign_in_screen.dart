import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/favorites/favorites_screen.dart';
import 'package:nova_poshta_mail_tracker/core/forgot_password/forgot_password_screen.dart';
import 'package:nova_poshta_mail_tracker/core/sign_up/sign_up_screen.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/auth_header.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/custom_input.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/main_button.dart';

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 32.0,
                ),

                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const SizedBox(height: 12),

                      // Logo and application's name
                      AuthHeader(mainColor: applicationMainColor),

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
                      const Text(
                        'Увійдіть у свій акаунт',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF6B7280),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Email Input
                      const Text(
                        'Електронна пошта',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomInput(
                        controller: _emailController,
                        placeholder: "some.mail.example@gmail.com",
                        mainColor: applicationMainColor,
                      ),

                      const SizedBox(height: 20),

                      // Password Input
                      const Text(
                        'Пароль',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomInput(
                        controller: _passwordController,
                        placeholder: "*********",
                        mainColor: applicationMainColor,
                        isPassword: true,
                      ),

                      const SizedBox(height: 12),

                      // "Forgot your password?" Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            foregroundColor: applicationMainColor,
                          ),
                          child: const Text(
                            'Забули пароль?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: applicationMainColor,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // LogIn Button
                      MainButton(
                        onPressed: () {
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
                      const Spacer(),

                      // "Don't have an account yet?" Option
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Text(
                                'Ще не маєте акаунту? ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (context) => const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Зареєструватися',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: applicationMainColor,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
