import 'package:flutter/material.dart';

class PortfolioColors {
  static const Color primary = Color(0xFF6F58E0);
}

class PortfolioThemes {
  static ThemeData _themeData([Brightness brightness = Brightness.light]) =>
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: PortfolioColors.primary, brightness: brightness),
        brightness: brightness,
        useMaterial3: true,
        fontFamily: "Poppins",
      );

  static ThemeData themeData({Brightness brightness = Brightness.light}) =>
      _themeData(brightness).copyWith(
        textTheme: _themeData(brightness).textTheme.copyWith(
              titleLarge: _themeData(brightness).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              titleMedium:
                  _themeData(brightness).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
              titleSmall: _themeData(brightness).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              headlineLarge:
                  _themeData(brightness).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
            ),
      );
}
