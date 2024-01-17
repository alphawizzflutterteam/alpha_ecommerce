import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/createQuery.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class OrderCancelled extends StatefulWidget {
  final String order_id;

  const OrderCancelled({super.key, required this.order_id});

  @override
  State<OrderCancelled> createState() => _OrderCancelledState();
}

class _OrderCancelledState extends State<OrderCancelled> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late OrderViewModel detailProvider;
  @override
  void initState() {
    super.initState();
    detailProvider = Provider.of<OrderViewModel>(context, listen: false);
    detailProvider.getOrderDetail(context, widget.order_id, true);
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
    var detailProvider = Provider.of<OrderViewModel>(context);
    return Stack(
      children: [
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
                child: const Stack(
                  children: [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: 'Order Detail',
                    )
                  ],
                ),
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
                                      "Order ID - ${detailProvider.detail.orderId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                    ),
                                    Text(
                                      "SOLD BY : ${detailProvider.detail.seller!.name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ProductListBuilder(
                                productList: detailProvider.detail.products),
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
                                      "Payment Method - ${detailProvider.detail.payment_method ?? ""}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                    ),
                                    Text(
                                      "Payment Status : ${detailProvider.detail.paymentStatus}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            for (int i = 0;
                                i <
                                    detailProvider
                                        .detail.orderStatusHistory.length;
                                i++)
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.check_circle,
                                            color: detailProvider
                                                    .detail
                                                    .orderStatusHistory[i]
                                                    .status!
                                                    .toLowerCase()
                                                    .contains("can")
                                                ? Colors.red
                                                : detailProvider
                                                        .detail
                                                        .orderStatusHistory[i]
                                                        .status!
                                                        .toLowerCase()
                                                        .contains("pend")
                                                    ? Colors.orange
                                                    : colors.buttonColor),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              detailProvider
                                                  .detail
                                                  .orderStatusHistory[i]
                                                  .status!,
                                              //  "Ordered Saturday, 6 Oct",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                            ),
                                            Text(
                                                convertTimestampToFormattedDate(
                                                    detailProvider
                                                        .detail
                                                        .orderStatusHistory[i]
                                                        .updatedAt
                                                        .toString())),
                                          ],
                                        )
                                      ],
                                    ),
                                    i ==
                                            detailProvider.detail
                                                    .orderStatusHistory.length -
                                                1
                                        ? Container()
                                        : Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 50,
                                            child: const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1.2,
                                              indent: 2,
                                              endIndent: 2,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            const Divider(
                              color: colors.greyText,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateQueryScreen(
                                        orderId: detailProvider.detail.orderId
                                            .toString()),
                                  )),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Need help?",
                                  style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Divider(color: Colors.grey),
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
