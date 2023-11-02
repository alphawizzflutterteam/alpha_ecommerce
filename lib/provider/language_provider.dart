import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{

  String _language = "";

  get language => _language;

  setLanguage(String language){
    _language = language;
    notifyListeners();
  }
}