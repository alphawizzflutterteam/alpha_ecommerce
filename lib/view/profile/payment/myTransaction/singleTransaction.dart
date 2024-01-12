import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/model/transactionHistoryModel.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../widget_common/commonBackground.dart';
import '../../common_header.dart';

class SingleTransaction extends StatefulWidget {
  final DatumTrasaction data;
  const SingleTransaction({Key? key, required this.data}) : super(key: key);

  @override
  State<SingleTransaction> createState() => _SingleTransactionState();
}

class _SingleTransactionState extends State<SingleTransaction> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const LightBackGround(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : Colors.white,
        body: Column(
          children: [
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.transparent
                  : colors.buttonColor,
              child: Stack(
                children: [
                  const ProfileHeader(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.only(top: 35),
                      height: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Routes.navigateToPreviousScreen(context);
                                  },
                                  child: const Icon(Icons.arrow_back_ios)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.1),
                                child: Text(
                                  "Transaction Detail",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.white,
                                      fontSize: Platform.isAndroid
                                          ? size_18
                                          : size_20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              widget.data.orderAmount,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.data.createdAt,
                            style: TextStyle(
                                color: colors.lightTextColor, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.54,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color:
                                      const Color(0xff2568EE).withOpacity(0.2),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Transaction Successful",
                                      style: TextStyle(
                                        fontSize: Platform.isAndroid
                                            ? size_11
                                            : size_13,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.boxBorder
                            : const Color.fromARGB(255, 231, 229, 229),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order ID",
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.lightTextColor
                                          : colors.boxBorder,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(widget.data.orderId.toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.lightTextColor
                                              : colors.boxBorder,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              buildCustom(
                                  widget.data.status.toLowerCase() == "success",
                                  widget.data.status)
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transaction ID",
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.lightTextColor
                                          : colors.boxBorder,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(widget.data.transactionId.toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.lightTextColor
                                              : colors.boxBorder,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transaction Type",
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.lightTextColor
                                          : colors.boxBorder,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(widget.data.paymentMethod,
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.lightTextColor
                                              : colors.boxBorder,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Type",
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.lightTextColor
                                          : colors.boxBorder,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("Product Purchase",
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.lightTextColor
                                              : colors.boxBorder,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
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
}
