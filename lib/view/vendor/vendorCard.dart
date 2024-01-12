import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';

vendorCard(context, VendorDatum model) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      Routes.navigateToVendorDetailsScreen(context, model);
    },
    child: Container(
      height: MediaQuery.of(context).size.height * .14,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0x14E9E9E9)
            : const Color(0xFFE3E1EC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.maxFinite,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image.network(
                model.image,
                width: MediaQuery.of(context).size.width * .2,
                errorBuilder: (context, error, stackTrace) =>
                    ErrorImageWidget(),
              ),
            ),
            VerticalDivider(color: Colors.transparent),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Text(
                            model.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textColor
                                  : Colors.black,
                              fontSize: Platform.isAndroid ? size_13 : size_15,
                            ),
                          ),
                        ),
                        Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.rating,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textColor
                                    : Colors.black,
                            fontSize: Platform.isAndroid ? size_12 : size_14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        model.followers,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textColor
                                    : Colors.black,
                            fontSize: Platform.isAndroid ? size_13 : size_15),
                      ),
                      VerticalDivider(
                        color: Colors.transparent,
                        width: 3,
                      ),
                      Text(
                        "Follower",
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textColor
                                    : Colors.black54,
                            fontSize: Platform.isAndroid ? size_12 : size_14),
                      ),
                    ],
                  ),
                  Divider(color: Colors.transparent),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(""),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "View Details",
                          style: TextStyle(
                              color: colors.buttonColor,
                              fontSize: Platform.isAndroid ? 12 : 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
