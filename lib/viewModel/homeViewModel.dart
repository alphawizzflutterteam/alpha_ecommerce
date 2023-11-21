import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModels.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  bool isLoading = false;
  final _myRepo = HomeRepository();

  List<Product> productsModel = [];

  List<SpecialOffersList> specialOffersModel = [];
  List<DailyDealsModelList> dailyDealsModel = [];
  List<CategoriesList> categoriesModel = [];
  List<BrandsList> brandsModel = [];
  bool get loading => isLoading;

  setLoading(bool value) {
    isLoading = value;
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
    await _myRepo
        .productsListApi("${AppUrl.productsList}?limit=$limit&offset=$offset")
        .then((value) {
      productsModel = value.products;
      print(productsModel.length);
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
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
}
