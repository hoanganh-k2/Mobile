import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  Locale _locale = Locale('en', '');

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (_locale == newLocale) return; // Không cần cập nhật nếu giống nhau
    _locale = newLocale;
    notifyListeners(); // Cập nhật UI
  }
}
