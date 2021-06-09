import 'package:flutter/material.dart';
import 'package:store_app/models/dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;

  DarkThemPreferences darkThemPreferences = DarkThemPreferences();

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemPreferences.setDarkTheme(value);
    notifyListeners();
  }
}
