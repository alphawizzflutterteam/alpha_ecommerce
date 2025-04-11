import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/model/transactionHistoryModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../model/transaction.dart';
import '../../../../utils/color.dart';

transactionHistoryCard({required context, required DatumTrasaction data}) {
  String convertTimestampToFormattedDate(String timestamp) {
    // Parse the timestamp string into a DateTime object
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the DateTime object as "dd Month name yyyy"
    String formattedDate = DateFormat('dd MMM yyyy, h:mm a').format(dateTime);

    return formattedDate;
  }

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Routes.navigateToSingleTransactionScreen(context, data);
          },
          child: SizedBox(
            height: size_120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          convertTimestampToFormattedDate(data.createdAt),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Color.fromARGB(255, 165, 165, 165),
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.orderAmount,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize:
                                      Platform.isAndroid ? size_18 : size_20),
                        )
                      ],
                    ),
                    buildCustom(data.status.toLowerCase() == "success",
                        data.status.toUpperCase()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Color.fromARGB(255, 165, 165, 165),
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.orderId.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize:
                                      Platform.isAndroid ? size_12 : size_14),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction ID",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Color.fromARGB(255, 165, 165, 165),
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.transactionId,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize:
                                      Platform.isAndroid ? size_12 : size_14),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          height: 1,
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}

Widget buildCustom(bool isSuccess, String status) {
  Color buttonColor = isSuccess ? Colors.green : Colors.red;
  Color textColor = isSuccess ? Colors.green : Colors.red;

  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      color: buttonColor.withOpacity(0.2),
    ),
    child: Text(
      status,
      style: TextStyle(color: Colors.white),
    ),
  );
}
