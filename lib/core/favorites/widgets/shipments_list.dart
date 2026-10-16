import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/widgets/nova_main_button.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class ShipmentsList extends StatelessWidget {
  // TODO: Replace Object with the shipment model when it is available.
  final List<Object> shipments;
  final Color mainColor;

  const ShipmentsList({
    super.key,
    required this.shipments,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Add shipment cards when their model and UI are implemented.
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Мої відправлення',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF111827),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shipments.isEmpty
                      ? 'Немає активних посилок'
                      : 'Посилок: ${shipments.length}',
                  style: const FadeTextStyle(),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
