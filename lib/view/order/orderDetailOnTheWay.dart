import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';
import '../widget_common/common_radioButton.dart';
import 'cancelOrderPopup.dart';

class OrderDetailOnTheWay extends StatefulWidget {
  final String order_id;

  const OrderDetailOnTheWay({super.key, required this.order_id});

  @override
  State<OrderDetailOnTheWay> createState() => _OrderDetailOnTheWayState();
}

class _OrderDetailOnTheWayState extends State<OrderDetailOnTheWay> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<TextDto> orderList = [];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", ""),
  ];

  List<TextDto> outOfDeliveryList = [];

  List<TextDto> deliveredList = [];

  late OrderViewModel detailProvider;
  @override
  void initState() {
    super.initState();
    detailProvider = Provider.of<OrderViewModel>(context, listen: false);
    detailProvider.getOrderDetail(context, widget.order_id);
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  InternalDetailPageHeader(
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
                                "Order ID - ${detailProvider.detail.orderId}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "SOLD BY : ${detailProvider.detail.seller!.name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ProductListBuilder(
                          productList: detailProvider.detail.products),
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
                      //                   fontSize: 20,
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
                      //                 fontSize: 20,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "Price Detail",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "MRP (4 items)",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    detailProvider.detail.orderAmount
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delivery free",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    detailProvider.detail.deliveryCharge
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    detailProvider.detail.discountAmount
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: colors.greyText,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    detailProvider.detail.subtotal.toString(),
                                    style: TextStyle(
                                        color: colors.buttonColor,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: colors.greyText,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Shipping address",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                detailProvider.detail.shippingAddress!.address
                                    .toString(),
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                detailProvider
                                    .detail.shippingAddress!.contactPersonName
                                    .toString(),
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                detailProvider.detail.shippingAddress!.city
                                    .toString(),
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                detailProvider.detail.shippingAddress!.zip
                                    .toString(),
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Phone - ${detailProvider.detail.shippingAddress!.phone.toString()}",
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 5,
                        color: colors.greyText,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Arriving Wednesday",
                              style: TextStyle(
                                  color: colors.buttonColor, fontSize: 25),
                            ),
                            const SizedBox(height: 20),
                            OrderTracker(
                              status: Status.order,
                              activeColor: Colors.orange,
                              inActiveColor: Colors.grey[300],
                              orderTitleAndDateList: orderList,
                              shippedTitleAndDateList: shippedList,
                              outOfDeliveryTitleAndDateList: outOfDeliveryList,
                              deliveredTitleAndDateList: deliveredList,
                              headingTitleStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              headingDateTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              subTitleTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              subDateTextStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "Recommended Product",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 240,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    gradient: LinearGradient(
                                      colors: [
                                        colors.boxGradient1.withOpacity(1),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    border:
                                        Border.all(color: colors.boxBorder)),
                                width: MediaQuery.of(context).size.width * 0.42,
                                height: 200,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          Images.powder,
                                          height: 120,
                                        ),
                                      ),
                                      const Text(
                                        "25% Off",
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 12),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Oats Fitness",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const SizedBox(height: 5),
                                      const Row(
                                        children: [
                                          Text(
                                            "\$200",
                                            style: TextStyle(
                                              color: colors.lightTextColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "\$120.00",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  color: colors.textFieldBG,
                  child: Center(
                    child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CommonButton(
                          text: "CANCEL ORDER",
                          fontSize: 14,
                          onClick: () {
                            showCancelDialog();
                          },
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> showCancelDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: CancelOrderDialogWidget(
              order_id: widget.order_id,
            ));
      },
    );
  }
}

class CancelOrderDialogWidget extends StatefulWidget {
  final String order_id;

  const CancelOrderDialogWidget({super.key, required this.order_id});

  @override
  State<CancelOrderDialogWidget> createState() =>
      _CancelOrderDialogWidgetState();
}

class _CancelOrderDialogWidgetState extends State<CancelOrderDialogWidget> {
  List<String> reasons = [
    'Changed My Mind',
    'Found a Better Deal',
    'Delay in Delivery',
    'No longer Need the item',
    'Technical Issues',
    'Personal Emergency'
  ];

  String selectedReason = 'Changed My Mind';
  void handleOptionChange(String value) {
    setState(() {
      selectedReason = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83 * reasons.length.toDouble(),
      width: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors.overlayBG,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Cancel order reason',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 59 * reasons.length.toDouble(),
            child: Theme(
              data: ThemeData(unselectedWidgetColor: colors.greyText),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reasons.length,
                itemBuilder: (context, i) {
                  return CommonRadioTile(
                      options: selectedReason,
                      name: reasons[i],
                      onChanged: handleOptionChange);
                },
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colors.buttonColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Routes.navigateToPreviousScreen(context);
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        content: CancelOrderPopup(
                          order_id: widget.order_id,
                          reason: selectedReason,
                        ));
                  },
                );
              },
              child: const Text('DONE'),
            ),
          ),
        ],
      ),
    );
  }
}
