import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class PasswordResetNotice extends StatelessWidget {
  const PasswordResetNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F7EF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.mark_email_read_outlined,
            size: 20,
            color: Color(0xFF009B50),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Перевірте електронну пошту',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF009B50),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Ми надіслали лист для підтвердження зміни пароля.',
                  style: SmallFadeTextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
