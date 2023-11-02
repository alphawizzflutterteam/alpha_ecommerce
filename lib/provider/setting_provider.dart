import 'package:shared_preferences/shared_preferences.dart';

import '../helper/string.dart';

class SettingProvider {
  late SharedPreferences _sharedPreferences;

  SettingProvider(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  String get email => _sharedPreferences.getString(EMAIL) ?? '';

  String? get userId => _sharedPreferences.getString(ID);

  String get userName => _sharedPreferences.getString(USERNAME) ?? '';

  String get mobile => _sharedPreferences.getString(MOBILE) ?? '';

  String get profileUrl => _sharedPreferences.getString(IMAGE) ?? '';

  String get loginType => _sharedPreferences.getString(TYPE) ?? '';

  setPreference(String key, String value) {
    _sharedPreferences.setString(key, value);
  }

  getSessionValue(String key) async {
    return _sharedPreferences.getString(key);
  }

  Future<String?> getPreference(String key) async {
    return _sharedPreferences.getString(key);
  }

  void setPreferenceBool(String key, bool value) async {
    _sharedPreferences.setBool(key, value);
  }

  Future<List<String>> getPreferenceList(String key) async {
    return _sharedPreferences.getStringList(key) ?? [];
  }

  Future<bool> getPreferenceBool(String key) async {
    return _sharedPreferences.getBool(key) ?? false;
  }

  Future<void> setCurrentSellerID(String value) async {
    setPreference('CurrentSellerID', value);
  }

  Future<String?> getCurrentSellerID(String value) async {
    return _sharedPreferences.getString('CurrentSellerID');
  }
}

setPreferenceBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}
