import 'package:alpha_ecommerce_18oct/repository/categoryRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryViewModel extends ChangeNotifier {
  final _myRepo = CategoryRepository();
  bool isLoading = false;
  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  late CategoriesModel model;
  List<CategoryList> data = [];

  Future<void> getCategories(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo.categoryListRequest(AppUrl.categories, token).then((value) {
        print(value.message);

        data = value.data!;
        print(data.length.toString() + "Category length");
        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);
        print(stackTrace.toString());
      });
    }
  }
}
