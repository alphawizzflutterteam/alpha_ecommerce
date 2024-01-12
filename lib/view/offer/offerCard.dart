import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../utils/images.dart';

offerCard(context) {
  return Container(
    height: 180,
    width: MediaQuery.of(context).size.width * 0.95,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: Colors.yellow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                    fontSize: Platform.isAndroid ? size_16 : size_18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                Images.offer,
                height: 20,
                width: 20,
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            border: Border.all(
              color: colors.boxBorder,
            ),
            color: Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Everyday Savings, Fresh Delights:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Platform.isAndroid ? size_12 : size_14),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Your One-Stop Grocery Destination!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Platform.isAndroid ? size_12 : size_14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '50% off',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Platform.isAndroid ? size_18 : size_20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expires',
                        style: TextStyle(
                          color: colors.greyText,
                          fontSize: Platform.isAndroid ? size_10 : size_12,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '30 Jul 2019',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Platform.isAndroid ? size_12 : size_14),
                      ),
                    ],
                  ),
                  DottedBorder(
                    color: colors.greyText,
                    strokeWidth: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.file_copy,
                              color: Colors
                                  .white), // Replace with your desired icon
                          Text(
                            'CP16533',
                            style: TextStyle(
                                fontSize:
                                    Platform.isAndroid ? size_14 : size_16,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
