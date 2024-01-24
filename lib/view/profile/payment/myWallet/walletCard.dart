import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/model/walletModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String convertTimestampToFormattedDate(String timestamp) {
  // Parse the timestamp string into a DateTime object
  DateTime dateTime = DateTime.parse(timestamp);

  // Format the DateTime object as "dd Month name yyyy"
  String formattedDate = DateFormat('dd MMM yyyy, h:mm a').format(dateTime);

  return formattedDate;
}

walletCart(
    {required BuildContext context, required WalletTransactioList data}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.overlayBG
            : Color.fromARGB(255, 228, 228, 228),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                convertTimestampToFormattedDate(data.createdAt),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                    ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                data.transactionType,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: Platform.isAndroid
                                            ? size_18
                                            : size_20),
                              )
                            ],
                          ),
                          buildCustom(
                              data.debit.toString() == "₹0.00",
                              data.credit.toString(),
                              data.debit.toString(),
                              context),
                        ],
                      ),
                      const SizedBox(
                        height: size_12,
                      ),
                      Text(
                        "Transaction ID :\n ${data.transactionId}",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: Platform.isAndroid ? size_8 : size_10,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildCustom(
    bool isSuccess, String credit, String debit, BuildContext context) {
  Color buttonColor = isSuccess ? Colors.green : Colors.red;
  Color textColor = isSuccess ? Colors.green : Colors.red;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: buttonColor.withOpacity(0.2),
        ),
        child: Text(
          isSuccess ? "Credit" : "Debit",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: textColor),
        ),
      ),
      SizedBox(
        height: size_2,
      ),
      Text(
        isSuccess ? "+ $credit" : " $debit",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w600),
      )
    ],
  );
}
