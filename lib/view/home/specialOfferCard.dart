import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_button.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';

specialOfferCard(SpecialOffersList model, BuildContext context,
    SearchViewModel searchProvider) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      searchProvider.clearFilters();

      searchProvider.offerId = model.id.toString();
      searchProvider.isHome = false;
      Routes.navigateToSearchScreen(context);
      searchProvider.getProductsListNew(context, "25", "1");
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Images.priceBG,
                height: MediaQuery.of(context).size.height * 0.14,
              ),
              Text(
                model.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: Platform.isAndroid ? size_11 : size_13,
                    color: colors.buttonColor,
                    fontWeight: FontWeight.bold),
                // style: const TextStyle(
                //     fontSize:
                //  Platform.isAndroid ? size_11 : size_13,
                //     color: colors.buttonColor,
                //     fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: size_8,
          ),
          SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.27,
              child: CommonButton(
                  text: "Shop now",
                  fontSize: Platform.isAndroid ? size_8 : size_10,
                  whitePrimary: true,
                  onClick: () {})),
        ],
      ),
    ),
  );
}

Row specialOfferList(BuildContext context, List<SpecialOffersList> model,
        SearchViewModel searchViewModel) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) =>
                  specialOfferCard(model[index], context, searchViewModel),
            ),
          ),
        )
      ],
    );
