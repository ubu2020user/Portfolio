import 'package:flutter/material.dart';
import 'package:portfolio/utils/provider/preferences_provider.dart';
import 'package:portfolio/utils/provider/theme_mode_provider.dart';
import 'package:provider/provider.dart';

extension BuildExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  ColorScheme get colorScheme => themeData.colorScheme;
  TextTheme get textTheme => themeData.textTheme;

  PreferencesProvider get providerPreferences =>
      Provider.of(this, listen: false);

  ThemeModeProvider get providerThemeMode =>
      Provider.of(this, listen: false);
}
