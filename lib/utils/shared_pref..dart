import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static final shared = SharedPref();
  SharedPreferences? pref;

  getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  removeUserPRef() {
    SharedPref.shared.pref?.setString(PrefKeys.mobile, "");
    SharedPref.shared.pref?.setString(PrefKeys.email, "");
    SharedPref.shared.pref?.setString(PrefKeys.userDetails, "");
    SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "0");
    SharedPref.shared.pref?.setString(PrefKeys.userId, "");
    SharedPref.shared.pref?.setString(PrefKeys.jwtToken, "");
    SharedPref.shared.pref?.setString(PrefKeys.otp, "");
    // SharedPref.shared.pref?.setString(PrefKeys.selectedLanguageID, "");
    // SharedPref.shared.pref?.setString(PrefKeys.currencyID, "");
    SharedPref.shared.pref?.setString(PrefKeys.billingAddressID, "");
    SharedPref.shared.pref?.setString(PrefKeys.billingAddress, "");
  }
}

class PrefKeys {
  static const mobile = "mobile";
  static const email = "email";
  static const userDetails = "userDetails";
  static const name = "name";
  static const isLoggedIn = "isLoggedIn";
  static const userId = "userId";
  static const appTheme = 'appTheme';
  static const cartCount = 'cartCount';
  static const jwtToken = 'jwtToken';
  static const otp = 'otp';
  static const selectedLanguageID = 'selectedLanguageID';
  static const currencyID = 'currencyID';
  static const groupIDForBUY = 'groupIDForBUY';
  static const billingAddressID = 'billingAddressID';
  static const billingAddress = 'billingAddress';
}
