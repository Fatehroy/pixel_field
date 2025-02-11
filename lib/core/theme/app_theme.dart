import 'package:flutter/material.dart';

class GlobalThemData {
  static const String fontFamily = "Manrope";

  //
  static ThemeData darkThemeData = themeData(darkColorScheme);

  //
  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      textTheme: appTextTheme,

      //
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        backgroundColor: colorScheme.surface,
        centerTitle: false,
      ),

      //
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.primary,
          iconColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: appTextTheme.bodyLarge!
              .copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),

      //
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.primary,
          iconColor: colorScheme.onPrimary,
          elevation: 0,
          side: BorderSide(color: colorScheme.primary),
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: appTextTheme.bodyLarge!
              .copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),

      //
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          iconColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: appTextTheme.bodyLarge!
              .copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFD49A00),
    onPrimary: Color(0xFF0B1519),
    secondary: Color(0xFF122329),
    onSecondary: Color(0xFFE7E9EA),
    surface: Color(0xFF0E1C21),
    onSurface: Color(0xFF122329),
    error: Colors.redAccent,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  static const TextTheme appTextTheme = TextTheme(
    /// Font size: 57 (Large headline, typically for hero text or titles. Ideal for large screens.)
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 57,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.5,
    ),

    /// Font size: 45 (Slightly smaller headline. Used for prominent but secondary headings.)
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 45,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),

    /// Font size: 36 (Medium headline. For use in smaller headings that still need emphasis.)
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),

    /// Font size: 32 (Large section heading. Ideal for major sections or prominent titles.)
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),

    /// Font size: 28 (Medium section heading. For smaller subsections within content.)
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),

    /// Font size: 24 (Minor section heading. For labels or headings in less prominent sections.)
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),

    /// Font size: 22 (Primary title text. For key titles, such as article titles or main headings.)
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),

    /// Font size: 16 (Subtitle or medium label. For secondary titles or smaller section headers.)
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    /// Font size: 14 (Small title or label. Used for less important text like captions or small headers.)
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),

    /// Font size: 16 (Regular body text. Ideal for paragraphs and general content.)
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),

    /// Font size: 14 (Secondary body text. For captions, small descriptions, or secondary content.)
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),

    /// Font size: 12 (Smallest body text. For footnotes or fine print.)
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),

    /// Font size: 14 (Label text for buttons or tags. For primary labels or actionable elements.)
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),

    /// Font size: 10 (Smallest label. For tags, chips, or micro-interaction labels.)
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),

    /// Font size: 12 (Medium label. For secondary labels or small actionable text.)
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  );
}
