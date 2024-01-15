import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/app_utils.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/productViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../utils/color.dart';

recommendedProductCard(
    {required context,
    required List<ProductList> model,
    required ProductDetailViewModel provider,
    required String productSlug}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.36,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(model.length, (index) {
        var card = model[index];
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Routes.navigateToProductDetailPageScreen(
                context, model[index].slug);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width * 0.44,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                // image: DecorationImage(image: NetworkImage(model.images.first)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          colors.boxGradient1.withOpacity(1),
                          Colors.transparent,
                        ]
                      : [
                          Colors.grey.withOpacity(0.2),
                          Colors.transparent,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(model.first.thumbnail),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${card.discount}% Off",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.orange,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                            ),
                            LikeButton(
                              onTap: (isLiked) {
                                var isLoggedIn = SharedPref.shared.pref
                                    ?.getString(PrefKeys.isLoggedIn);

                                if (isLoggedIn == "1") {
                                  Map data = {'product_id': card.id.toString()};
                                  if (isLiked) {
                                    return provider.removeFromWishlist(
                                        data, context);
                                  } else {
                                    return provider.addToWishlist(
                                        data, context);
                                  }
                                } else {
                                  return AppUtils.appUtilsInstance.nothing();
                                }
                              },
                              size: size_20,
                              isLiked: card.isFavorite,
                              circleColor: const CircleColor(
                                  start: Colors.red, end: Colors.red),
                              bubblesColor: const BubblesColor(
                                dotPrimaryColor: Colors.red,
                                dotSecondaryColor: Colors.red,
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color: card.isFavorite
                                      ? Colors.pink
                                      : Colors.grey,
                                  size: 20,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 0,
                        ),
                        child: Text(
                          card.name,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Text(
                              card.unitPrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.cyan,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              card.purchasePrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: colors.lightTextColor,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    decorationThickness: 3,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Map<String, String> data;
                            if (!card.isCart) {
                              try {
                                Map<String, String> map = {
                                  card.choiceOptions[0].name:
                                      card.choiceOptions[0].options[0]
                                };

                                provider.selectedVariationMap.add(map);
                              } catch (err) {}

                              data = {
                                'id': card.id.toString(),
                                'quantity': "1",
                                'color': card.colorsFormatted.isNotEmpty
                                    ? card.colorsFormatted[0].code
                                    : "",
                              };
                            } else {
                              data = {
                                'key': card.cart_id.toString(),
                              };
                            }
                            print(data);
                            card.isCart
                                ? provider.removeFromCart(
                                    data, context, productSlug)
                                : provider.addToCart(
                                    data, context, productSlug, false);
                          },
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: colors.boxBorder)),
                            child: Text(
                              card.isCart ? "Remove From Cart" : "Add to Cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.textColor
                                          : Colors.black,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
