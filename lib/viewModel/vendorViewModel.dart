import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:flutter/material.dart';

class VendorViewModel with ChangeNotifier {
  List<VendorDatum> vendorModel = [];
  List<CategoryList> data = [];
  bool isLoading = false;
  bool isFollowing = false;
  bool get loading => isLoading;
  final _myRepo = VendorRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getVendorListItem(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.vendorListRequest(AppUrl.vendorList, token).then((value) {
      vendorModel = value.data;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
    });
  }

  Future<void> getVendorCategoriesItem(BuildContext context, String id) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo
        .vendorCategoriesRequest(AppUrl.vendorCategories + id, token)
        .then((value) {
      data = value.data!;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
    });
  }

  Future<bool> followVendor(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    _myRepo.followvendor(AppUrl.followVendor, token, data).then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);
      isFollowing = !isFollowing;
      getVendorListItem(context);
      print(value.message);

      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });

    return false;
  }
}
