import 'package:flutter/material.dart';

class EditPhoneActions extends StatelessWidget {
  const EditPhoneActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            // TODO: Edit the phone number.
          },
          tooltip: 'Редагувати номер',
          constraints: const BoxConstraints.tightFor(width: 30, height: 32),
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.edit_outlined,
            size: 18,
            color: Color(0xFF6B7280),
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Delete the phone number.
          },
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
    );
  }
}
