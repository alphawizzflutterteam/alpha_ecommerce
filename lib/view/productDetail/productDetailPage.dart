import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/app_utils.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/productRatingAndFollowers.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/recommendedProductCard.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/reviewCard.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/specificationCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/productViewModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../widget_common/toast_message.dart';
import '../profile/common_header.dart';
import 'freeDeliveryCard.dart';

class ProductDetailPage extends StatefulWidget {
  final String slug;
  const ProductDetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double rating = 4;

  late ProductDetailViewModel productModel;
  @override
  void initState() {
    super.initState();
    productModel = Provider.of<ProductDetailViewModel>(context, listen: false);
    productModel.selectedVariationMap.clear();

    productModel.getDetails(context, "", widget.slug);
    try {
      checkSelectedProductAndUpdateProductRate(
          productModel.model.first.choiceOptions[0].options[0]);
    } catch (stacktrace) {}
  }

  bool isValuePresent(List<Map<String, dynamic>> dataList, String targetValue) {
    for (var data in dataList) {
      for (var value in data.values) {
        if (value == targetValue) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // productModel.dispose();
  }

  int _currentIndex = 0;

  void checkSelectedProductAndUpdateProductRate(String selectedVariation) {
    var text = selectedVariation.replaceAll(RegExp(r"\s+\b|\b\s"), "");
    print(text.toLowerCase());
    for (int i = 0; i < productModel.variationList.length; i++) {
      if (productModel.variationList[i].type
          .toLowerCase()
          .contains(text.toLowerCase())) {
        print(productModel.variationList[i].type.toLowerCase());
        productModel.selectedProduct = productModel.variationList[i].type;
        print(productModel.variationList[i].price);
        productModel.selectedPrice = productModel.variationList[i].price;
      }
    }
    setState(() {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    productModel = Provider.of<ProductDetailViewModel>(context);

    //  print(productModel.model.first.slug.toString());
    return Stack(
      children: [
        const LightBackGround(),
        RefreshIndicator(
          color: colors.buttonColor,
          backgroundColor: Colors.white,
          displacement: 40.0,
          strokeWidth: 2.0,
          semanticsLabel: 'Pull to refresh',
          semanticsValue: 'Refresh',
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
            productModel.selectedVariationMap.clear();

            productModel.getDetails(context, "", widget.slug);
            try {
              checkSelectedProductAndUpdateProductRate(
                  productModel.model.first.choiceOptions[0].options[0]);
            } catch (stacktrace) {}
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            extendBody: true,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.white,
            body: Column(
              children: [
                Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : colors.buttonColor,
                  child: Stack(
                    children: [
                      ProfileHeader(),
                      InternalDetailPageHeader(
                        text: "Product Detail",
                      ),
                    ],
                  ),
                ),
                productModel.isLoading
                    ? Center(
                        child: LoadingAnimationWidget.halfTriangleDot(
                          color: colors.buttonColor,
                          size: 40,
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        colors.boxGradient1.withOpacity(0.5),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  //  height: MediaQuery.of(context).size.height * .3,
                                  child: Column(
                                    children: [
                                      CarouselSlider(
                                        items:
                                            productModel.imageList.map((item) {
                                          return Container(
                                            //  height: size_120,
                                            width: double.infinity,
                                            child: Image.network(
                                              item,
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                      Images.defaultProductImg),
                                            ),
                                          );
                                        }).toList(),
                                        options: CarouselOptions(
                                          enableInfiniteScroll: false,
                                          viewportFraction: 1,
                                          autoPlay: true,
                                          enlargeCenterPage: true,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _currentIndex = index;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: productModel.imageList
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _currentIndex = entry.key;
                                              });
                                            },
                                            child: Container(
                                              width: 10.0,
                                              height: 10.0,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    _currentIndex == entry.key
                                                        ? colors.buttonColor
                                                        : Colors.grey,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${productModel.model.first.discount} %",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Colors.orange,
                                              fontSize: Platform.isAndroid
                                                  ? size_14
                                                  : size_16,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    LikeButton(
                                      onTap: (isLiked) {
                                        var isLoggedIn = SharedPref.shared.pref
                                            ?.getString(PrefKeys.isLoggedIn);

                                        if (isLoggedIn == "1") {
                                          Map data = {
                                            'product_id': productModel
                                                .model.first.id
                                                .toString()
                                          };
                                          productModel.isFav =
                                              !productModel.isFav;
                                          if (isLiked) {
                                            return productModel
                                                .removeFromWishlist(
                                                    data, context);
                                          } else {
                                            return productModel.addToWishlist(
                                                data, context);
                                          }
                                        } else {
                                          return AppUtils.appUtilsInstance
                                              .nothing();
                                        }
                                      },
                                      size: size_20,
                                      isLiked: productModel.isFav,
                                      circleColor: const CircleColor(
                                          start: Colors.red, end: Colors.red),
                                      bubblesColor: const BubblesColor(
                                        dotPrimaryColor: Colors.red,
                                        dotSecondaryColor: Colors.red,
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: productModel.isFav
                                              ? Colors.pink
                                              : Colors.grey,
                                          size: 20,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: Text(
                                        productModel.model.first.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_14
                                                    : size_16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    productModel.model.first.rating.isNotEmpty
                                        ? Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                productModel.model.first.rating
                                                        .isNotEmpty
                                                    ? productModel
                                                            .model
                                                            .first
                                                            .rating
                                                            .first
                                                            .average
                                                            .substring(0, 3) ??
                                                        ""
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? colors.textColor
                                                          : Colors.black,
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? size_12
                                                              : size_14,
                                                    ),
                                              ),
                                            ],
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.,
                                  children: [
                                    Text(
                                      productModel.selectedPrice,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: Platform.isAndroid
                                                ? size_16
                                                : size_18,
                                          ),
                                    ),

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      productModel.model.first.unitPrice,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Color.fromARGB(
                                                255, 196, 197, 202),
                                            fontSize: Platform.isAndroid
                                                ? size_11
                                                : size_13,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Colors.black,
                                            decorationThickness: 2,
                                          ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "or Pay \$${productModel.model.first.amount_after_coin_use} + ",
                                    // //       style: Theme.of(context)
                                    //                   .textTheme
                                    //                   .titleSmall!
                                    //                   .copyWith(

                                    //         color: Theme.of(context).brightness ==
                                    //                 Brightness.dark
                                    //             ? Colors.white
                                    //             : Colors.black,
                                    //         fontSize: Platform.isAndroid ? size_14 : size_14,
                                    //       ),
                                    //     ),
                                    // Row(
                                    //   children: [
                                    //     Image.asset(
                                    //       Images.rupees,
                                    //       height: 20,
                                    //       width: 20,
                                    //     ),
                                    //     const SizedBox(
                                    //       width: 5,
                                    //     ),
                                    //     Text(
                                    //       productModel.model.first
                                    //           .use_coins_with_amount,
                                    //       style: Theme.of(context)
                                    // .textTheme
                                    // .titleSmall!
                                    // .copyWith(

                                    //         color: Theme.of(context)
                                    //                     .brightness ==
                                    //                 Brightness.dark
                                    //             ? Colors.white
                                    //             : Colors.black,
                                    //         fontSize: Platform.isAndroid ? size_14 : size_14,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    //  ],
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: size_15,
                              ),
                              productModel.model.first.colorsFormatted.length >
                                      0
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Text(
                                        "Colors",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                      ),
                                    )
                                  : Container(),
                              SizedBox(
                                height: size_10,
                              ),
                              productModel.model.first.colorsFormatted.length >
                                      0
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          SingleChildScrollView(
                                            child: SizedBox(
                                              height: 40,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  50,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                itemCount: productModel
                                                    .model
                                                    .first
                                                    .colorsFormatted
                                                    .length,
                                                itemBuilder: (context, j) {
                                                  return InkWell(
                                                    highlightColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      productModel
                                                              .selectedColor =
                                                          productModel
                                                              .model
                                                              .first
                                                              .colorsFormatted[
                                                                  j]
                                                              .name;
                                                      productModel
                                                              .selectedColorCode =
                                                          productModel
                                                              .model
                                                              .first
                                                              .colorsFormatted[
                                                                  j]
                                                              .code;
                                                      setState(() {});
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10),
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Theme.of(
                                                                            context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Border.all(
                                                                    color: productModel.selectedColor == productModel.model.first.colorsFormatted[j].name
                                                                        ? Colors
                                                                            .white
                                                                        : const Color(
                                                                            0x14E9E9E9),
                                                                    width: 2)
                                                                : Border.all(
                                                                    color: productModel.selectedColor ==
                                                                            productModel
                                                                                .model
                                                                                .first
                                                                                .colorsFormatted[
                                                                                    j]
                                                                                .name
                                                                        ? colors
                                                                            .buttonColor
                                                                        : colors
                                                                            .lightBorder,
                                                                    width: 2),
                                                          ),
                                                          child: SizedBox(
                                                            width: productModel
                                                                        .model
                                                                        .first
                                                                        .colorsFormatted
                                                                        .length <
                                                                    10
                                                                ? size_60
                                                                : size_100,
                                                            child: Center(
                                                              child: Text(
                                                                productModel
                                                                    .model
                                                                    .first
                                                                    .colorsFormatted[
                                                                        j]
                                                                    .name,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                                    color: Theme.of(context).brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            214,
                                                                            208,
                                                                            208)
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        size_12),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),

                              const SizedBox(
                                height: size_15,
                              ),
                              SizedBox(
                                height: productModel
                                        .model.first.choiceOptions.length *
                                    90,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: productModel
                                        .model.first.choiceOptions.length,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productModel.model.first
                                                  .choiceOptions[i].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SingleChildScrollView(
                                                  child: SizedBox(
                                                    height: 40,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            50,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const AlwaysScrollableScrollPhysics(),
                                                      itemCount: productModel
                                                          .model
                                                          .first
                                                          .choiceOptions[i]
                                                          .options
                                                          .length,
                                                      itemBuilder:
                                                          (context, j) {
                                                        return InkWell(
                                                          highlightColor: Colors
                                                              .transparent,
                                                          splashColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            Map<String, String>
                                                                map = {
                                                              productModel
                                                                      .model
                                                                      .first
                                                                      .choiceOptions[
                                                                          i]
                                                                      .name:
                                                                  productModel
                                                                      .model
                                                                      .first
                                                                      .choiceOptions[
                                                                          i]
                                                                      .options[j]
                                                            };

                                                            bool isElementPresent = productModel
                                                                .selectedVariationMap
                                                                .where((map) => map.containsKey(
                                                                    productModel
                                                                        .model
                                                                        .first
                                                                        .choiceOptions[
                                                                            i]
                                                                        .name))
                                                                .isNotEmpty;
                                                            if (isElementPresent) {
                                                              print(
                                                                  'Element is present in the list.');
                                                            } else {
                                                              print(
                                                                  'Element is not present in the list.');
                                                            }

                                                            if (isElementPresent) {
                                                              productModel
                                                                  .selectedVariationMap
                                                                  .removeWhere((element) =>
                                                                      element.containsKey(productModel
                                                                          .model
                                                                          .first
                                                                          .choiceOptions[
                                                                              i]
                                                                          .name));
                                                            }
                                                            productModel
                                                                .selectedVariationMap
                                                                .add(map);
                                                            checkSelectedProductAndUpdateProductRate(
                                                                productModel
                                                                    .model
                                                                    .first
                                                                    .choiceOptions[
                                                                        i]
                                                                    .options[j]);
                                                            setState(() {});
                                                            print(productModel
                                                                .selectedVariationMap
                                                                .toString());
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? Border.all(
                                                                          color: isValuePresent(productModel.selectedVariationMap, productModel.model.first.choiceOptions[i].options[j])
                                                                              // productModel
                                                                              //     .selectedVariationMap,
                                                                              // targetValue)
                                                                              ? Colors.white
                                                                              : const Color(0x14E9E9E9),
                                                                          width: 2)
                                                                      : Border.all(color: isValuePresent(productModel.selectedVariationMap, productModel.model.first.choiceOptions[i].options[j]) ? colors.buttonColor : colors.lightBorder, width: 2),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    productModel
                                                                        .model
                                                                        .first
                                                                        .choiceOptions[
                                                                            i]
                                                                        .options[
                                                                            j]
                                                                        .trim(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall!
                                                                        .copyWith(
                                                                            color: Theme.of(context).brightness == Brightness.dark
                                                                                ? const Color.fromARGB(255, 214, 208, 208)
                                                                                : Colors.black,
                                                                            fontSize: size_12),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Map data = {
                                          'product_id': productModel
                                              .model.first.id
                                              .toString()
                                        };
                                        productModel.addToSaveLater(
                                            data, context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                width: 1)),
                                        child: Text(
                                          "Save for later",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: Platform.isAndroid
                                                      ? size_10
                                                      : size_12,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   highlightColor: Colors.transparent,
                                    //   splashColor: Colors.transparent,
                                    //   onTap: () {
                                    //     showAlertDialog(context);
                                    //   },
                                    //   child: Container(
                                    //     alignment: Alignment.center,
                                    //     width: MediaQuery.of(context).size.width *
                                    //         0.4,
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 10, vertical: 10),
                                    //     margin: const EdgeInsets.only(right: 10),
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.transparent,
                                    //         borderRadius:
                                    //             BorderRadius.circular(5),
                                    //         border: Border.all(
                                    //             color: Theme.of(context)
                                    //                         .brightness ==
                                    //                     Brightness.dark
                                    //                 ? Colors.white
                                    //                 : Colors.black,
                                    //             width: 1)),
                                    //     child: Text(
                                    //       "View 360",
                                    //       style: Theme.of(context)
                                    // .textTheme
                                    // .titleSmall!
                                    // .copyWith(

                                    //           color:
                                    //               Theme.of(context).brightness ==
                                    //                       Brightness.dark
                                    //                   ? Colors.white
                                    //                   : Colors.black,
                                    //           fontSize:
                                    //   Platform.isAndroid ? size_10 : size_12,,
                                    //           fontWeight: FontWeight.bold),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black54,
                                height: 1,
                              ),
                              productModel.model.first.metaDescription == ""
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Description",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: Platform.isAndroid
                                                        ? size_12
                                                        : size_14),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            productModel
                                                .model.first.metaDescription,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? colors.textColor
                                                      : Colors.black,
                                                  fontSize: Platform.isAndroid
                                                      ? size_10
                                                      : size_12,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                              // Container(
                              //   margin: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 10),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "Use pincode to check delivery info",
                              //         style: Theme.of(context)
                              // .textTheme
                              // .titleSmall!
                              // .copyWith(

                              //           color: Theme.of(context).brightness ==
                              //                   Brightness.dark
                              //               ? Colors.white
                              //               : Colors.black,
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 10,
                              //       ),
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Expanded(
                              //             child: SizedBox(
                              //               height: 40,
                              //               child: TextField(
                              //                 keyboardType: const TextInputType
                              //                     .numberWithOptions(
                              //                     signed: true, decimal: false),
                              //                 controller:
                              //                     productModel.pinController,
                              //                 textAlign: TextAlign.start,
                              //                 inputFormatters: [
                              //                   LengthLimitingTextInputFormatter(
                              //                       6)
                              //                 ],
                              //                 style: Theme.of(context)
                              // .textTheme
                              // .titleSmall!
                              // .copyWith(

                              //                   color: Theme.of(context)
                              //                               .brightness ==
                              //                           Brightness.dark
                              //                       ? Colors.white
                              //                       : Colors.black,
                              //                 ),
                              //                 decoration: InputDecoration(
                              //                   filled: true,
                              //                   fillColor: Theme.of(context)
                              //                               .brightness ==
                              //                           Brightness.dark
                              //                       ? colors.textFieldBG
                              //                       : Colors.white,
                              //                   contentPadding:
                              //                       const EdgeInsets.symmetric(
                              //                           vertical: 10,
                              //                           horizontal: 15),
                              //                   hintText: 'Enter pincode',
                              //                   hintstyle: Theme.of(context)
                              // .textTheme
                              // .titleSmall!
                              // .copyWith(

                              //                       color: Theme.of(context)
                              //                                   .brightness ==
                              //                               Brightness.dark
                              //                           ? Colors.white
                              //                           : Colors.black,
                              //                       fontSize:
                              //       Platform.isAndroid ? size_10 : size_12,),
                              //                   focusedBorder: OutlineInputBorder(
                              //                     borderSide: const BorderSide(
                              //                       color: colors.textFieldColor,
                              //                     ),
                              //                     borderRadius:
                              //                         BorderRadius.circular(10),
                              //                   ),
                              //                   enabledBorder: OutlineInputBorder(
                              //                     borderSide: const BorderSide(
                              //                       color: colors.textFieldColor,
                              //                     ),
                              //                     borderRadius:
                              //                         BorderRadius.circular(10),
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           const SizedBox(
                              //             width: 10,
                              //           ),
                              //           SizedBox(
                              //               height: 40,
                              //               width: 100,
                              //               child: CommonButton(
                              //                   text: "Submit",
                              //                   fontSize: Platform.isAndroid ? size_14 : size_14,
                              //                   onClick: () {
                              //                     if (productModel.pinController
                              //                         .text.isEmpty) {
                              //                       return Utils
                              //                           .showFlushBarWithMessage(
                              //                               "Alert",
                              //                               "Please enter valid pincode",
                              //                               context);
                              //                     }
                              //                     Map data = {
                              //                       'pincode': productModel
                              //                           .pinController.text
                              //                     };
                              //                     productModel
                              //                         .pincodeAvailabilityCheck(
                              //                             data, context);
                              //                   })),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // //  recommendedAccessoryCard(context: context),
                              deliveryCard(
                                context,
                                model: productModel.model.first,
                              ),
                              specificationCard(
                                  context: context,
                                  productData: productModel.model.first),
                              productRatingAndFollowersCard(
                                  productModel.model.first.shop,
                                  context,
                                  productModel),
                              productModel.relatedProducts.isEmpty
                                  ? Container()
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        "Recommended Product",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                      ),
                                    ),
                              productModel.relatedProducts.isEmpty
                                  ? Container()
                                  : recommendedProductCard(
                                      context: context,
                                      model: productModel.relatedProducts,
                                      provider: productModel,
                                      productSlug:
                                          productModel.model.first.slug,
                                    ),

                              productModel.model.first.reviews.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 0),
                                      child: Text(
                                        "Reviews",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                      ),
                                    )
                                  : Container(),
                              for (int i = 0;
                                  i < productModel.model.first.reviews.length;
                                  i++)
                                reviewCard(productModel.model.first.reviews[i],
                                    context)
                              // productModel.model.first.rating.isEmpty
                              //     ? Container()
                              //     :reviewCard(
                              //         rating: rating,
                              //       )
                            ],
                          ),
                        ),
                      ),
                productModel.isLoading
                    ? Container()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: Platform.isAndroid ? 0 : 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Color(0xFF040D12)
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 20)
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed)) {
                                              return colors.buttonColor;
                                            }
                                            return Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark
                                                ? Colors.transparent
                                                : Colors.white; // Default color
                                          }),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : colors.lightBorder,
                                                  width: 1)),
                                        ),
                                        onPressed: () {
                                          var isLoggedIn = SharedPref
                                              .shared.pref
                                              ?.getString(PrefKeys.isLoggedIn);
                                          if (isLoggedIn == "1") {
                                            Map<String, String> data;
                                            if (!productModel
                                                .model.first.isCart) {
                                              data = {
                                                'id': productModel
                                                    .model.first.id
                                                    .toString(),
                                                'quantity': "1",
                                                'color': productModel
                                                        .model
                                                        .first
                                                        .colorsFormatted
                                                        .isNotEmpty
                                                    ? productModel
                                                        .selectedColorCode
                                                    : "",
                                              };
                                            } else {
                                              data = {
                                                'key': productModel
                                                    .model.first.cart_id
                                                    .toString(),
                                              };
                                            }
                                            print(data);
                                            productModel.isCart
                                                ? productModel.removeFromCart(
                                                    data, context, widget.slug)
                                                : productModel.addToCart(
                                                    data,
                                                    context,
                                                    widget.slug,
                                                    false);
                                          } else {
                                            AppUtils.appUtilsInstance
                                                .showLoginAlertDialog(context);
                                          }
                                        },
                                        child: Text(
                                          productModel.isCart
                                              ? 'REMOVE FROM CART'
                                              : 'ADD TO CART',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                    MaterialState.hovered) ||
                                                states.contains(
                                                    MaterialState.pressed)) {
                                              return colors.buttonColor;
                                            }
                                            return colors.buttonColor;
                                          }),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          var isLoggedIn = SharedPref
                                              .shared.pref
                                              ?.getString(PrefKeys.isLoggedIn);
                                          if (isLoggedIn == "1") {
                                            Map<String, String> data;
                                            if (!productModel
                                                .model.first.isCart) {
                                              data = {
                                                'id': productModel
                                                    .model.first.id
                                                    .toString(),
                                                'quantity': "1",
                                                'color': productModel
                                                        .model
                                                        .first
                                                        .colorsFormatted
                                                        .isNotEmpty
                                                    ? productModel
                                                        .selectedColorCode
                                                    : "",
                                              };

                                              productModel.addToCart(data,
                                                  context, widget.slug, true);
                                            } else {
                                              Routes.navigateToDashboardScreen(
                                                  context, 0);
                                            }
                                          } else {
                                            AppUtils.appUtilsInstance
                                                .showLoginAlertDialog(context);
                                          }
                                        },
                                        child: Text(
                                          'BUY NOW',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: Platform.isAndroid
                                                      ? size_10
                                                      : size_12,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: colors.overlayBG,
              ),
              height: 300,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Routes.navigateToPreviousScreen(context);
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.cancel_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    Images.powder,
                    fit: BoxFit.fill,
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
