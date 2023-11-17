import 'package:alpha_ecommerce_18oct/repository/currencyRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/view/currency_selection/currencyModel.dart';
import 'package:flutter/material.dart';

class CurrencyViewModel extends ChangeNotifier {
  final _myRepo = CurrencyRepository();

  String _currency = "";

  get currency => _currency;

  setCurrency(String currency) {
    _currency = currency;
    notifyListeners();
  }

  bool isLoading = true;

  bool get loading => isLoading;

  late CurrencyModel currencyModel;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getCurrencies(BuildContext context) async {
    setLoading(true);

    await _myRepo.currencyListRequest(AppUrl.currencies).then((value) {
      currencyModel = value;

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}
