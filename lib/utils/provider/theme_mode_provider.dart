import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  late SharedPreferences preferences;

  void init(SharedPreferences preferences) {
    this.preferences = preferences;

    if (preferences.containsKey("isDarkMode")) {
      _isDarkMode = preferences.getBool("isDarkMode");
    }
  }

  bool? _isDarkMode;

  bool? get isDarkMode => _isDarkMode;

  set isDarkMode(bool? value) {
    if (value == _isDarkMode) return;
    _isDarkMode = value;
    if (value == null) {
      preferences.remove("isDarkMode");
    } else {
      preferences.setBool("isDarkMode", value);
    }

    notifyListeners();
  }

  void toggleDarkMode() {
    if(isDarkMode == null) {
      isDarkMode = true;
    } else {
      isDarkMode = !isDarkMode!;
    }
  }
}
