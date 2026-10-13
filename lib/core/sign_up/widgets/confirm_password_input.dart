import 'package:flutter/material.dart';

class ConfirmPasswordInput extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController controller;
  final Color mainColor;

  const ConfirmPasswordInput({
    super.key,
    required this.passwordController,
    required this.controller,
    required this.mainColor,
  });

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_updateStatus);
    widget.controller.addListener(_updateStatus);
  }

  @override
  void didUpdateWidget(covariant ConfirmPasswordInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.passwordController != widget.passwordController) {
      oldWidget.passwordController.removeListener(_updateStatus);
      widget.passwordController.addListener(_updateStatus);
    }
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_updateStatus);
      widget.controller.addListener(_updateStatus);
    }
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_updateStatus);
    widget.controller.removeListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.controller.text.isNotEmpty;
    final passwordsMatch =
        widget.controller.text == widget.passwordController.text;
    final statusColor = passwordsMatch
        ? const Color(0xFF009B50)
        : widget.mainColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Підтвердіть пароль',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: const TextStyle(fontSize: 15, color: Color(0xFF111827)),
          decoration: InputDecoration(
            hintText: '*********',
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: IconButton(
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
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasValue ? statusColor : const Color(0xFFD1D5DB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasValue ? statusColor : widget.mainColor,
                width: 1.5,
              ),
            ),
          ),
        ),
        if (hasValue) ...[
          const SizedBox(height: 8),
          Text(
            passwordsMatch ? 'Паролі збігаються' : 'Паролі не збігаються',
            style: TextStyle(fontSize: 12, color: statusColor),
          ),
        ],
      ],
    );
  }
}
