import 'package:alpha_ecommerce_18oct/repository/profileRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileViewModel with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = ProfileRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> updateProfile(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo
        .updateProfileRequest(AppUrl.updateProfile, token, data)
        .then((value) {
      setLoading(false);
      Utils.showFlushBarWithMessage("Alert", value.message, context);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
    });
  }
}
