import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

wishlistCard(BuildContext context, WishlistItemProduct model,
    HomeViewModel homeProvider) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      Routes.navigateToProductDetailPageScreen(context, model.slug);
    },
    child: Container(
      height: MediaQuery.of(context).size.height * .18,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: model.thumbnail,
                  width: MediaQuery.of(context).size.width * .24,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => Image.asset(
                    Images.defaultProductImg,
                    width: MediaQuery.of(context).size.width * .24,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .52,
                  child: Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontSize: Platform.isAndroid ? size_14 : size_14),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      model.unitPrice,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: colors.buttonColor,
                          fontSize: Platform.isAndroid ? size_14 : size_16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        model.specialPrice,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.greyText
                                  : Colors.black,
                              fontSize: Platform.isAndroid ? size_14 : size_14,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black,
                              decorationThickness: 3,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  model.code,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.greyText
                            : Colors.black,
                        fontSize: Platform.isAndroid ? size_10 : size_12,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Map data = {'product_id': model.id.toString()};
                          homeProvider.removeFromWishlist(data, context);
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.boxBorder
                                    : colors.lightBorder,
                              )),
                          child: Text(
                            "DELETE",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () async {
                          Map<String, String> data;

                          if (model.isCart) {
                            data = {
                              'key': model.cart_id.toString(),
                            };

                            await homeProvider.removeFromCart(data, context);
                          } else {
                            try {
                              for (int i = 0;
                                  i < model.choiceOptions.length;
                                  i++) {
                                Map<String, String> map = {
                                  model.choiceOptions[i].name:
                                      model.choiceOptions[i].options[0]
                                };

                                homeProvider.selectedVariationMap.add(map);
                              }
                            } catch (stacktrace) {}

                            data = {
                              'id': model.id.toString(),
                              'quantity': "1",
                              'color': model.colorsFormatted.isNotEmpty
                                  ? model.colorsFormatted[0]['code']
                                  : "",
                            };
                            await homeProvider.addToCart(data, context);
                          }
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.boxBorder
                                    : colors.lightBorder,
                              )),
                          child: Text(
                            model.isCart ? "Remove From Cart" : "Add To Cart",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
