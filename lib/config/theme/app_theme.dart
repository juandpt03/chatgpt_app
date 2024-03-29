import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final Color colorSchemeSeed;
  final bool isDark;

  AppTheme({
    this.colorSchemeSeed = const Color(0XFF5F6FED),
    this.isDark = false,
  });

  ThemeData getAppTheme() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorSchemeSeed: colorSchemeSeed,
        brightness: isDark ? Brightness.dark : Brightness.light,
        textTheme: isDark
            ? GoogleFonts.robotoSlabTextTheme(
                ThemeData.dark().textTheme,
              )
            : GoogleFonts.robotoSlabTextTheme(
                ThemeData.light().textTheme,
              ),
      );

  AppTheme copyWith({
    Color? colorSchemeSeed,
    bool? isDark,
  }) =>
      AppTheme(
        colorSchemeSeed: colorSchemeSeed ?? this.colorSchemeSeed,
        isDark: isDark ?? this.isDark,
      );
}
