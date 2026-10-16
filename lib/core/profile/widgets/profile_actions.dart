import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class ProfileActions extends StatelessWidget {
  final Color mainColor;
  final VoidCallback onChangePassword;
  final VoidCallback onSignOut;

  const ProfileActions({
    super.key,
    required this.mainColor,
    required this.onChangePassword,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFDDE1E7)),
      ),
      clipBehavior: Clip.antiAlias,

      child: Column(
        children: [
          ListTile(
            onTap: onChangePassword,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
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
            title: const Text('Змінити пароль', style: SemiBoldTextStyle()),
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
            onTap: onSignOut,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            leading: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECEF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.logout_rounded, size: 18, color: mainColor),
            ),
            title: Text(
              'Вийти з акаунта',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
