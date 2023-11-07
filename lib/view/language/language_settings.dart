import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constant.dart';
import '../../utils/string.dart';
import 'demo_localisation.dart';

String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)!.translate(key) ?? key;
}

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? defaultLanguage;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case 'en':
      return const Locale('en', 'US');
    case 'zh':
      return const Locale('zh', 'CN');
    case 'fr':
      return const Locale('fr', 'FR');
    case 'hi':
      return const Locale('hi', 'IN');
    case 'ar':
      return const Locale('ar', 'DZ');
    case 'ru':
      return const Locale('ru', 'RU');
    case 'ja':
      return const Locale('ja', 'JP');
    case 'de':
      return const Locale('de', 'DE');
    case 'es':
      return const Locale('es', 'ES');
    default:
      return const Locale('en', 'US');
  }
}
