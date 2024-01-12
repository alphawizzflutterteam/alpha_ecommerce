import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';

productForUText(BuildContext ctx) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    alignment: Alignment.centerLeft,
    child: Text(
      "Product for you",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Platform.isAndroid ? size_14 : size_16,
          color: Theme.of(ctx).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
    ),
  );
}

spaceOfHeight({double? height}) {
  return SizedBox(
    height: height ?? 10,
  );
}
