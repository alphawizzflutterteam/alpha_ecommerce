import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/toast_message.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

cartCardBuyNow(
  CartProduct model,
  BuildContext context,
  CartViewModel cartProvider,
) {
  List<String> quantity = [];
  String? selectedValue;
  int availabllleStoclk = model.currentStock > 7 ? 8 : model.currentStock + 1;

  for (int i = 1; i < availabllleStoclk; i++) {
    quantity.add("$i");
  }

  return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10, bottom: 8),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    // highlightColor: Colors.transparent,
                    // splashColor: Colors.transparent,
                    onTap: () {
                      Routes.navigateToProductDetailPageScreen(
                          context, model.slug);
                    },
                    child: CachedNetworkImage(
                      imageUrl: model.thumbnail,
                      errorWidget: (context, url, error) => ErrorImageWidget(),
                      height: size_100,
                      fit: BoxFit.contain,
                      width: size_90,
                    ),
                    //  Image.network(
                    //   model.images[0],
                    //   width: 110,
                    //   height: 140,
                    //   errorBuilder: (context, error, stackTrace) => SizedBox(
                    //       height: 140, width: 110, child: ErrorImageWidget()),
                    // ),
                  ),
                  const SizedBox(width: 30),
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          child: Text(model.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                          Text(model.specialPrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: Platform.isAndroid
                                          ? size_12
                                          : size_14,
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.w600)),
                          //),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(model.unitPrice.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: Platform.isAndroid
                                            ? size_12
                                            : size_14,
                                        color: colors.greyText,
                                        decorationColor: Colors.black,
                                        decorationThickness: 3,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600)),
                            //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            //       decoration: TextDecoration.lineThrough,
                            //       color: colors.greyText,
                            //       fontSize: Platform.isAndroid ? size_14 : size_14),
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      model.currentStock == 0
                          ? Text("OUT OF STOCK",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.red
                                          : Colors.red,
                                      fontWeight: FontWeight.bold))
                          : Container(),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}

Column cartCardRowBuyNow(
  BuildContext context,
  List<CartProduct> model,
  CartViewModel cartProvider,
) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: List.generate(
              model.length,
              (index) => cartCardBuyNow(model[index], context, cartProvider),
            ),
          ),
        )
      ],
    );
