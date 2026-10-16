import 'package:flutter/material.dart';

// Shared text styles reused across several screens.
// Each style extends TextStyle with a const constructor, so it can be used
// inside const widgets and further tweaked with copyWith when needed.

// Main dark text (e.g. text typed into inputs)
class BaseTextStyle extends TextStyle {
  const BaseTextStyle() : super(fontSize: 15, color: const Color(0xFF111827));
}

// Light grey placeholder text
class HintTextStyle extends TextStyle {
  const HintTextStyle() : super(fontSize: 15, color: const Color(0xFF9CA3AF));
}

// Semi-bold dark text (e.g. input labels, list titles)
class SemiBoldTextStyle extends TextStyle {
  const SemiBoldTextStyle()
    : super(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F2937),
      );
}

// Bold text in the provided color (e.g. links in the main app color)
class BoldTextStyle extends TextStyle {
  const BoldTextStyle({required super.color})
    : super(fontSize: 13, fontWeight: FontWeight.bold);
}

// Secondary grey text
class FadeTextStyle extends TextStyle {
  const FadeTextStyle() : super(fontSize: 13, color: const Color(0xFF6B7280));
}

// Small secondary grey text (e.g. hints under inputs)
class SmallFadeTextStyle extends TextStyle {
  const SmallFadeTextStyle()
    : super(fontSize: 12, color: const Color(0xFF6B7280));
}

// Large secondary grey text (e.g. subtitles)
class LargeFadeTextStyle extends TextStyle {
  const LargeFadeTextStyle()
    : super(fontSize: 15, color: const Color(0xFF6B7280));
}

// Bold secondary grey text (e.g. section headers)
class BoldFadeTextStyle extends TextStyle {
  const BoldFadeTextStyle()
    : super(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF6B7280),
      );
}
