import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/app_utils.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../utils/color.dart';
import '../../../utils/routes.dart';

productForYouCard(
    ProductList model, BuildContext context, HomeViewModel homeProvider) {
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width * 0.44,
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Routes.navigateToProductDetailPageScreen(context, model.slug);
                },
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(model.thumbnail),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
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
                      vertical: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${model.discount}% Off",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600)),
                        // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        //   color: Colors.orange,
                        //   fontSize:
                        //               Platform.isAndroid ? size_10 : size_12,,
                        // ),
                        //  ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: LikeButton(
                            onTap: (isLiked) {
                              var isLoggedIn = SharedPref.shared.pref
                                  ?.getString(PrefKeys.isLoggedIn);

                              if (isLoggedIn == "1") {
                                Map data = {'product_id': model.id.toString()};
                                if (isLiked) {
                                  return homeProvider.removeFromWishlist(
                                      data, context);
                                } else {
                                  return homeProvider.addToWishlist(
                                      data, context);
                                }
                              } else {
                                return AppUtils.appUtilsInstance.nothing();
                              }
                            },
                            size: size_20,
                            isLiked: model.isFavorite,
                            circleColor: const CircleColor(
                                start: Colors.red, end: Colors.red),
                            bubblesColor: const BubblesColor(
                              dotPrimaryColor: Colors.red,
                              dotSecondaryColor: Colors.red,
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: isLiked ? Colors.pink : Colors.grey,
                                size: 20,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Text(model.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            )),
                    // style: Theme.of(context)
                    // .textTheme
                    // .titleSmall!
                    // .copyWith(

                    //   color: Theme.of(context).brightness == Brightness.dark
                    //       ? colors.textColor
                    //       : Colors.black,
                    //   fontSize:
                    //                  Platform.isAndroid ? size_10 : size_12,,
                    //),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Text(model.specialPrice,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.w600)),
                        // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        //   color: Colors.cyan,
                        //   fontSize:
                        //                Platform.isAndroid ? size_10 : size_12,,
                        // ),
                        //  ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(model.unitPrice,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    decorationThickness: 3,
                                    color: colors.lightTextColor,
                                    fontWeight: FontWeight.w600)),
                        //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        //     color: colors.lightTextColor,
                        //     decoration: TextDecoration.lineThrough,
                        //     fontSize:
                        //               Platform.isAndroid ? size_10 : size_12,,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        var isLoggedIn = SharedPref.shared.pref
                            ?.getString(PrefKeys.isLoggedIn);

                        if (isLoggedIn == "1") {
                          Map<String, String> data;
                          if (!model.isCart) {
                            try {
                              Map<String, String> map = {
                                model.choiceOptions[0].name:
                                    model.choiceOptions[0].options[0]
                              };

                              homeProvider.selectedVariationMap.add(map);
                            } catch (err) {}

                            data = {
                              'id': model.id.toString(),
                              'quantity': "1",
                              'color': model.colorsFormatted.isNotEmpty
                                  ? model.colorsFormatted[0].code
                                  : "",
                              'choice_2': model.choiceOptions.isNotEmpty
                                  ? model.choiceOptions[0].options[0]
                                  : ""
                            };
                          } else {
                            data = {
                              'key': model.cart_id.toString(),
                            };
                          }
                          print(data);
                          model.isCart
                              ? homeProvider.removeFromCart(data, context)
                              : homeProvider.addToCart(data, context);
                        } else {
                          AppUtils.appUtilsInstance
                              .showLoginAlertDialog(context);
                        }
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: Color.fromARGB(255, 91, 97, 100))),
                        child: Text(
                          model.isCart ? "Remove From Cart" : "Add to Cart",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),

                        //  TextStyle(
                        //     color: Theme.of(context).brightness == Brightness.dark
                        //         ? colors.textColor
                        //         : Colors.black,
                        //      fontSize: Platform.isAndroid ? size_10 : size_12),

                        //  ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //  spaceOfHeight(),
    ],
  );
}


// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 3, // number of items in each row
//     mainAxisSpacing: 8.0, // spacing between rows
//     crossAxisSpacing: 8.0, // spacing between columns
//   ),
//   padding: EdgeInsets.all(8.0), // padding around the grid
//   itemCount: items.length, // total number of items
//   itemBuilder: (context, index) {
//     return Container(
//       color: Colors.blue, // color of grid items
//       child: Center(
//         child: Text(
//           items[index],
//           style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                    //   fontSize: Platform.isAndroid
                                                  // ? size_16
                                                  // : size_18.0, color: Colors.white),
//         ),
//       ),
//     );
//   },
// )
