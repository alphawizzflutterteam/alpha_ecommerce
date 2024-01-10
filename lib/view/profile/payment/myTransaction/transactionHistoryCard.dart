import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/model/transactionHistoryModel.dart';
import 'package:flutter/material.dart';
import '../../../../model/transaction.dart';
import '../../../../utils/color.dart';

transactionHistoryCard({required context, required DatumTrasaction data}) {
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
            height: 115,
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
                          style: const TextStyle(
                              color: Color.fromARGB(255, 165, 165, 165),
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          data.orderAmount,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20),
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
                        const Text(
                          "Order ID",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 165, 165),
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.orderId.toString(),
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Transaction ID",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 165, 165),
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.transactionId,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14),
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
        height: 20,
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
      style: TextStyle(color: textColor),
    ),
  );
}
