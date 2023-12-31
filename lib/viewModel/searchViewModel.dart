import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/productRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/filtersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:flutter/material.dart';

class SearchViewModel with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;

//limit:25
// offset:1
// user_id:15
// category_id:
// sub_category_id:
// vendor_id:
// brand_id:1
// offer_id:
// offer_percentage:50
// color:
// sort_by:
// order_by:DESC
// is_home:true
  int selectedIndex = 0;
  String categoryId = "";
  String subCategoryId = "";
  String vendorId = "";
  String brandId = "";
  String offerId = "";
  String offerPercentage = "";
  String color = "";
  String sortBy = "";
  String orderBy = "DESC";
  bool isHome = true;
  final _myRepo = HomeRepository();
  List<Map<String, dynamic>> selectedFilter = [];
  TextEditingController searchController = TextEditingController();

  List<ProductList> searchResults = [];
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void clearFilters() {
    categoryId = "";
    subCategoryId = "";
    vendorId = "";
    brandId = "";
    offerId = "";
    offerPercentage = "";
    color = "";
    sortBy = "";
    orderBy = "";
    isHome = true;
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

  Future<void> getProductsListNew(
      BuildContext context, String limit, String offset) async {
    setLoading(true);
    //https://alpha-ecom.developmentalphawizz.com/api/v1/products?limit=25&offset=1&user_id=15&category_id=&sub_category_id=&vendor_id&brand_id=1&offer_id&offer_percentage=50&color&sort_by=&order_by=DESC&is_home=truehttps://alpha-ecom.developmentalphawizz.com/api/v1/products?limit=25&offset=1&user_id=15&category_id=&sub_category_id=&vendor_id&brand_id=1&offer_id&offer_percentage=50&color&sort_by=&order_by=DESC&is_home=true
    var userID = SharedPref.shared.pref!.getString(PrefKeys.userId) ?? "";
    await _myRepo
        .productsListApi(
            "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID&category_id=$categoryId&sub_category_id=$subCategoryId&vendor_id=$vendorId&brand_id=$brandId&offer_id=$offerId&offer_percentage=$offerPercentage&color=$color&sort_by=$sortBy&order_by=$orderBy&is_home=$isHome")
        .then((value) {
      print(
          "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID&category_id=$categoryId&sub_category_id=$subCategoryId&vendor_id=$vendorId&brand_id=$brandId&offer_id=$offerId&offer_percentage=$offerPercentage&color=$color&sort_by=$sortBy&order_by=$orderBy&is_home=$isHome");
      searchResults = value.products;
      print(searchResults.length.toString() + "Products length");
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString() + "Product error");
    });
  }
}
