import 'package:flutter/material.dart';
import '../../../../model/transaction.dart';
import '../../../../utils/color.dart';

transactionHistoryCard({required context, required transactionIndex}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        "${transaction[transactionIndex].transactionDate} , ${transaction[transactionIndex].transactionTime}",
                        style: const TextStyle(
                            color: colors.textColor, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction[transactionIndex].transactionAmount,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  buildCustomButton(
                      transaction[transactionIndex].transactionStatus),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order ID",
                        style: TextStyle(color: colors.textColor, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction[transactionIndex].orderId,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Transaction ID",
                        style: TextStyle(color: colors.textColor, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      transaction[transactionIndex].transactionStatus
                          ? Text(
                              transaction[transactionIndex].transactionId,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )
                          : const Text(
                              "-",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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

Widget buildCustomButton(bool isSuccess) {
  Color buttonColor = isSuccess ? Colors.green : Colors.red;
  Color textColor = isSuccess ? Colors.green : Colors.red;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: buttonColor.withOpacity(0.2),
      onPrimary: textColor,
    ),
    onPressed: () {},
    child: Text(isSuccess ? "SUCCESS" : "unsuccessful"),
  );
}
