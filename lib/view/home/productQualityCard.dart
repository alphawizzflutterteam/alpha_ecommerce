import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/topDealsModel.dart';
import 'package:flutter/material.dart';

productQualityCard(TopDealsModel modelBanners, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: size_40,
            width: size_40,
          ),
          const SizedBox(
            width: 2,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * .20,
              child: Text(modelBanners.data!.frameOne!.label1!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: Platform.isAndroid ? size_7 : size_9,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)
                  // style: TextStyle(fontSize: size_9, fontWeight: FontWeight.bold),
                  )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: size_40,
            width: size_40,
          ),
          const SizedBox(
            width: 2,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * .20,
              child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  modelBanners.data!.frameOne!.label2!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: Platform.isAndroid ? size_7 : size_9,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: size_40,
            width: size_40,
          ),
          const SizedBox(
            width: 2,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * .2,
              child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  modelBanners.data!.frameOne!.label3!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: Platform.isAndroid ? size_7 : size_9,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    ],
  );
}
