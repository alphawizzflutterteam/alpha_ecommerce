import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';

dailyDealCard(DailyDealsModelList model, BuildContext context,
    SearchViewModel searchProvider) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: (() {
      searchProvider.clearFilters();
      searchProvider.offerId = model.id.toString();
      searchProvider.offerPercentage = model.discount.toString();
      searchProvider.isHome = false;
      Routes.navigateToSearchScreen(context);
      searchProvider.getProductsListNew(context, "25", "1");
    }),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Images.bestOffer,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Column(
            children: [
              const SizedBox(
                height: size_8,
              ),
              Text(model.title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: Platform.isAndroid ? size_14 : size_16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              // style: Theme.of(context).textTheme.titleSmall!.copyWith(
              //     fontSize:
              //  Platform.isAndroid ? size_14 : size_16,
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold),
              // textAlign: TextAlign.center,
              //  ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  model.description,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: Platform.isAndroid ? size_6 : size_8,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  // style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //     fontSize: size_8,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w600),
                  // // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  // //     fontSize: size_8,
                  // //     color: Colors.white,
                  //     fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Row dailyDealListCard(
  BuildContext context,
  List<DailyDealsModelList> model,
  SearchViewModel searchProvider,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) => dailyDealCard(model[index], context, searchProvider),
            ),
          ),
        )
      ],
    );
