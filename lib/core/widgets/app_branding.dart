import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// Application name and logo
class AppBranding extends StatelessWidget {
  final Color mainColor;

  const AppBranding({
    super.key,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/app_icon.svg',
          width: 44,
          height: 44,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Трекер',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
                height: 1.1,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'НОВА ПОШТА',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: mainColor,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
