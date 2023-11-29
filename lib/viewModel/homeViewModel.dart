import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/bannersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/cartHomeNew.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  bool isLoading = false;
  bool isScrolled = true;
  final _myRepo = HomeRepository();

  List<ProductList> productsModel = [];

  List<SpecialOffersList> specialOffersModel = [];
  List<BannersList> bannersListTop = [];
  List<DailyDealsModelList> dailyDealsModel = [];
  List<CategoriesList> categoriesModel = [];
  List<WishlistItem> wishlistModel = [];
  List<HomeProduct> cartModel = [];
  List<BrandsList> brandsModel = [];
  bool get loading => isLoading;

  List<String> imageList = [];
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setScrolling(bool value) {
    isScrolled = value;
    notifyListeners();
  }

  Future<void> getBrandsList(BuildContext context) async {
    setLoading(true);

    await _myRepo.brandsListApi(AppUrl.brands).then((value) {
      brandsModel = value.data;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> getSpecialOffersList(BuildContext context) async {
    setLoading(true);

    await _myRepo.specialOffersListApi(AppUrl.specialOffers).then((value) {
      specialOffersModel = value.data;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> getDailyDealsList(BuildContext context) async {
    setLoading(true);

    await _myRepo.dailyDealsListApi(AppUrl.dailyDeals).then((value) {
      dailyDealsModel = value.data;
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> getProductsList(
      BuildContext context, String limit, String offset) async {
    setLoading(true);
    var userID = SharedPref.shared.pref!.getString(PrefKeys.userId);
    await _myRepo
        .productsListApi(
            "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID")
        .then((value) {
      print(
          "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID");
      productsModel = value.products;
      print(productsModel.length.toString() + "PRoduct length");
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString() + "Product error");
    });
  }

  Future<void> getCategories(BuildContext context) async {
    setLoading(true);

    await _myRepo.categoryListRequest(AppUrl.categories).then((value) {
      categoriesModel = value.data;
      notifyListeners();
      print(categoriesModel.length.toString());
      setLoading(false);
    }).onError((error, stackTrace) {
      print("heree " + error.toString());
      setLoading(false);
    });
  }

  Future<void> getCategoriesList(BuildContext context) async {
    setLoading(true);

    await _myRepo.categoryListRequest(AppUrl.categories).then((value) {
      categoriesModel = value.data;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
    });
  }

  Future<void> getWishlistItem(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.wishlistRequest(AppUrl.wishlist, token).then((value) {
      wishlistModel = value.data;
      print(wishlistModel.length);
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString() + "wishlilist");
      print(stackTrace.toString() + "wishlilist");
    });
  }

  Future<void> getCartListItem(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.cartListRequest(AppUrl.cartList, token).then((value) {
      cartModel = value.data.products;

      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(errorMessage);
      print(error.toString() + "cart error");
      print(stackTrace.toString() + "cart error");
    });
  }

  Future<void> getBannersList(BuildContext context) async {
    setLoading(true);

    await _myRepo.bannersListApi(AppUrl.banners + "main_banner").then((value) {
      bannersListTop = value.data;

      for (int i = 0; i < bannersListTop.length; i++) {
        imageList.add(bannersListTop[i].photo);
      }
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
    });
  }

  Future<bool> addToWishlist(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.addToWishlist(AppUrl.addToWishlist, token, data).then((value) {
      setLoading(false);

      getProductsList(context, "25", "1");
      getWishlistItem(context);
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

    _myRepo
        .removeFromWishlist(AppUrl.removeFromWishlist, token, data)
        .then((value) {
      setLoading(false);

      getProductsList(context, "25", "1");
      getWishlistItem(context);
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

      getProductsList(context, "25", "1");
      print(value.message);
      getCartListItem(context);
      getWishlistItem(context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
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

      getProductsList(context, "25", "1");
      getCartListItem(context);
      getWishlistItem(context);

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
