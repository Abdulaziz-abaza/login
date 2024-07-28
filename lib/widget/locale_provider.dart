import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }

  static Future<Map<String, String>> loadTranslations(Locale locale) async {
    final String jsonString = await rootBundle
        .loadString('assets/translations/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
  ];
}
