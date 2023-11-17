import 'package:alpha_ecommerce_18oct/main.dart';
import 'package:alpha_ecommerce_18oct/repository/languageRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/view/language/language.dart';
import 'package:flutter/material.dart';

class LanguageViewModel with ChangeNotifier {
  final _myRepo = LangugageRepository();

  String _language = "";

  get language => _language;

  setLanguage(String language, BuildContext context, Locale newLocale) {
    _language = language;

    MyApp.setLocale(context, newLocale);
    notifyListeners();
  }

  bool isLoading = false;

  bool get loading => isLoading;

  late LanguageModel model;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getLanguages(BuildContext context) async {
    setLoading(true);

    await _myRepo.languageListRequest(AppUrl.languages).then((value) {
      model = value;

      print(value.message);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}
