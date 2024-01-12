import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';
import '../../model/category.dart';
import '../../utils/routes.dart';

vendorDetailCard(
    {required BuildContext context,
    required categoryIndex,
    required categoryListIndex}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      Routes.navigateToCategoryDetailScreen(context);
    },
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          Image.asset(
            categories[categoryIndex]
                .categoryList[categoryListIndex]
                .categoryImage,
            height: 70,
            width: 90,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categories[categoryIndex]
                .categoryList[categoryListIndex]
                .categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Platform.isAndroid ? size_10 : size_12,
            ),
          ),
        ],
      ),
    ),
  );
}
