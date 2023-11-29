import 'dart:convert';
import 'dart:math';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
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

  Future<void> loginFn(GlobalKey<FormState> formKey, BuildContext context,
      String phone, dynamic data) async {
    setLoading(true);

    if (formKey.currentState!.validate()) {
      if (isLoggingViaPhone) {
        _myRepo.loginApiReqzuest(AppUrl.sendLoginOtp, data).then((value) {
          setLoading(false);

          if (value.message == "OTP sent success") {
            Utils.showFlushBarWithMessage(
                "Alert", "OTP sent successfully.", context);
            SharedPref.shared.pref?.setString(PrefKeys.mobile, phone);
            SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

            Utils.showFlushBarWithMessage(
                "Alert", "OTP sent successfully.", context);
            SharedPref.shared.pref?.setString(PrefKeys.otp, value.data[0].otp);

            Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
            Routes.navigateToOTPVerificationScreen(context, true, false);
          } else {
            Utils.showFlushBarWithMessage("Alert", value.message, context);
          }
        }).onError((error, stackTrace) {
          setLoading(false);
        });
      } else {
        _myRepo
            .loginApiReqzuest(AppUrl.loginWithEmailPassword, data)
            .then((value) {
          setLoading(false);

          if (value.message == "User logged in success") {
            Utils.showFlushBarWithMessage(
                "Alert", "Logged in successfully", context);

            SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);
            SharedPref.shared.pref?.setString(PrefKeys.mobile, phone);
            SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");
            Routes.navigateToDashboardScreen(context);
          } else {
            Utils.showFlushBarWithMessage("Alert", value.message, context);
          }
        }).onError((error, stackTrace) {
          setLoading(false);
        });
      }
    } else {
      setLoading(false);
    }
  }

  Future<void> resendOTP(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApiReqzuest(AppUrl.sendLoginOtp, data).then((value) {
      setLoading(false);

      if (value.message == "OTP sent success") {
        Utils.showFlushBarWithMessage(
            "Alert", "OTP sent successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

        Utils.showFlushBarWithMessage(
            "Alert", "OTP sent successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.otp, value.data[0].otp);

        Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> sendOtpforForgotScreen(
      dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApiReqzuest(AppUrl.sendLoginOtp, data).then((value) {
      setLoading(false);

      if (value.message == "OTP sent success") {
        Utils.showFlushBarWithMessage(
            "Alert", "OTP sent successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

        Utils.showFlushBarWithMessage(
            "Alert", "OTP sent successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.otp, value.data[0].otp);

        Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
        Routes.navigateToOTPVerificationScreen(context, true, true);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  String retrieveStringFromControllers(
      List<TextEditingController> otpControllers) {
    List<String> otpValues = [];
    for (TextEditingController controller in otpControllers) {
      otpValues.add(controller.text);
    }

    // Use the otpValues list as needed
    print("OTP String: ${otpValues.join()}");

    return otpValues.join();
  }

  Future<void> verifyOTP(bool isComingForLogin, BuildContext context,
      String enteredOTP, bool iscomingForChangePassword) async {
    var otp = SharedPref.shared.pref!.getString(PrefKeys.otp);
    var phone = SharedPref.shared.pref!.getString(PrefKeys.mobile);

    if (enteredOTP == otp) {
      if (isComingForLogin) {
        SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");

        Map data = {'phone': phone};
        await getProfileAPI(data, context);
      }
      iscomingForChangePassword
          ? Routes.navigateToResetPasswordScreen(context)
          : !isComingForLogin
              ? Routes.navigateToSignUpScreen(context)
              : Routes.navigateToDashboardScreen(context);
    } else {
      Utils.showFlushBarWithMessage("Alert", "OTP not matched", context);
    }
  }

  Future<void> sendRegisterOtp(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApiReqzuest(AppUrl.sendRegisterOtp, data).then((value) {
      setLoading(false);

      if (value.message == "OTP sent success") {
        Utils.showFlushBarWithMessage(
            "Alert", "OTP sent successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

        Utils.showFlushBarWithMessage(
            "Alert", "OTP sent successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.otp, value.data[0].otp);
        SharedPref.shared.pref
            ?.setString(PrefKeys.mobile, value.data[0].mobile);

        Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
        Routes.navigateToOTPVerificationScreen(context, false, false);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> createAccountApi(dynamic data, BuildContext context) async {
    setLoading(true);

    print(data);
    _myRepo.loginApiReqzuest(AppUrl.register, data).then((value) {
      setLoading(false);

      if (value.message == "User registered success") {
        Utils.showFlushBarWithMessage(
            "Alert", "User registered successfully.", context);
        SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

        Routes.navigateToWelcomeScreen(context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }

  Future<void> resetPasswordApi(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.restPasswordAPI(AppUrl.resetPassword, token, data).then((value) {
      setLoading(false);

      if (value.message != "Password and confirm password not matched!") {
        Utils.showFlushBarWithMessage(
            "Alert", "Password changed successfully.", context);

        Routes.navigateToSignInScreen(context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());

      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }

  Future<void> getProfileAPI(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.getProfileAPI(AppUrl.getProfile, token, data).then((value) {
      setLoading(false);

      SharedPref.shared.pref
          ?.setString(PrefKeys.userId, value.data[0].id.toString());
      SharedPref.shared.pref
          ?.setString(PrefKeys.name, value.data[0].name.toString());
      SharedPref.shared.pref
          ?.setString(PrefKeys.email, value.data[0].email.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());

      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }

  bool matchPassword(String firstPassword, String secondPassword) {
    if (firstPassword == secondPassword) {
      return true;
    }
    return false;
  }
}
