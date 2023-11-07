import 'dart:convert';
import 'dart:math';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class AuthenticationProvider extends ChangeNotifier {
  String? mobileNumber, password;
  String? name, countryCode, signUpPassword, signUpEmail;
  String? newPassword;

  bool? error;
  String errorMessage = '';

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  final Random _rnd = Random();
  int count = 1;
  get mobileNumberValue => mobileNumber;

  setMobileNumber(String? value) {
    mobileNumber = value;
    notifyListeners();
  }

  setNewPassword(String? value) {
    newPassword = value;
    notifyListeners();
  }

  setSignUp(String? value) {
    signUpEmail = value;
    notifyListeners();
  }

  setSignUpPassword(String? value) {
    signUpPassword = value;
    notifyListeners();
  }

  setCountryCode(String? value) {
    countryCode = value;
    notifyListeners();
  }

  setUserName(String? value) {
    name = value;
    notifyListeners();
  }

  setPassword(String? value) {
    password = value;
    notifyListeners();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(
              _chars.length,
            ),
          ),
        ),
      );

  Future<void> loginFn(
      GlobalKey<FormState> _formKey, BuildContext context, String phone) async {
    SharedPref.shared.pref?.setString(PrefKeys.mobile, phone);
    SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");

    if (_formKey.currentState!.validate()) {
      Routes.navigateToDashboardScreen(context);
    }
  }
}
