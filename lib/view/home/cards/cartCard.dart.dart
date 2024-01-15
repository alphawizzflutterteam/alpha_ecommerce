import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/cartHomeNew.dart';
import 'package:flutter/material.dart';

cartCard(HomeProduct model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Routes.navigateToProductDetailPageScreen(context, model.slug);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: size_150,
            decoration: BoxDecoration(
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
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
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
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 1,
                        ),
                        child: Text(
                          "${model.discount}% Off",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.orange,
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
                        child: Text(
                          model.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
                              model.specialPrice,
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
                              model.unitPrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: colors.lightTextColor,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    decorationThickness: 3,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Row cartCardRowHome(
  BuildContext context,
  List<HomeProduct> model,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) => cartCard(model[index], context),
            ),
          ),
        )
      ],
    );
