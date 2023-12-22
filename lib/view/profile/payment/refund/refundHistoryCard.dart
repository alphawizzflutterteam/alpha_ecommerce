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
                          style: const TextStyle(
                              color: colors.textColor, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.amount,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
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
                const Text(
                  "Transaction ID",
                  style: TextStyle(color: colors.textColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data.orderId.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
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
