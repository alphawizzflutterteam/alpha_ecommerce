import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/model/walletModel.dart';
import 'package:flutter/material.dart';

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
                                data.createdAt,
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                data.transactionType,
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          buildCustom(
                              data.debit.toString() == "0",
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
                        style: TextStyle(
                          fontSize: size_10,
                          color: Theme.of(context).brightness == Brightness.dark
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
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: buttonColor.withOpacity(0.2),
        ),
        child: Text(
          isSuccess ? "Credit" : "Debit",
          style: TextStyle(color: textColor),
        ),
      ),
      SizedBox(
        height: size_2,
      ),
      Text(
        isSuccess ? "+ $credit" : "- $debit",
        style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w600),
      )
    ],
  );
}
