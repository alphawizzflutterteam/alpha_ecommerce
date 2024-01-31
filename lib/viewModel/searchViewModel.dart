import 'package:alpha_ecommerce_18oct/repository/cartRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/homeRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/productRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/filtersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchViewModel with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  String selectedType = "";

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
//min_price
// max_price
// review_filter
  int selectedIndexFromHome = 0;

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
  String minPrice = "";
  String maxPrice = "";
  String reviewFilter = "";
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
    print("Cleared Filters");
    categoryId = "";
    subCategoryId = "";
    vendorId = "";
    brandId = "";
    offerId = "";
    offerPercentage = "";
    color = "";
    sortBy = "";
    orderBy = "";
    //isHome = true;
    reviewFilter = "";
    searchController.text = "";
  }

  Future<void> getProductsListNew(
      BuildContext context, String limit, String offset) async {
    setLoading(true);
    var userID = SharedPref.shared.pref!.getString(PrefKeys.userId) ?? "";

    minPrice = minPriceController.text;
    maxPrice = maxPriceController.text;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .productsListApi(
              "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID&category_id=$categoryId&sub_category_id=$subCategoryId&vendor_id=$vendorId&brand_id=$brandId&offer_id=$offerId&offer_percentage=$offerPercentage&color=$color&sort_by=$sortBy&order_by=$orderBy&is_home=$isHome&search_text=${searchController.text}&min_price=$minPrice&max_price=$maxPrice&review_filter=$reviewFilter")
          .then((value) {
        print(
            "${AppUrl.productsList}?limit=$limit&offset=$offset&user_id=$userID&category_id=$categoryId&sub_category_id=$subCategoryId&vendor_id=$vendorId&brand_id=$brandId&offer_id=$offerId&offer_percentage=$offerPercentage&color=$color&sort_by=$sortBy&order_by=$orderBy&is_home=$isHome&search_text=${searchController.text}&min_price=$minPrice&max_price=$maxPrice&review_filter=$reviewFilter");
        searchResults = value.products;
        print(searchResults.length.toString() + "Products length");
        notifyListeners();

        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);
        searchResults.clear();

        print("${stackTrace} Product error new ");
      });
    }
  }
}
