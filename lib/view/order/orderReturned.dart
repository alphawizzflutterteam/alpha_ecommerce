import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class OrderReturned extends StatefulWidget {
  const OrderReturned({Key? key}) : super(key: key);

  @override
  State<OrderReturned> createState() => _OrderReturnedState();
}

class _OrderReturnedState extends State<OrderReturned> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var orderProvider = Provider.of<OrderViewModel>(context, listen: false);
    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  InternalPageHeader(
                    text: 'Order Detail',
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order ID - ${orderProvider.detail.orderId}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Platform.isAndroid ? size_12 : size_14,
                                ),
                              ),
                              Text(
                                "SOLD BY : ${orderProvider.detail.seller!.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Platform.isAndroid ? size_12 : size_14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ProductListBuilder(
                          productList: orderProvider.detail.products),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         horizontal: 5.0, vertical: 10),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Container(
                      //             width: 75,
                      //             height: 75,
                      //             decoration: const BoxDecoration(
                      //                 color: colors.boxBorder,
                      //                 borderRadius: BorderRadius.all(
                      //                     Radius.circular(10))),
                      //             child: Image.asset(
                      //               Images.dettol,
                      //               width: 50,
                      //               height: 50,
                      //             )),
                      //         const SizedBox(
                      //           width: 20,
                      //         ),
                      //         Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             SizedBox(
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.59,
                      //               child: const Text(
                      //                 "Dettol Refresh Long Lasting",
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: Platform.isAndroid ? size_18 : size_20,
                      //                 ),
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 10,
                      //             ),
                      //             const Text(
                      //               "\$120.00",
                      //               style: TextStyle(
                      //                 color: colors.buttonColor,
                      //                 fontSize: Platform.isAndroid ? size_18 : size_20,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Row(
                          children: [
                            Icon(Icons.check_circle, color: colors.buttonColor),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Ordered Saturday, 6 Oct",
                              style: TextStyle(color: colors.textColor),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 80,
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle, color: Colors.deepPurple),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order Return",
                                    style: TextStyle(color: colors.textColor)),
                                Text("15 Oct, 2023",
                                    style: TextStyle(
                                      color: colors.lightTextColor,
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 80,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: colors.boxBorder,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${orderProvider.detail.subtotal} - Alpha Wallet",
                                  style: TextStyle(color: colors.textColor),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: colors.buttonColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Complete",
                                      style:
                                          TextStyle(color: colors.buttonColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                              style: TextStyle(
                                color: colors.lightTextColor,
                                fontSize:
                                    Platform.isAndroid ? size_10 : size_12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
