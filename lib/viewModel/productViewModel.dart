import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/productRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  var selectedColor = "";
  var selectedColorCode = "";
  var selectedVariation = "";
  var slugProdduct = "";

  List<Map<String, dynamic>> selectedVariationMap = [];

  TextEditingController pinController = TextEditingController();

  List<ProductList> relatedProducts = [];
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setFolllowing(bool value) {
    isFollowing = value;
    notifyListeners();
  }

  Future<void> getDetails(
      BuildContext context, dynamic data, String productName) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    var userId = SharedPref.shared.pref!.getString(PrefKeys.userId)!;
    print(token);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      // setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .getProductDetails(
        "${AppUrl.productDetail}$productName?user_id=$userId",
        token,
      )
          .then((value) {
        slugProdduct = productName;
        model = value.products!;
        selectedPrice = model.first.specialPrice;

        try {
          for (int i = 0; i < model.first.choiceOptions.length; i++) {
            Map<String, String> map = {
              model.first.choiceOptions[i].name:
                  model.first.choiceOptions[i].options[0]
            };
            selectedPrice = model.first.variation.first.price;

            selectedVariationMap.add(map);
          }
        } catch (stacktrace) {}

        try {
          selectedColor = model.first.colorsFormatted[0].name;
          selectedColorCode = model.first.colorsFormatted[0].code;
        } catch (stacktrace) {}
        isFav = model.first.isFavorite;
        isCart = model.first.isCart;
        imageList = model.first.images;
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
  }

  Future<bool> removeFromSaveLater(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
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
    return false;
  }

  Future<bool> addToSaveLater(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
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
    }
    return false;
  }

  Future<bool> pincodeAvailabilityCheck(
      dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
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
    }
    return false;
  }

  Future<bool> removeFromCart(
      dynamic data, BuildContext context, String slug) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
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
    }
    return false;
  }

  Map<String, String> addMapListToData(
      Map<String, String> data, List<Map<String, dynamic>> mapList) {
    for (var map in mapList) {
      map.forEach((key, value) {
        data[key] = value;
      });
    }
    return data;
  }

  Future<bool> addToCart(
      Map<String, String> data, BuildContext context, String slug) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    var data2 = data;
    data2 = addMapListToData(data2, selectedVariationMap);

    print(data2);
    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      _myRepo.addToCart(AppUrl.addToCart, token, data2).then((value) {
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
    }
    return false;
  }

  Future<bool> addToWishlist(dynamic data, BuildContext context) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      // setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      if (token == null || token == "") {
        Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

        getDetails(context, data, slugProdduct);
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
    }
    return false;
  }

  Future<bool> removeFromWishlist(dynamic data, BuildContext context) async {
    //setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      // setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      if (token == null || token == "") {
        Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

        return false;
      }
      _myRepo
          .removeFromWishlist(AppUrl.removeFromWishlist, token, data)
          .then((value) {
        // setLoading(false);

        Utils.showFlushBarWithMessage("Alert", value.message, context);
        getDetails(context, data, slugProdduct);

        print(value.message);

        return true;
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        Utils.showFlushBarWithMessage("Alert", error.toString(), context);
        return false;
      });
    }
    return false;
  }

  Future<bool> followVendor(dynamic data, BuildContext context) async {
    //setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      // setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      if (token == null || token == "") {
        Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

        return false;
      }
      _myRepo.followvendor(AppUrl.followVendor, token, data).then((value) {
        //  setLoading(false);

        Utils.showFlushBarWithMessage("Alert", value.message, context);
        getDetails(context, data, model.first.slug);
        setFolllowing(!isFollowing);
        notifyListeners();

        return true;
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        Utils.showFlushBarWithMessage("Alert", error.toString(), context);
        return false;
      });
    }

    return false;
  }
}
