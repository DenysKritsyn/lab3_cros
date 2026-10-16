import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  // Icon takes precedence when both text and icon are provided.
  final String? text;
  final IconData? icon;
  final Color mainColor;
  final Color borderColor;
  // Outer avatar diameter, including the border.
  final double size;
  final VoidCallback onPressed;

  const ProfilePhoto({
    super.key,
    this.text,
    this.icon,
    required this.mainColor,
    required this.borderColor,
    required this.size,
    required this.onPressed,
  }) : assert(size > 0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: size / 2,
                backgroundColor: borderColor,
                child: CircleAvatar(
                  radius: (size / 2 - 3).clamp(0.0, double.infinity),
                  backgroundColor: Color(0xFFFFF0F1),
                  child: icon != null
                    ? Icon(icon, size: size * 0.4, color: mainColor)
                    : text != null
                    ? Text(
                        text!,
                        style: TextStyle(
                          fontSize: size * 0.3,
                          fontWeight: FontWeight.w700,
                          color: mainColor,
                        ),
                      )
                    : null,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: IconButton(
                    onPressed: onPressed,
                    tooltip: 'Змінити фото',
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    constraints: const BoxConstraints.tightFor(
                      width: 12,
                      height: 12,
                    ),
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(foregroundColor: mainColor),
            child: const Text(
              'Змінити фото',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
