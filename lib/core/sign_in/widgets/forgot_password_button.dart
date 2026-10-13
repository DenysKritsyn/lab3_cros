import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color mainColor;
  final double fontSize;

  const ForgotPasswordButton({
    super.key,
    required this.onPressed,
    required this.mainColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: mainColor,
        ),
        child: Text(
          'Забули пароль?',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
