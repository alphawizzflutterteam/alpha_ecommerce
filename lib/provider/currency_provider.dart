import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier{

  String _currency = "";

  get currency => _currency;

  setCurrency(String currency){
    _currency = currency;
    notifyListeners();
  }

}