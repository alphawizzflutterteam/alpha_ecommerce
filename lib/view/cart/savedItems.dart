import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../model/cartList.dart';

class SavedItemsWidget extends StatefulWidget {
  final int i;
  const SavedItemsWidget({Key? key, required this.i}) : super(key: key);

  @override
  State<SavedItemsWidget> createState() => _SavedItemsWidgetState();
}

class _SavedItemsWidgetState extends State<SavedItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colors.boxBorder)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  // Routes.navigateToProductDetailPageScreen(context);
                },
                child: Image.asset(
                  cartList[widget.i].productImage,
                  width: 110,
                  height: 140,
                ),
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      //     Routes.navigateToProductDetailPageScreen(context);
                    },
                    child: Text(
                      cartList[widget.i].productName,
                      style: TextStyle(
                          color: colors.textColor,
                          fontSize: Platform.isAndroid ? size_12 : size_14),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        cartList[widget.i].productPrice,
                        style: TextStyle(
                            color: colors.buttonColor,
                            fontSize: Platform.isAndroid ? size_14 : size_16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          cartList[widget.i].productDiscount,
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: colors.greyText,
                              fontSize: Platform.isAndroid ? size_12 : size_14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    cartList[widget.i].productWeight,
                    style: TextStyle(
                      color: colors.greyText,
                      fontSize: Platform.isAndroid ? size_10 : size_12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: colors.boxBorder)),
                child: Text(
                  "Remove from Saved Items",
                  style: TextStyle(
                    color: colors.textColor,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
