import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Primary app colors used throughout the UI.
const Color kPrimaryGreen = Color(0xFF0EA47A);
const Color kPrimaryGreenDark = Color(0xFF0A7E5C);
const Color kSurfaceWhite = Color(0xFFFFFFFF);
const Color kSoftMint = Color(0xFFE9F7F2);
const Color kOutline = Color(0xFFB8D8CD);

/// Builds the global theme for the application.
ThemeData buildAppTheme() {
  final base = ThemeData(useMaterial3: true);
  final colorScheme = ColorScheme.fromSeed(
    seedColor: kPrimaryGreen,
    brightness: Brightness.light,
    primary: kPrimaryGreen,
    secondary: const Color(0xFF2FC79F),
    surface: kSurfaceWhite,
    background: kSoftMint,
  );
  final textTheme = GoogleFonts.interTextTheme(base.textTheme).copyWith(
    headlineLarge: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
    ),
    titleLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.inter(fontSize: 16, height: 1.4),
    bodyMedium: GoogleFonts.inter(fontSize: 14, height: 1.4),
  );
  return base.copyWith(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: kOutline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: kOutline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: kPrimaryGreen, width: 1.6),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: kSoftMint,
      selectedColor: kPrimaryGreen.withOpacity(0.15),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      shape: const StadiumBorder(side: BorderSide(color: kOutline)),
    ),
    dividerTheme: DividerThemeData(
      color: kOutline.withOpacity(0.6),
      thickness: 1,
    ),
  );
}
