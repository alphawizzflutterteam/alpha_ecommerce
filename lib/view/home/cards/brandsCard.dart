import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

brandCard(
    BrandsList model, BuildContext context, SearchViewModel searchProvider) {
  return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10, bottom: 8),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          searchProvider.clearFilters();

          searchProvider.brandId = model.id.toString();
          searchProvider.isHome = false;
          Routes.navigateToSearchScreen(context);
          searchProvider.getProductsListNew(context, "25", "1");
        },
        child: Column(
          children: [
            Container(
              width: size_50, // Set your desired width
              height: size_50, // Set your desired height
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: model.image!,
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, error) =>
                      ClipOval(child: ErrorImageWidget()),
                ),
              ),
            ),
            const SizedBox(
              height: size_5,
            ),
            Text(model.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                    color: colors.darkColor2,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ));
}

Row brandsCard(BuildContext context, List<BrandsList> model,
        SearchViewModel searchViewModel) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: List.generate(
              model.length > 10 ? 10 : model.length,
              (index) => brandCard(model[index], context, searchViewModel),
            ),
          ),
        )
      ],
    );
