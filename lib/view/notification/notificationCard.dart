import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/notification/model/notificationModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/viewModel/notificationViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

notificationCard(
    DatumNot model, BuildContext context, NotificationViewModel provider) {
  String convertTimestampToFormattedDate(String timestamp) {
    // Parse the timestamp string into a DateTime object
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the DateTime object as "dd Month name yyyy"
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    return formattedDate;
  }

  return Stack(
    children: [
      Visibility(
        visible: model.isRead == "0",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.circle,
                size: 15,
                color: colors.buttonColor,
              )),
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () {
            provider.markRead(context, model.id.toString(), "0");
            if (model.type == "order") {
              List<String> parts = model.typeId.split('-');

              if (parts.length == 2) {
                String before = parts[0];
                String after = parts[1];
                var orderId = parts[0];
                var status = parts[1];

                print("orderId: $before");
                print("status: $after");

                if (status.toLowerCase() == "canceled") {
                  Routes.navigateToOrderCancelledScreen(context, orderId);
                } else if (status.toLowerCase() == "delivered") {
                  Routes.navigateToOrderDetailDeliveredDetailScreen(
                      context, orderId);
                } else if (status.toLowerCase() == "returned") {
                  Routes.navigateToOrderReturnedDetailScreen(
                      context, orderId, "", "");
                } else {
                  print("here");

                  Routes.navigateToOrderOnTheWayDetailScreen(context, orderId);
                }
              } else {
                print("Invalid format");
              }
            } else if (model.type == "product") {
              Routes.navigateToProductDetailPageScreen(context, model.typeId);
            } else if (model.type == "coupon") {
              Routes.navigateToCouponScreen(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              // height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  model.type == "order"
                      ? Image.asset(
                          "assets/images/Group 493.png",
                          height: 60,
                          width: 50,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        )
                      : Image.asset(
                          "assets/images/Group 3067.png",
                          height: 60,
                          width: 50,
                        ),
                  // CachedNetworkImage(
                  //   imageUrl: model.image,
                  //   height: 80,
                  //   width: 70,
                  //   fit: BoxFit.fill,
                  //   errorWidget: (context, url, error) => ErrorImageWidget(),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                            model.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize:
                                      Platform.isAndroid ? size_14 : size_14,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                            model.message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: colors.greyText,
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          convertTimestampToFormattedDate(model.updatedAt),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
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
      ]),
    ],
  );
}
