import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/saved_phone_card.dart';

class PhoneNumbers extends StatelessWidget {
  final List<SavedPhoneCard> cards;

  const PhoneNumbers({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < cards.length; index++) ...[
          if (index > 0) const SizedBox(height: 10),
          cards[index],
        ],
      ],
    );
  }
}
