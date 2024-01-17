import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';

specificationCard({required context, required ProductListDetail productData}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0x14E9E9E9)
          : Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Specification",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: Platform.isAndroid ? size_14 : size_14),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Weight",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade300
                        : Colors.black87,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
            Text(
              productData.weight,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Made IN",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade300
                        : Colors.black87,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
            Text(
              productData.made_in,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Warranty",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade300
                        : Colors.black87,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
            Text(
              productData.warranty,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Manufacturing Date",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade300
                        : Colors.black87,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
            Text(
              productData.manufacturing_date,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Refundable",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade300
                        : Colors.black87,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
            Text(
              productData.refundable,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cancellable",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade300
                        : Colors.black87,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
            Text(
              "Till received",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
            ),
          ],
        ),
      ],
    ),
  );
}
