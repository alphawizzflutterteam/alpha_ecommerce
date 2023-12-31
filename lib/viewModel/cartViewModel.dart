import 'dart:math';

import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  List<CartProduct> cartModel = [];
  List<WishlistItem> savedModel = [];
  String selectedOption = 'Normal Delivery';

  bool isLoading = false;
  CartModel model = CartModel(
      status: true,
      message: "",
      data: Data(
          deliveryType: "0",
          discountText: "",
          totalItems: "",
          subtotal: "",
          discount: "",
          mrp: "",
          deliveryCharge: "",
          tax: "",
          total: "",
          products: []));
  bool get loading => isLoading;
  TextEditingController couponController = TextEditingController();
  final _myRepo = CartRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setDeliveryType(String value) {
    selectedOption = value;
    notifyListeners();
  }

  Future<void> getCartListItem(BuildContext context, String coupon,
      String dType, String isCoinsUsed, String coins) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

//?coupan=FIRST99&delivery_type=0&is_coin_used&coins
    if (dType == 0) {
      selectedOption = "Normal Delivery";
      notifyListeners();
    }
    await _myRepo
        .cartListRequest(
            "${AppUrl.cartList}$coupon&delivery_type=$dType&is_coin_used=$isCoinsUsed&coins=",
            token)
        .then((value) {
      model = value;

      cartModel = value.data.products;
      getSavedListItem(context);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
    });
  }

  Future<void> getSavedListItem(BuildContext context) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.savedListRequest(AppUrl.savedList, token).then((value) {
      savedModel = value.data;

      //   print(cartModel.length.toString() + "Cart LIst");

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
    });
  }

  Future<bool> checkDeliveryStatus(
      BuildContext context, String billingId) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    bool res = false;

    await _myRepo
        .checkDeliveryStatus(AppUrl.checkAvailabbilitty + billingId, token)
        .then((value) {
      res = value.status;
      setLoading(false);
      return res;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());

      return false;
    });
    return res;
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

      if (selectedOption == "Alpha Delivery") {
        print(value);
        getCartListItem(context, couponController.text, "1", "0", "");
      } else {
        getCartListItem(context, couponController.text, "0", "0", "");
      }
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

      if (selectedOption == "Alpha Delivery") {
        print(value);
        getCartListItem(context, couponController.text, "1", "0", "");
      } else {
        getCartListItem(context, couponController.text, "0", "0", "");
      }
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

      if (selectedOption == "Alpha Delivery") {
        print(value);
        getCartListItem(context, couponController.text, "1", "0", "");
      } else {
        getCartListItem(context, couponController.text, "0", "0", "");
      }

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

      if (value.message == "Invalid coupon") {
      } else {
        if (selectedOption == "Alpha Delivery") {
          print(value);
          getCartListItem(context, couponController.text, "1", "0", "");
        } else {
          getCartListItem(context, couponController.text, "0", "0", "");
        }
      }

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
      if (value.status) {
        if (selectedOption == "Alpha Delivery") {
          print(value);
          getCartListItem(context, couponController.text, "1", "0", "");
        } else {
          getCartListItem(context, couponController.text, "0", "0", "");
        }
        if (selectedOption == "Alpha Delivery") {
          print(value);
          getCartListItem(context, couponController.text, "1", "0", "");
        } else {
          getCartListItem(context, couponController.text, "0", "0", "");
        }
        getSavedListItem(context);
      }

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

      // Utils.showFlushBarWithMessage("Alert", value.message, context);

      if (value.status) {
        getCartListItem(context, "", "0", "", "");
      }
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", "Invaid Coupon", context);

      return false;
    });
    return false;
  }

  Future<bool> placeOrder(String data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo
        .placeOrder(
      AppUrl.placeOrder + data,
      token,
    )
        .then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      if (value.status) {
        Routes.navigateToPaySuccessScreen(context);
        // if (selectedOption == "Alpha Delivery") {
        //   print(value);
        //   getCartListItem(context, couponController.text, "1", "0", "");
        // } else {
        //   getCartListItem(context, couponController.text, "0", "0", "");
        // }
      }
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
