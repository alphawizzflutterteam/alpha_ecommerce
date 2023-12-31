import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/profile/coupon/model/couponListModel.dart';
import 'package:flutter/material.dart';

class CouponViewModel with ChangeNotifier {
  List<CouponList> couponModel = [];
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = CouponRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getCouponListItem(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.couponListRequest(AppUrl.couponList, token).then((value) {
      couponModel = value.data;
      notifyListeners();

      // print(couponModel.length.toString() + "Coupon List");

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
    });
  }
}
