import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class AccountOption extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;

  const AccountOption({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('$text ', style: const FadeTextStyle()),
            GestureDetector(
              onTap: onTap,
              child: Text(
                actionText,
                style: const BoldTextStyle(color: Color(0xFFE22629)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
