import 'dart:convert';

import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/bannersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/cartHomeNew.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/filtersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/topDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/chat/model/chatModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel with ChangeNotifier {
  bool isLoading = false;
  bool isScrolled = true;
  final _myRepo = HomeRepository();

  List<ProductList> productsModel = [];

  String banner1 = "";
  String banner2 = "";

  List<SpecialOffersList> specialOffersModel = [];

  List<Map<String, dynamic>> selectedVariationMap = [];

  List<BannersList> bannersListTop = [];
  List<DailyDealsModelList> dailyDealsModel = [];
  List<CategoryList> categoriesModel = [];
  List<WishlistItem> wishlistModel = [];
  List<HomeProduct> cartModel = [];
  List<Filters> filterModel = [];
  List<MessageChat> chatListt = [];
  List<BrandsList> brandsModel = [];
  bool get loading => isLoading;
  late TopDealsModel modelBanners;

  List<String> imageList = [];
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
      brandsModel.clear();
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
      specialOffersModel.clear();
      setLoading(false);
    });
  }

  Future<void> getDailyDealsList(BuildContext context) async {
    setLoading(true);

    await _myRepo.dailyDealsListApi(AppUrl.dailyDeals).then((value) {
      dailyDealsModel = value.data;
      setLoading(false);
    }).onError((error, stackTrace) {
      dailyDealsModel.clear();
      setLoading(false);
    });
  }

  // Future<void> getProductsList(
  //     BuildContext context, String limit, String offset) async {
  //   setLoading(true);
  //   var userID = SharedPref.shared.pref!.getString(PrefKeys.userId) ?? "";
  //   await _myRepo
  //       .productsListApi(
  //           "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID")
  //       .then((value) {
  //     print(
  //         "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID");
  //     productsModel = value.products;
  //     print(productsModel.length.toString() + "PRoduct length");
  //     notifyListeners();

  //     setLoading(false);
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     print(error.toString() + "Product error");
  //   });
  // }

  Future<void> getCategories(BuildContext context) async {
    setLoading(true);

    await _myRepo.categoryListRequest(AppUrl.categories).then((value) {
      categoriesModel = value.data!;
      notifyListeners();
      print(categoriesModel.length.toString());
      setLoading(false);
    }).onError((error, stackTrace) {
      categoriesModel.clear();
      print("heree " + error.toString());
      setLoading(false);
    });
  }

  Future<void> getCategoriesList(BuildContext context, int isHome) async {
    setLoading(true);

    await _myRepo
        .categoryListRequest(AppUrl.categories + isHome.toString())
        .then((value) {
      categoriesModel = value.data!;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      categoriesModel.clear();
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
      wishlistModel.clear();
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
      cartModel.clear();
      print(error.toString() + "cart error");
      print(stackTrace.toString() + "cart error");
    });
  }

  Future<void> getBannersList(BuildContext context) async {
    setLoading(true);

    await _myRepo.bannersListApi(AppUrl.banners + "main_banner").then((value) {
      bannersListTop = value.data;
      imageList.clear();
      for (int i = 0; i < bannersListTop.length; i++) {
        imageList.add(bannersListTop[i].photo);
      }
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      bannersListTop.clear();
      imageList.clear();

      print(error.toString());
    });
  }

  Future<bool> addToWishlist(dynamic data, BuildContext context) async {
    //  setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    _myRepo.addToWishlist(AppUrl.addToWishlist, token, data).then((value) {
      setLoading(false);

      SearchViewModel searchProvider =
          Provider.of<SearchViewModel>(context, listen: false);
      searchProvider.getProductsListNew(context, "25", "1");
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
    //setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    _myRepo
        .removeFromWishlist(AppUrl.removeFromWishlist, token, data)
        .then((value) {
      setLoading(false);

      SearchViewModel searchProvider =
          Provider.of<SearchViewModel>(context, listen: false);
      searchProvider.getProductsListNew(context, "25", "1");
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

  Map<String, String> addMapListToData(
      Map<String, String> data, List<Map<String, dynamic>> mapList) {
    for (var map in mapList) {
      map.forEach((key, value) {
        data[key] = value;
      });
    }
    return data;
  }

  Future<bool> addToCart(Map<String, String> data, BuildContext context) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    if (token == null || token == "") {
      Utils.showFlushBarWithMessage("Alert", "Please login first.", context);

      return false;
    }
    var data2 = data;
    data2 = addMapListToData(data2, selectedVariationMap);
    print(data2.toString());

    _myRepo.addToCart(AppUrl.addToCart, token, data2).then((value) {
      setLoading(false);

      if (value.message == "Successfully added!") {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      } else {
        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }
      selectedVariationMap.clear();

      SearchViewModel searchProvider =
          Provider.of<SearchViewModel>(context, listen: false);
      searchProvider.getProductsListNew(context, "25", "1");
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
    //setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.removeFromCart(AppUrl.removeFromCart, token, data).then((value) {
      setLoading(false);
      Utils.showFlushBarWithMessage("Alert", value.message, context);

      SearchViewModel searchProvider =
          Provider.of<SearchViewModel>(context, listen: false);
      searchProvider.getProductsListNew(context, "25", "1");
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

  Future<bool> customerSupport(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.contactSuupporttt(AppUrl.contact, token, data).then((value) {
      setLoading(false);
      Utils.showFlushBarWithMessage("", value.message, context);

      subjectController.text = "";
      descriptionController.text = "";
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

  Future<void> getProductFilters(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.filterListRequest(AppUrl.filtersList, token).then((value) {
      filterModel = value.data!;

      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(errorMessage);
      print(error.toString() + "product filter error");
      print(stackTrace.toString() + "product filter error");
    });
  }

  Future<void> getHomeBanners(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.bannersRequestt(AppUrl.bannersSection, token).then((value) {
      print(value.toString() + "BAnners");
      modelBanners = value;
      banner1 = modelBanners.data!.summerSaleBanner!.image!;
      banner2 = modelBanners.data!.primeTimeBanner!.image!;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(errorMessage);
      print(stackTrace.toString() + "getHomeBanners error");
    });
  }

  Future<void> getChatlist(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.chatListRequest(AppUrl.chatList, token).then((value) {
      chatListt = value.message;

      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(errorMessage);
      print(stackTrace.toString() + "chat error");
    });
  }

  Future<void> sendMessage(BuildContext context, dynamic body) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.sendMessage(AppUrl.sendMessage, token, body).then((value) {
      getChatlist(context);
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(errorMessage);
      print(stackTrace.toString() + "message send error");
    });
  }

  Future<void> getProfileAPI(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo.getProfileAPI(AppUrl.getProfile, token, data).then((value) {
      setLoading(false);

      print(value.data[0].id.toString());

      SharedPref.shared.pref
          ?.setString(PrefKeys.userId, value.data[0].id.toString());
      SharedPref.shared.pref
          ?.setString(PrefKeys.name, value.data[0].name.toString());
      SharedPref.shared.pref
          ?.setString(PrefKeys.email, value.data[0].email.toString());

      SharedPref.shared.pref
          ?.setString(PrefKeys.userDetails, jsonEncode(value));
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());

      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }

  Future<void> addMoneyToWallet(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.addWAllet(AppUrl.addWallet, token, data).then((value) async {
      setLoading(false);

      Routes.navigateToWalletSuccessScreen(context);
      try {
        var phone = SharedPref.shared.pref!.getString(PrefKeys.mobile);

        Map data2 = {'phone': phone};
        getProfileAPI(data2, context);
      } catch (stacktrace) {}
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage(
          "Alert", "Email or phone has already been taken.", context);
      //  Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }

  Future<void> subscribeAlpha(dynamic data, BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(data);
    _myRepo.addWAllet(AppUrl.subscribe, token, data).then((value) async {
      setLoading(false);

      Routes.navigateToDashboardScreen(context, 2);
      Utils.showFlushBarWithMessage("", value.message, context);
      try {
        var phone = SharedPref.shared.pref!.getString(PrefKeys.mobile);

        Map data2 = {'phone': phone};
        getProfileAPI(data2, context);
      } catch (stacktrace) {}
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage(
          "Alert", "Email or phone has already been taken.", context);
      //  Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }

  Future<void> deleteAccount(BuildContext context) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    var userID = SharedPref.shared.pref!.getString(PrefKeys.userId)!;

    _myRepo
        .deleteaccount(
      AppUrl.deleteAccount + userID,
      token,
    )
        .then((value) async {
      Routes.navigateToSignInScreen(context);

      Utils.showFlushBarWithMessage("Alert", value.message, context);

      if (value.status == true) {
        SharedPref.shared.pref?.setString(PrefKeys.mobile, "");
        SharedPref.shared.pref?.setString(PrefKeys.isLoggedIn, "0");
        SharedPref.shared.pref?.setString(PrefKeys.jwtToken, "");
        SharedPref.shared.removeUserPRef();
        Future.delayed(Duration(seconds: 2), () {
          Routes.navigateToSignInScreen(context);
        });
      }

      // setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
      Utils.showFlushBarWithMessage("Alert", "Something went wrong.", context);
      //  Utils.showFlushBarWithMessage("Alert", error.toString(), context);
    });
  }
}
