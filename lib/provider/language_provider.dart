import 'package:alpha_ecommerce_18oct/main.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{

  String _language = "";

  get language => _language;

  setLanguage(String language,BuildContext context,Locale newLocale){
    _language = language;

    MyApp.setLocale(context, newLocale);
    notifyListeners();
  }
}