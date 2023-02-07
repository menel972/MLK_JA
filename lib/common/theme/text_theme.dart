import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Specific [TextStyle]
///
/// Common style values for text in the app.
class Font extends TextStyle {
  final bool bold;

  @override
  TextDecoration? get decoration => TextDecoration.none;

  @override
  FontWeight? get fontWeight => bold ? FontWeight.w700 : FontWeight.w400;

  /// ### HeadLine 1
  /// ```
  /// color = primary,
  /// fontFamily = Oswald
  /// ```
  Font.l({
    required super.color,
    this.bold = false,
    super.fontSize = 22,
    super.letterSpacing = 1,
    super.backgroundColor,
  }) : super(
          fontFamily: GoogleFonts.oswald().fontFamily,
        );

  /// ### HeadLine 2
  /// ```
  /// color = primary,
  /// fontFamily = Oswald
  /// ```
  Font.m({
    required super.color,
    this.bold = false,
    super.fontSize = 18,
    super.letterSpacing = 0.8,
    super.backgroundColor,
  }) : super(
          fontFamily: GoogleFonts.oswald().fontFamily,
        );

  /// ### Paragraph
  /// ```
  /// fontFamily = OpenSans
  /// ```
  Font.s({
    required super.color,
    this.bold = false,
    super.fontSize = 14,
    super.letterSpacing = 0.6,
    super.backgroundColor,
  }) : super(
          fontFamily: GoogleFonts.openSans().fontFamily,
        );

  /// ### Small Text
  /// ```
  /// color = primary,
  /// fontFamily = OpenSans
  /// ```
  Font.xs({
    required super.color,
    this.bold = false,
    super.fontSize = 12,
    super.letterSpacing = 0.5,
    super.backgroundColor,
  }) : super(
          fontFamily: GoogleFonts.openSans().fontFamily,
        );
}
