import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/auth_header.dart';

class AccountHeader extends StatelessWidget {
  final String title;
  final VoidCallback onAccountPressed;
  final Color mainColor;

  const AccountHeader({
    super.key,
    required this.title,
    required this.onAccountPressed,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFDDE1E7))),
      ),
      child: Row(
        children: [
          AuthHeader(mainColor: mainColor),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onAccountPressed,
            tooltip: 'Акаунт',
            padding: EdgeInsets.zero,
            icon: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFFFF0F1),
              child: Text(
                'ОМ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
