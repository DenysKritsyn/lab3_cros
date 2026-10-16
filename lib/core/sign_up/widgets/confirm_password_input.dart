import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_input.dart';

class ConfirmPasswordInput extends StatelessWidget {
  // TODO: Use this controller when password validation is implemented.
  final TextEditingController passwordController;
  final TextEditingController controller;
  final Color mainColor;

  const ConfirmPasswordInput({
    super.key,
    required this.passwordController,
    required this.controller,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Підтвердіть пароль', style: SemiBoldTextStyle()),
        const SizedBox(height: 8),
        NovaInput(
          controller: controller,
          placeholder: '*********',
          mainColor: mainColor,
          isPassword: true,
        ),
      ],
    );
  }
}
