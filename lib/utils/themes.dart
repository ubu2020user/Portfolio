import 'package:flutter/material.dart';

class PortfolioColors {
  static const Color primary = Color(0xFF6E57E0);
}

class PortfolioThemes {
  static ThemeData _themeData({Brightness brightness = Brightness.light}) =>
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: PortfolioColors.primary, brightness: brightness),
        brightness: brightness,
        useMaterial3: true,
        fontFamily: "Poppins",
      );

  static ThemeData themeData({Brightness brightness = Brightness.light}) =>
      _themeData(brightness: brightness).copyWith();
}
