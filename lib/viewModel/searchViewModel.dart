import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/productRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:flutter/material.dart';

class SearchViewModel with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = HomeRepository();
  TextEditingController searchController = TextEditingController();

  List<ProductList> searchResults = [];
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getProductsList(
      BuildContext context, String limit, String offset, String name) async {
    setLoading(true);
    var userID = SharedPref.shared.pref!.getString(PrefKeys.userId) ?? "";
    await _myRepo
        .productsListApi(
            "${AppUrl.searchList}name=$name&limit=$limit&offset=$offset")
        .then((value) {
      print(
          "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID");
      searchResults = value.products;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString() + "Product error");
    });
  }
}
