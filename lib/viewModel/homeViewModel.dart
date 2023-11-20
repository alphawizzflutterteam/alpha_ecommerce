import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModels.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  bool isLoading = false;
  final _myRepo = HomeRepository();
  late BrandsModel brandsModel;
  late SpecialOffersModel specialOffersModel;
  late DailyDealsModel dailyDealsModel;
  late ProductsModel productsModel;

  bool get loading => isLoading;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getBrandsList(BuildContext context) async {
    setLoading(true);

    await _myRepo.brandsListApi(AppUrl.brands).then((value) {
      brandsModel = value;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> getSpecialOffersList(BuildContext context) async {
    setLoading(true);

    await _myRepo.specialOffersListApi(AppUrl.specialOffers).then((value) {
      specialOffersModel = value;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> getDailyDealsList(BuildContext context) async {
    setLoading(true);

    await _myRepo.dailyDealsListApi(AppUrl.dailyDeals).then((value) {
      dailyDealsModel = value;
      print(dailyDealsModel.message);
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }

  Future<void> getProductsList(
      BuildContext context, String limit, String offset) async {
    setLoading(true);
//?limit=25&offset=1
    await _myRepo
        .productsListApi("${AppUrl.productsList}?limit=$limit&offset=$offset")
        .then((value) {
      productsModel = value;
      print(dailyDealsModel.message);
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}
