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

//demo-product-23-wHYnzh?user_id=14
    await _myRepo
        .getProductDetails(
      "${AppUrl.productDetail}$productName?user_id=$userId",
      token,
    )
        .then((value) {
      model = value.products!;

      imageList = model.first.images;
      selectedPrice = model.first.specialPrice;
      variationList = model.first.variation;
      relatedProducts = value.relatedProducts!;
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
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
}
