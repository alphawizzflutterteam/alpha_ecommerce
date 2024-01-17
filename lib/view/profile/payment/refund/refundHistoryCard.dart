import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/refund/model/refundHistoryModel.dart';
import 'package:flutter/material.dart';
import '../../../../model/refund.dart';
import '../../../../utils/color.dart';

refundHistoryCard({required context, required DatumRefund data}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Routes.navigateToSingleRefundScreen(context);
          },
          child: SizedBox(
            height: 100,
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
                          data.createdAt,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: colors.textColor,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.amount,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Platform.isAndroid ? size_18 : size_20),
                        )
                      ],
                    ),
                    buildCustomButton(
                        data.status.toLowerCase() == "success", data.status),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Transaction ID",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: colors.textColor,
                        fontSize: Platform.isAndroid ? size_10 : size_12,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data.orderId.toString(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontSize: Platform.isAndroid ? size_14 : size_14),
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider(
          color: Colors.white,
          height: 1,
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}

Widget buildCustomButton(bool isSuccess, String status) {
  Color buttonColor = isSuccess ? Colors.green : Colors.red;
  Color textColor = isSuccess ? Colors.green : Colors.red;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: buttonColor.withOpacity(0.2),
      onPrimary: textColor,
    ),
    onPressed: () {},
    child: Text(status),
  );
}
