import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:flutter/material.dart';

notificationCard(Map<String, dynamic> notifications) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(
      height: 5,
    ),
    SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            notifications['image'],
            width: 60,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifications['text'],
                    // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    //       color: Colors.white,
                    //       fontSize: Platform.isAndroid ? size_12 : size_14,
                    //     ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      notifications['subText'],
                      // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      //       color: colors.greyText,
                      //       fontSize: Platform.isAndroid ? size_10 : size_12,
                      //   ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifications['date'],
                  // style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  //       color: colors.greyText,
                  //       fontSize: Platform.isAndroid ? size_10 : size_12,
                  //     ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: Colors.white,
        height: 1,
      ),
    ),
  ]);
}
