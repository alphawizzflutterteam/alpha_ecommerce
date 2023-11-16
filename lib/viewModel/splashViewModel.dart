import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  changeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (SharedPref.shared.pref!.getString(PrefKeys.isLoggedIn) == "1") {
        Routes.navigateToDashboardScreen(context);
      } else {
        Routes.navigateToIntroScreen(context);
      }
    });
  }
}