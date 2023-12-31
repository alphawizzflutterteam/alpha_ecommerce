import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

deliveryCard(BuildContext context, {required ProductListDetail model}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0x14E9E9E9)
          : Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Visibility(
          visible: model.freeShipping == 1,
          child: SizedBox(
            width: 60,
            child: Column(
              children: [
                Image.asset(Images.freeDelivery,
                    height: 30,
                    width: 30,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Free Delivery",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                ),
              ],
            ),
          ),
        ),
        model.refundable == "1"
            ? SizedBox(
                width: 60,
                child: Column(
                  children: [
                    Image.asset(Images.nonRefundable,
                        height: 30,
                        width: 30,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Non -\nRefundable",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
              )
            : Container(),
        model.featuredStatus == 1
            ? SizedBox(
                width: 60,
                child: Column(
                  children: [
                    Image.asset(Images.topBrand,
                        height: 30,
                        width: 30,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Top Brand",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
              )
            : Container(),
        SizedBox(
          width: 60,
          child: Column(
            children: [
              Image.asset(Images.warranty,
                  height: 30,
                  width: 30,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Pay on Delivery",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
