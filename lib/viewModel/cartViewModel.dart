import 'dart:math';

import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
import 'package:alpha_ecommerce_18oct/view/cart/model/savedItemsModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  List<CartProduct> cartModel = [];
  List<WishlistItem> savedModel = [];
  bool isLoading = false;
  late CartModel model;
  bool get loading => isLoading;
  TextEditingController couponController = TextEditingController();
  final _myRepo = CartRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getCartListItem(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.cartListRequest(AppUrl.cartList, token).then((value) {
      cartModel = value.data.products;
      model = value;
      print(cartModel.length.toString() + "Cart LIst");

      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
    });
  }

  Future<void> getSavedListItem(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.savedListRequest(AppUrl.savedList, token).then((value) {
      savedModel = value.data;

      print(cartModel.length.toString() + "Cart LIst");

      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
    });
  }

  Future<bool> addToCart(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.addToCart(AppUrl.addToCart, token, data).then((value) {
      setLoading(false);

      if (value.message == "Successfully added!") {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }

      getCartListItem(context);
      getSavedListItem(context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> removeFromSaveLater(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo
        .removeFromSaveLater(AppUrl.removeFromSaveLater, token, data)
        .then((value) {
      setLoading(false);

      if (value.message == "Successfully removed!") {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }

      getCartListItem(context);
      getSavedListItem(context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> removeFromCart(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.removeFromCart(AppUrl.removeFromCart, token, data).then((value) {
      setLoading(false);
      Utils.showFlushBarWithMessage("Alert", value.message, context);

      getCartListItem(context);

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

  Future<bool> updateCart(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.updateCart(AppUrl.updateCart, token, data).then((value) {
      setLoading(false);
      Utils.showFlushBarWithMessage("Alert", value.message, context);

      getCartListItem(context);

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

  Future<bool> addToSaveLater(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.addToSaveLater(AppUrl.addToSaveLater, token, data).then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      getCartListItem(context);
      getSavedListItem(context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> applyCoupon(String data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.applyCoupon(AppUrl.applyCoupon + data, token, data).then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      getCartListItem(context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", "Invaid Coupon", context);

      // Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> placeOrder(String data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(AppUrl.placeOrder + data);
    _myRepo
        .placeOrder(
      AppUrl.placeOrder + data,
      token,
    )
        .then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      getCartListItem(context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", "Invaid Coupon", context);

      // Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  String generateRandomTransactionID() {
    var number = "";
    var randomnumber = Random();
    //chnage i < 15 on your digits need
    for (var i = 0; i < 11; i++) {
      number = number + randomnumber.nextInt(9).toString();
    }
    print("ECOM" + number);
    number = "ECOM$number";
    return number;
  }
}
