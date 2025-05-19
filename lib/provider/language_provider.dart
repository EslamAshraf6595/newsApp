import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  void changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
}
