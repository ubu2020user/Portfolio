import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  late SharedPreferences preferences;
  void init(SharedPreferences preferences) {
    this.preferences = preferences;

    if (preferences.containsKey("isEducation")) {
      _qualificationPreferences = (
        preferences.getBool("isEducation") ?? true,
        preferences.getBool("isWork") ?? false
      );
    }
  }

  (bool, bool) _qualificationPreferences = (true, false);

  (bool, bool) get qualificationPreferences => _qualificationPreferences;

  set qualificationPreferences((bool, bool) value) {
    if (value == _qualificationPreferences) return;

    _qualificationPreferences = value;

    preferences.setBool("isEducation", value.$1);
    preferences.setBool("isWork", value.$2);

    debugPrint(value.toString());

    notifyListeners();
  }
}
