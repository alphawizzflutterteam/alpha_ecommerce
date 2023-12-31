import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

secondCategoryCard(CategoryList model, BuildContext context,
    SearchViewModel searchProvider, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
    child: InkWell(
      onTap: () {
        searchProvider.categoryId = model.id.toString();
        searchProvider.isHome = false;
        searchProvider.selectedIndexFromHome = index;
        Routes.navigateToDashboardScreen(context, 1);
        // searchProvider.getProductsListNew(context, "25", "1");
        // Routes.navigateToSearchScreen(context);
      },
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: model.icon!,
                  errorWidget: (context, url, error) => ErrorImageWidget(),
                  height: size_65,
                  width: size_65,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: size_70,
            child: Text(
              model.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: size_10),
            ),
          ),
        ],
      ),
    ),
  );
}

Row secondCategoryListCard(BuildContext context, List<CategoryList> model,
        SearchViewModel searchProvider) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length > 10 ? 10 : model.length,
              (index) => secondCategoryCard(
                  model[index], context, searchProvider, index),
            ),
          ),
        )
      ],
    );
