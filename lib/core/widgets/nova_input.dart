import 'package:flutter/material.dart';
import 'package:nova_poshta_mail_tracker/core/text_styles.dart';

class NovaInput extends StatefulWidget {
  final TextEditingController? controller;
  final String placeholder;
  final Color mainColor;
  final bool isPassword;
  final TextInputType? keyboardType;

  const NovaInput({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.mainColor,
    this.isPassword = false,
    this.keyboardType,
  });

  @override
  State<NovaInput> createState() => _NovaInputState();
}

class _NovaInputState extends State<NovaInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      style: const BaseTextStyle(),
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: const HintTextStyle(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFF9CA3AF),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.mainColor, width: 1.5),
        ),
      ),
    );
  }
}
