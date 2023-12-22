import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/topDealsModel.dart';
import 'package:flutter/material.dart';

productQualityCard(TopDealsModel modelBanners) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 2,
          ),
          SizedBox(
              width: 60,
              child: Text(
                modelBanners.data!.frameOne!.label1!,
                style:
                    TextStyle(fontSize: size_10, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 2,
          ),
          SizedBox(
              width: 60,
              child: Text(
                modelBanners.data!.frameOne!.label2!,
                style:
                    TextStyle(fontSize: size_10, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 2,
          ),
          SizedBox(
              width: 60,
              child: Text(
                modelBanners.data!.frameOne!.label3!,
                style:
                    TextStyle(fontSize: size_10, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ],
  );
}
