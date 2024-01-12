import 'package:flutter/material.dart';
import 'package:glucare/presentation/core/ui_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'color_values.dart';

class AppThemeData {
  static ThemeData getTheme(BuildContext context) {
    const Color primaryColor = ColorValues.primary50;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor =
    MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
        primaryColor: primaryColor,
        primarySwatch: primaryMaterialColor,
        scaffoldBackgroundColor: ColorValues.background,
        canvasColor: ColorValues.background,
        brightness: Brightness.light,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorValues.primary50,
          unselectedItemColor: ColorValues.grey20,
          selectedLabelStyle: GoogleFonts.sora(
              color: ColorValues.primary50, fontSize: 13, fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.sora(
              color: ColorValues.grey20, fontSize: 13, fontWeight: FontWeight.normal),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: ColorValues.white,
            elevation: 0,
            textStyle: GoogleFonts.poppins(
              color: ColorValues.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiConstants.lgRadius),
            ),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: ColorValues.text50,
            elevation: 0,
            textStyle: GoogleFonts.poppins(
              color: ColorValues.text50,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            side: const BorderSide(color: ColorValues.grey10, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiConstants.lgRadius),
            ),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        iconTheme: IconThemeData(size: 6.w, color: ColorValues.grey50),
        textTheme: TextTheme(
          // titleLarge: Title 1
          // titleMedium: Title 2
          // bodyLarge: Body 1
          // bodyMedium: Body 2
          // bodySmall: Body 3
          // labelLarge: Button 1
          // displaySmall: Button 2
          displayLarge: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 28, fontWeight: FontWeight.w700),
          displayMedium: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 22, fontWeight: FontWeight.w700),
          displaySmall: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 18, fontWeight: FontWeight.w700),
          headlineMedium: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 34, fontWeight: FontWeight.w500),
          headlineSmall: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 24, fontWeight: FontWeight.w600),
          titleLarge: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 22, fontWeight: FontWeight.bold),
          titleMedium: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 14, fontWeight: FontWeight.w600),
          titleSmall: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 12, fontWeight: FontWeight.w700),
          bodyLarge: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 20, fontWeight: FontWeight.w700),
          bodyMedium: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 14, fontWeight: FontWeight.w400),
          bodySmall: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 12, fontWeight: FontWeight.w400),
          labelLarge: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 12, fontWeight: FontWeight.w600),
          labelSmall: GoogleFonts.sora(
              color: ColorValues.text50, fontSize: 10, fontWeight: FontWeight.w400),
        ));
  }
}
