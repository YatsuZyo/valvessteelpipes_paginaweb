import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de colores principal - Actualizada (2025)
  // Azul oscuro (casi negro)
  static const Color primaryBlue = Color(0xFF282B3D);
  // Azul intermedio
  static const Color secondaryBlue = Color(0xFF364E6F);
  // Azul eléctrico (ideal para acentos y botones)
  static const Color accentBlue = Color(0xFF0088FF);
  static const Color metallicGray = Color(0xFF6C757D); // Gris metálico
  static const Color pureWhite = Color(0xFFFFFFFF); // Blanco puro

  // Colores adicionales para gradientes y estados
  // Azul claro
  static const Color lightBlue = Color(0xFF00AAFF);
  static const Color darkGray = Color(0xFF495057); // Gris oscuro para textos
  static const Color lightGray = Color(
    0xFFADB5BD,
  ); // Gris claro para fondos sutiles

  // Gradientes profesionales - MÁS SUAVES Y LUMINOSOS
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryBlue, secondaryBlue],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentBlue, lightBlue],
  );

  static const LinearGradient subtleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [pureWhite, Color(0xFFF8F9FA)],
  );

  // Tipografías
  static TextStyle get heading1 => GoogleFonts.oswald(
    fontSize: 54,
    fontWeight: FontWeight.bold,
    color: primaryBlue,
    letterSpacing: -0.5,
  );

  static TextStyle get heading2 => GoogleFonts.oswald(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: primaryBlue,
    letterSpacing: -0.3,
  );

  static TextStyle get heading3 => GoogleFonts.oswald(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: secondaryBlue,
    letterSpacing: -0.2,
  );

  static TextStyle get subtitle1 => GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: secondaryBlue,
    letterSpacing: 0.1,
  );

  static TextStyle get subtitle2 => GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: accentBlue,
    letterSpacing: 0.1,
  );

  static TextStyle get bodyText1 => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: darkGray,
    height: 1.6,
  );

  static TextStyle get bodyText2 => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: metallicGray,
    height: 1.5,
  );

  static TextStyle get buttonText => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle get caption => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: metallicGray,
  );

  // Tema principal de la aplicación
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: accentBlue,
        surface: pureWhite,
        background: pureWhite,
        onPrimary: pureWhite,
        onSecondary: pureWhite,
        onSurface: darkGray,
        onBackground: darkGray,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: pureWhite,
        foregroundColor: primaryBlue,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.oswald(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryBlue,
        ),
        surfaceTintColor: Colors.transparent,
      ),

      // Botones
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentBlue,
          foregroundColor: pureWhite,
          textStyle: buttonText,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
      ),

      // Textos
      textTheme: TextTheme(
        displayLarge: heading1,
        displayMedium: heading2,
        displaySmall: heading3,
        headlineMedium: subtitle1,
        headlineSmall: subtitle2,
        bodyLarge: bodyText1,
        bodyMedium: bodyText2,
        labelLarge: buttonText,
        bodySmall: caption,
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: lightGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: lightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: accentBlue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: bodyText2.copyWith(color: metallicGray),
      ),

      // Cards
      cardTheme: CardTheme(
        elevation: 4,
        shadowColor: primaryBlue.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: pureWhite,
      ),
    );
  }
}
