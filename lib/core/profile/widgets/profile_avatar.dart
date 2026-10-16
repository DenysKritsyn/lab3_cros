import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String text;
  final Color mainColor;

  const ProfileAvatar({super.key, required this.text, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Avatar
      child: CircleAvatar(
        radius: 38,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Color(0xFFFFF0F1),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
