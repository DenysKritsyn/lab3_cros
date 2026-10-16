import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class SavedPhoneCard extends StatelessWidget {
  final String number;
  final String label;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SavedPhoneCard({
    super.key,
    required this.number,
    required this.label,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDDE1E7)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFF6F7F9),
            child: Icon(
              Icons.phone_outlined,
              size: 18,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: const SemiBoldTextStyle(),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          if (onEdit != null)
            IconButton(
              onPressed: onEdit,
              tooltip: 'Редагувати номер',
              constraints: const BoxConstraints.tightFor(width: 30, height: 32),
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.edit_outlined,
                size: 18,
                color: Color(0xFF6B7280),
              ),
            ),
          if (onDelete != null)
            IconButton(
              onPressed: onDelete,
              tooltip: 'Видалити номер',
              constraints: const BoxConstraints.tightFor(width: 30, height: 32),
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.delete_outline_rounded,
                size: 18,
                color: Color(0xFFE22629),
              ),
            ),
        ],
      ),
    );
  }
}
