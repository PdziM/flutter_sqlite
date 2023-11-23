import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapping_colors.dart';

const IconThemeData _iconThemeDataLight =
    IconThemeData(color: Colors.black54, size: 26);

const IconThemeData _iconThemeDataDark =
    IconThemeData(color: Colors.white, size: 26);

TextTheme _lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
  displayLarge: GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: -0.25,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0,
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0,
  ),
  headlineLarge: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0,
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0,
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0,
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 0,
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.1,
  ),
  labelLarge: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.1,
  ),
  labelMedium: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5,
  ),
  labelSmall: GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    letterSpacing: 0.25,
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.black54,
    letterSpacing: 0.4,
  ),
);

TextTheme _darkTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
  displayLarge: GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: -0.25,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0,
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0,
  ),
  headlineLarge: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0,
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0,
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0,
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0,
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.1,
  ),
  labelLarge: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.1,
  ),
  labelMedium: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  ),
  labelSmall: GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white54,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white54,
    letterSpacing: 0.25,
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.white54,
    letterSpacing: 0.4,
  ),
);

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: ColorsConstants.primary100,
  scaffoldBackgroundColor: ColorsConstants.bg100,
  useMaterial3: true,
  iconTheme: _iconThemeDataLight,
  textTheme: _lightTextTheme,
);

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: ColorsConstants.primary100,
  useMaterial3: true,
  iconTheme: _iconThemeDataDark,
  textTheme: _darkTextTheme,
);

const LinearGradient appGradient = LinearGradient(colors: [
  ColorsConstants.accent100,
  ColorsConstants.primary100,
], begin: Alignment.topLeft, end: Alignment.bottomRight);

const LinearGradient headerGradient = LinearGradient(colors: [
  ColorsConstants.accent100,
  ColorsConstants.primary100,
], begin: Alignment.topCenter, end: Alignment.bottomCenter);

List<Effect> inputAnimation({Duration? duration}) {
  return <Effect>[
    FadeEffect(delay: duration ?? 200.ms, curve: Curves.easeOut),
    SlideEffect(delay: 100.ms),
  ];
}
