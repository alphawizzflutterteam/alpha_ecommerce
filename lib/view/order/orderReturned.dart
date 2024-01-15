import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderReturnViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class OrderReturned extends StatefulWidget {
  final String order_id;
  final String image;
  final String name;
  const OrderReturned(
      {Key? key,
      required this.order_id,
      required this.image,
      required this.name})
      : super(key: key);

  @override
  State<OrderReturned> createState() => _OrderReturnedState();
}

class _OrderReturnedState extends State<OrderReturned> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late OrderReturnViewModel detailProvider;
  @override
  void initState() {
    super.initState();
    detailProvider = Provider.of<OrderReturnViewModel>(context, listen: false);
    callApi();
  }

  callApi() async {
    await detailProvider.getRetuurnOrderDetail(context, widget.order_id);
  }

  String convertTimestampToFormattedDate(String timestamp) {
    // Parse the timestamp string into a DateTime object
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the DateTime object as "dd Month name yyyy"
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

    return "(" + formattedDate + " )";
  }

  @override
  Widget build(BuildContext context) {
    detailProvider = Provider.of<OrderReturnViewModel>(context);
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
              detailProvider.isLoading
                  ? appLoader()
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 40,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order ID - ${widget.order_id}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .24,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: ListView.builder(
                                  itemCount: 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      // Routes.navigateToProductDetailPageScreen(
                                      //     context,
                                      //     productList[index]
                                      //         .productDetails!
                                      //         .slug!);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .35,
                                      margin: const EdgeInsets.only(right: 15),
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          // image: DecorationImage(image: NetworkImage(model.images.first)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark
                                              ? LinearGradient(
                                                  colors: [
                                                    colors.boxGradient1
                                                        .withOpacity(1),
                                                    Colors.transparent,
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                )
                                              : LinearGradient(
                                                  colors: [
                                                    Color(0xFFE4E2ED),
                                                    Colors.white,
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.boxBorder
                                                  : colors.lightBorder)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.12,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            widget.image),
                                                        fit: BoxFit.contain),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize:
                                                            Platform.isAndroid
                                                                ? size_10
                                                                : size_12,
                                                      ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  detailProvider.returnDetail
                                                      .data.subtotal,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color:
                                                            colors.buttonColor,
                                                        fontSize:
                                                            Platform.isAndroid
                                                                ? size_10
                                                                : size_12,
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
                              ),
                            ),

                            // ProductListBuilder(
                            //     productList: orderProvider.detail.products),
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
                            //                 style: Theme.of(context)
                            // .textTheme
                            // .titleSmall!
                            // .copyWith(

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
                            // //               style: Theme.of(context)
                            //                               .textTheme
                            //                               .titleSmall!
                            //                               .copyWith(

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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: colors.buttonColor),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Ordered ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: colors.textColor),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 80,
                              child: const VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.deepPurple),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Order Return",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: colors.textColor)),
                                      Text(
                                          convertTimestampToFormattedDate(
                                              detailProvider.returnDetail.data
                                                  .refundRequest[0].updatedAt),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: colors.boxBorder,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${detailProvider.returnDetail.data.refundAmount} - Alpha Wallet",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(color: colors.textColor),
                                      ),
                                      Row(
                                        children: [
                                          detailProvider
                                                      .returnDetail
                                                      .data
                                                      .refundRequest
                                                      .first
                                                      .status
                                                      .toLowerCase() ==
                                                  "pending"
                                              ? Icon(Icons.pending,
                                                  color: detailProvider
                                                              .returnDetail
                                                              .data
                                                              .refundRequest
                                                              .first
                                                              .status
                                                              .toLowerCase() ==
                                                          "pending"
                                                      ? Colors.red
                                                      : colors.buttonColor)
                                              : Icon(Icons.check,
                                                  color: detailProvider
                                                              .returnDetail
                                                              .data
                                                              .refundRequest
                                                              .first
                                                              .status
                                                              .toLowerCase() ==
                                                          "pending"
                                                      ? Colors.red
                                                      : colors.buttonColor),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            detailProvider.returnDetail.data
                                                .refundRequest.first.status
                                                .toUpperCase(),
                                            style: TextStyle(
                                                color: detailProvider
                                                            .returnDetail
                                                            .data
                                                            .refundRequest
                                                            .first
                                                            .status
                                                            .toLowerCase() ==
                                                        "pending"
                                                    ? Colors.red
                                                    : colors.buttonColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    detailProvider.returnDetail.data
                                        .refundRequest.first.refundReason,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: colors.lightTextColor,
                                          fontSize: Platform.isAndroid
                                              ? size_10
                                              : size_12,
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
