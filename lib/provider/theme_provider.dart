import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
   ThemeMode currentTheme = ThemeMode.light;
  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
}
