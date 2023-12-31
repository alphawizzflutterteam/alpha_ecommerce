import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/productRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = ProductRepository();
  final _myRepo2 = CartRepository();
  List<ProductListDetail> model = [];
  bool isCart = false;
  bool isFav = false;
  bool isFollowing = false;

  List<String> imageList = [];
  List<Variation> variationList = [];
  var selectedPrice = "";
  var selectedProduct = "";
  var selectedVariation = "";

  TextEditingController pinController = TextEditingController();

  List<ProductList> relatedProducts = [];
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getDetails(
      BuildContext context, dynamic data, String productName) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    var userId = SharedPref.shared.pref!.getString(PrefKeys.userId)!;
    print(token);

    await _myRepo
        .getProductDetails(
      "${AppUrl.productDetail}$productName?user_id=$userId",
      token,
    )
        .then((value) {
      model = value.products!;
      isFav = model.first.isFavorite;
      isCart = model.first.isCart;
      imageList = model.first.images;
      selectedPrice = model.first.specialPrice;
      variationList = model.first.variation;
      relatedProducts = value.relatedProducts!;
      setLoading(false);
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      notifyListeners();

      print(error.toString());
      print(stackTrace.toString() + "Product detail");
    });
  }

  Future<bool> removeFromSaveLater(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo2
        .removeFromSaveLater(AppUrl.removeFromSaveLater, token, data)
        .then((value) {
      setLoading(false);

      if (value.message == "Successfully removed!") {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
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

  Future<bool> addToSaveLater(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo2.addToSaveLater(AppUrl.addToSaveLater, token, data).then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> pincodeAvailabilityCheck(
      dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo2.addToSaveLater(AppUrl.pincodeCheck, token, data).then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> removeFromCart(
      dynamic data, BuildContext context, String slug) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.removeFromCart(AppUrl.removeFromCart, token, data).then((value) {
      setLoading(false);
      Utils.showFlushBarWithMessage("Alert", value.message, context);
      isCart = !isCart;
      getDetails(context, "", slug);

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

  Future<bool> addToCart(
      dynamic data, BuildContext context, String slug) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    _myRepo.addToCart(AppUrl.addToCart, token, data).then((value) {
      setLoading(false);

      if (value.message == "Successfully added!") {
        isCart = !isCart;
        getDetails(context, "", slug);

        Utils.showFlushBarWithMessage("Alert", value.message, context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }

      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

  Future<bool> addToWishlist(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    _myRepo.addToWishlist(AppUrl.addToWishlist, token, data).then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

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

  Future<bool> removeFromWishlist(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    _myRepo
        .removeFromWishlist(AppUrl.removeFromWishlist, token, data)
        .then((value) {
      setLoading(false);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

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
