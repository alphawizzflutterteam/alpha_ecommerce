import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../utils/routes.dart';

categoryCard(
    {required BuildContext context,
    required categoryIndex,
    required categoryListIndex,
    required Childes model,
    required SearchViewModel searchProvider,
    required String categoryId,
    required bool isComingFromHome}) {
  return InkWell(
    onTap: () {
      searchProvider.categoryId = categoryId;
      searchProvider.subCategoryId = model.id!.toString();
      print("Category Id ${searchProvider.categoryId}");
      print("Sub Category Id ${searchProvider.subCategoryId}");

      searchProvider.isHome = isComingFromHome;
      if (isComingFromHome) {
        Routes.navigateToPreviousScreen(context);
      } else {
        Routes.navigateToSearchScreen(context);
      }
      searchProvider.getProductsListNew(context, "25", "1");
    },
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: model.icon!,
            height: 70,
            width: 90,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.name!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
