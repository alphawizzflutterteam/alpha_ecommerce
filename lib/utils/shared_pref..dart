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
}

class PrefKeys {
  static const mobile = "mobile";
  static const name = "name";
  static const isLoggedIn = "isLoggedIn";
  static const appTheme = 'appTheme';
}
