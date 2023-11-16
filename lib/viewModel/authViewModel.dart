import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

import 'package:alpha_ecommerce_18oct/repository/authRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  String? mobileNumber, password;
  String? name, countryCode, signUpPassword, signUpEmail;
  String? newPassword;

  bool? error;
  String errorMessage = '';

  bool isLoading = false;

  bool get loading => isLoading;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool isLoggingViaPhone = true;

  bool get loggingViaPhone => isLoggingViaPhone;

  setLoggingViaPhone(bool value) {
    isLoggingViaPhone = value;
    notifyListeners();
  }

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

  Future<void> loginFn(GlobalKey<FormState> _formKey, BuildContext context,
      String phone, dynamic data) async {
    setLoading(true);
    SharedPref.shared.pref?.setString(PrefKeys.mobile, phone);
    SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");

    if (_formKey.currentState!.validate()) {
      !loggingViaPhone
          ? Routes.navigateToDashboardScreen(context)
          : Routes.navigateToOTPVerificationScreen(context, true);
      print("VALID");

      _myRepo.loginApiRequest(data).then((value) {
        setLoading(false);

        print("Success " + value.toString());
      }).onError((error, stackTrace) {
        setLoading(false);

        print("ERROR "+error.toString());
      });
    } else {
      setLoading(false);
      print("INVALID");
    }
  }
}
