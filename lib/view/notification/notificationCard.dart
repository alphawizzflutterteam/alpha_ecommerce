import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/notification/model/notificationModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

notificationCard(DatumNot model, BuildContext context) {
  String convertTimestampToFormattedDate(String timestamp) {
    // Parse the timestamp string into a DateTime object
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the DateTime object as "dd Month name yyyy"
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

    return formattedDate;
  }

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
      // height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          CachedNetworkImage(
            imageUrl: model.image,
            height: 70,
            width: 90,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => ErrorImageWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.message,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: Platform.isAndroid ? size_12 : size_14,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      model.title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: colors.greyText,
                            fontSize: Platform.isAndroid ? size_10 : size_12,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  convertTimestampToFormattedDate(model.updatedAt),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: colors.greyText,
                        fontSize: Platform.isAndroid ? size_8 : size_10,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.white10
            : colors.greyText,
        height: 0.5,
      ),
    ),
  ]);
}
