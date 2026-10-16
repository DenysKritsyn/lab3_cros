import 'package:flutter/material.dart';

class NovaMainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final double fontSize;
  final double iconSize;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String text;
  final IconData icon;

  const NovaMainButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.fontSize,
    required this.iconSize,
    this.width = double.infinity,
    this.height = 52.0,
    this.margin,
    this.padding,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Container ignores margin when it is null, so no extra checks are needed.
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: iconSize, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
