import 'dart:convert';
import 'dart:math';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:crypto/crypto.dart';

import 'package:alpha_ecommerce_18oct/repository/authRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  String? mobileNumber, password;
  String? name, countryCode, signUpPassword, signUpEmail;
  String? newPassword;
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileOrEmailController = TextEditingController();
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

  Future<void> loginApple(BuildContext context) async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    print(credential.toString() + "APPLEIDCredential");

    print(credential.identityToken.toString());
    print(credential.givenName.toString());
    print(credential.familyName.toString());
    print(credential.email.toString());
    print(credential.authorizationCode.toString());
    print(credential.userIdentifier.toString());

    Map data = {
      'token': credential.authorizationCode.toString(),
      'unique_id': credential.userIdentifier.toString(),
      'email': credential.email.toString() ?? '',
      'medium': "apple"
    };
    loginGooglePostMethod(context, data);
  }

  void loginGoogle(BuildContext context) async {
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn(
          scopes: ['email'],
        );

        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        if (googleUser == null) {
          // The user canceled the sign-in process.
          return;
        }

        // You can access user information like this:
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String userId = googleUser.id;
        var email = googleUser.email;
        final String displayName = googleUser.displayName ?? "";
        final String photoUrl = googleUser.photoUrl ?? "";

        print(email);
        print(displayName);
        print(userId);
        print(googleUser.photoUrl);
        print(googleAuth.accessToken);

        Map data = {
          'token': googleAuth.accessToken.toString(),
          'unique_id': userId.toString(),
          'email': email.toString(),
          'medium': "google"
        };
        loginGooglePostMethod(context, data);
        //Get.snackbar("Success", "Welcome $displayName}");

        //googleAuthentication();

        // Perform actions with user data or navigate to a new page.
        // For example, you can create a UserProfilePage to display user information.
      } catch (error) {
        print('Error signing in with Google: $error');
        //  fetchChannelDetails("UCZEij3REDdWpfp3CCxy24TA");
      }
    }
  }

  Future<void> loginGooglePostMethod(BuildContext context, dynamic data) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.loginApiReqzuest(AppUrl.socialLogin, data).then((value) async {
        setLoading(false);

        if (value.message == "User login success") {
          SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

          await getProfileAPI(data, context);
          SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");

          Routes.navigateToDashboardScreen(context, 2);
        } else if (value.message == "User Registered success") {
          SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);
          await getProfileAPI(data, context);
          SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");

          Routes.navigateToDashboardScreen(context, 2);
        } else if (value.message == "User Registered success") {
          SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);
          await getProfileAPI(data, context);
          SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");

          Routes.navigateToDashboardScreen(context, 2);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
        Utils.showFlushBarWithMessage("Alert", stackTrace.toString(), context);
      });
    }
  }

  // void loginFB() async {
  //   final FacebookAuth facebookAuth = FacebookAuth.instance;

  //   LoginResult result =
  //       await facebookAuth.login(permissions: ['email', 'public_profile']);

  //   if (result.status == LoginStatus.success) {
  //     final AccessToken accessToken = result.accessToken!;

  //     print('FACEBOOK Logged in');
  //     print('FACEBOOK User ID: ${accessToken.userId}');
  //     print('FACEBOOK Access Token: ${accessToken.token}');
  //     _getUserData(accessToken, facebookAuth);
  //     var fbAccessToken = accessToken.token;
  //     var fbId = accessToken.userId;
  //   } else {
  //     print('Login failed');
  //   }
  // }

  // Future<void> _getUserData(
  //     AccessToken accessToken, FacebookAuth facebookAuth) async {
  //   final userData = await facebookAuth.getUserData();
  //   final email = userData['email'];
  //   final name = userData['name'];

  //   print('FACEBOOK email: ${email}');
  //   print('FACEBOOK name: ${name}');
  // }

  Future<void> loginFn(GlobalKey<FormState> formKey, BuildContext context,
      String phone, dynamic data) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      if (formKey.currentState!.validate()) {
        if (isLoggingViaPhone) {
          _myRepo.loginApiReqzuest(AppUrl.sendLoginOtp, data).then((value) {
            setLoading(false);
            if (mobileOrEmailController.text.length < 10 ||
                mobileOrEmailController.text.isEmpty) {
              Utils.showFlushBarWithMessage(
                  "Alert", "Invalid Mobile number", context);
              return;
            }
            if (value.message == "OTP sent success") {
              Utils.showFlushBarWithMessage(
                  "Alert", "OTP sent successfully.", context);
              SharedPref.shared.pref
                  ?.setString(PrefKeys.mobile, mobileOrEmailController.text);
              SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

              Utils.showFlushBarWithMessage(
                  "Alert", "OTP sent successfully.", context);
              SharedPref.shared.pref
                  ?.setString(PrefKeys.otp, value.data[0].otp);

              Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
              Routes.navigateToOTPVerificationScreen(context, true, false);
            } else {
              value.errors.isEmpty
                  ? Utils.showFlushBarWithMessage(
                      "Alert", value.message, context)
                  : Utils.showFlushBarWithMessage(
                      "Alert", value.errors[0].message, context);
            }
          }).onError((error, stackTrace) {
            setLoading(false);
            print(error.toString());
            print(stackTrace.toString());
            Utils.showFlushBarWithMessage(
                "Alert", stackTrace.toString(), context);
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
              Routes.navigateToDashboardScreen(context, 2);
            } else {
              value.errors.isEmpty
                  ? Utils.showFlushBarWithMessage(
                      "Alert", value.message, context)
                  : Utils.showFlushBarWithMessage(
                      "Alert", value.errors[0].message, context);
            }
          }).onError((error, stackTrace) {
            setLoading(false);
          });
        }
      } else {
        setLoading(false);
      }
    }
  }

  Future<void> resendOTP(dynamic data, BuildContext context) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
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
          value.errors.isEmpty
              ? Utils.showFlushBarWithMessage("Alert", value.message, context)
              : Utils.showFlushBarWithMessage(
                  "Alert", value.errors[0].message, context);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
      });
    }
  }

  Future<void> sendOtpforForgotScreen(
      dynamic data, BuildContext context) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.loginApiReqzuest(AppUrl.sendLoginOtp, data).then((value) {
        setLoading(false);

        if (mobileController.text.length < 10 ||
            mobileController.text.isEmpty) {
          Utils.showFlushBarWithMessage(
              "Alert", "Invalid Mobile number", context);
          return;
        }
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
          value.errors.isEmpty
              ? Utils.showFlushBarWithMessage("Alert", value.message, context)
              : Utils.showFlushBarWithMessage(
                  "Alert", value.errors[0].message, context);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
      });
    }
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
        iscomingForChangePassword
            ? Routes.navigateToResetPasswordScreen(context)
            : !isComingForLogin
                ? Routes.navigateToSignUpScreen(context)
                : Routes.navigateToDashboardScreen(context, 2);
      } else {
        SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "0");

        Routes.navigateToSignUpScreen(context);
      }
    } else {
      Utils.showFlushBarWithMessage("Alert", "OTP not matched", context);
    }
  }

  Future<void> sendRegisterOtp(dynamic data, BuildContext context) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      if (mobileController.text.length < 10 || mobileController.text.isEmpty) {
        Utils.showFlushBarWithMessage(
            "Alert", "Invalid Mobile number", context);
        return;
      }

      _myRepo.loginApiReqzuest(AppUrl.sendRegisterOtp, data).then((value) {
        setLoading(false);

        print(value.message);
        if (value.message == "OTP sent success") {
          // Utils.showFlushBarWithMessage(
          //     "Alert", "OTP sent successfully.", context);
          SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

          // Utils.showFlushBarWithMessage(
          //     "Alert", "OTP sent successfully.", context);
          SharedPref.shared.pref?.setString(PrefKeys.otp, value.data[0].otp);
          SharedPref.shared.pref
              ?.setString(PrefKeys.mobile, value.data[0].mobile);

          // Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
          Routes.navigateToOTPVerificationScreen(context, false, false);
        } else {
          value.errors.isEmpty
              ? Utils.showFlushBarWithMessage("Alert", value.message, context)
              : Utils.showFlushBarWithMessage(
                  "Alert", value.errors[0].message, context);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        print(stackTrace.toString());
        Utils.showFlushBarWithMessage("Alert", stackTrace.toString(), context);
      });
    }
  }

  Future<void> resendRegisterOtp(dynamic data, BuildContext context) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.loginApiReqzuest(AppUrl.sendRegisterOtp, data).then((value) {
        setLoading(false);

        print(value.message);
        if (value.message == "OTP sent success") {
          SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);

          Utils.showFlushBarWithMessage(
              "Alert", "OTP sent successfully.", context);
          SharedPref.shared.pref?.setString(PrefKeys.otp, value.data[0].otp);
          SharedPref.shared.pref
              ?.setString(PrefKeys.mobile, value.data[0].mobile);

          // Utils.showFlushBarWithMessage("OTP", value.data[0].otp, context);
          // Routes.navigateToOTPVerificationScreen(context, false, false);
        } else {
          value.errors.isEmpty
              ? Utils.showFlushBarWithMessage("Alert", value.message, context)
              : Utils.showFlushBarWithMessage(
                  "Alert", value.errors[0].message, context);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        print(stackTrace.toString());
        Utils.showFlushBarWithMessage("Alert", stackTrace.toString(), context);
      });
    }
  }

  Future<void> createAccountApi(dynamic data, BuildContext context) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      print(data);
      _myRepo.loginApiReqzuest(AppUrl.register, data).then((value) async {
        setLoading(false);

        if (value.message == "User registered success") {
          // Utils.showFlushBarWithMessage(
          //     "Alert", "User registered successfully.", context);
          SharedPref.shared.pref?.setString(PrefKeys.jwtToken, value.token);
          SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "1");
          var phone = SharedPref.shared.pref!.getString(PrefKeys.mobile);

          Map data = {'phone': phone};
          await getProfileAPI(data, context);
          Routes.navigateToWelcomeScreen(context);
        } else {
          value.errors.isEmpty
              ? Utils.showFlushBarWithMessage("Alert", value.message, context)
              : Utils.showFlushBarWithMessage(
                  "Alert", value.errors[0].message, context);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        print(stackTrace.toString());
        Utils.showFlushBarWithMessage(
            "Alert", "Email or phone has already been taken.", context);
        //  Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      });
    }
  }

  Future<void> resetPasswordApi(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.restPasswordAPI(AppUrl.resetPassword, token, data).then((value) {
        setLoading(false);

        if (value.message != "Password and confirm password not matched!") {
          // Utils.showFlushBarWithMessage(
          //     "Alert", "Password changed successfully.", context);

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
  }

  Future<void> uupdatePasswordApi(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data.toString());
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.restPasswordAPI(AppUrl.updatePassword, token, data).then((value) {
        setLoading(false);

        if (value.message != "Password and confirm password not matched!" &&
            value.message != "Old password not matched!") {
          SharedPref.shared.removeUserPRef();
          Routes.navigateToSignInScreen(context);
          Utils.showFlushBarWithMessage(
              "Alert", "Password changed successfully.", context);
        } else {
          Utils.showFlushBarWithMessage("Alert", value.message, context);
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());

        Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      });
    }
  }

  Future<void> getProfileAPI(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.getProfileAPI(AppUrl.getProfile, token, data).then((value) {
        setLoading(false);

        print(value.data[0].id.toString());

        SharedPref.shared.pref
            ?.setString(PrefKeys.userId, value.data[0].id.toString());
        SharedPref.shared.pref
            ?.setString(PrefKeys.name, value.data[0].name.toString());
        SharedPref.shared.pref
            ?.setString(PrefKeys.email, value.data[0].email.toString());

        SharedPref.shared.pref
            ?.setString(PrefKeys.userDetails, jsonEncode(value));
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());

        Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      });
    }
  }

  bool matchPassword(String firstPassword, String secondPassword) {
    if (firstPassword == secondPassword) {
      return true;
    }
    return false;
  }
}
