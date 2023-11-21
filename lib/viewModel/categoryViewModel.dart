import 'package:alpha_ecommerce_18oct/repository/categoryRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final _myRepo = CategoryRepository();

  late CategoriesModel model;

  Future<void> getCategories(BuildContext context) async {
    await _myRepo.categoryListRequest(AppUrl.currencies).then((value) {
      model = value;
    }).onError((error, stackTrace) {});
  }
}
