import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

savedItemCard(
    WishlistItemProduct model, BuildContext context, CartViewModel provider) {
  return Container(
    height: MediaQuery.of(context).size.height * .255,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        // image: DecorationImage(image: NetworkImage(model.images.first)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: Theme.of(context).brightness == Brightness.dark
            ? LinearGradient(
                colors: [
                  colors.boxGradient1.withOpacity(1),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : LinearGradient(
                colors: [
                  Color(0xFFE4E2ED),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? colors.boxBorder
                : colors.lightBorder)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Routes.navigateToProductDetailPageScreen(context, model.slug);
                },
                child: Image.network(
                  model.thumbnail,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    Images.defaultProductImg,
                    width: 100,
                    height: 100,
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Routes.navigateToProductDetailPageScreen(
                        context, model.slug);
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .48),
                    child: Text(model.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      model.specialPrice,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: colors.buttonColor,
                          fontSize: Platform.isAndroid ? size_14 : size_16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        model.unitPrice,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: colors.greyText,
                            fontSize: Platform.isAndroid ? size_12 : size_14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  model.weight,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: colors.greyText,
                        fontSize: Platform.isAndroid ? size_10 : size_12,
                      ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () async {
                Map data = {
                  'product_id': model.id.toString(),
                };
                print(data);
                await provider.removeFromSaveLater(data, context);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.boxBorder
                            : colors.lightBorder)),
                child: Text(
                  "Remove from Saved Items",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.textColor
                          : colors.greyText,
                      fontSize: Platform.isAndroid ? 10 : 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () async {
                Map data = {
                  'id': model.id.toString(),
                  'quantity': "1",
                  'color': model.colorImage.isNotEmpty
                      ? "#" + model.colorImage[0].color
                      : "",
                  'choice_2': model.choiceOptions.isNotEmpty
                      ? model.choiceOptions[0].options[0]
                      : ""
                };
                print(data);
                await provider.addToCart(data, context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  "Add to Cart",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Platform.isAndroid ? size_10 : size_12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Column savedCardsRow(BuildContext context, List<WishlistItem> model,
        CartViewModel provider) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: List.generate(
              model.length,
              (index) => savedItemCard(model[index].product, context, provider),
            ),
          ),
        )
      ],
    );
