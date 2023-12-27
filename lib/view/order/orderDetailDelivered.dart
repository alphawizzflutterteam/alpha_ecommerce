import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/view/order/returnOrderPopup.dart';
import 'package:alpha_ecommerce_18oct/view/order/writeReviewPopup.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
import '../widget_common/toast_message.dart';

class OrderDetailDelivered extends StatefulWidget {
  final String order_id;

  const OrderDetailDelivered({super.key, required this.order_id});

  @override
  State<OrderDetailDelivered> createState() => _OrderDetailDeliveredState();
}

class _OrderDetailDeliveredState extends State<OrderDetailDelivered> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double rating = 4;
  late OrderViewModel detailProvider;

  List<TextDto> orderList = [];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", ""),
  ];

  List<TextDto> outOfDeliveryList = [];

  List<TextDto> deliveredList = [];

  @override
  void initState() {
    super.initState();
    print(widget.order_id);
    detailProvider = Provider.of<OrderViewModel>(context, listen: false);
    detailProvider.getOrderDetail(context, widget.order_id);
  }

  @override
  Widget build(BuildContext context) {
    detailProvider = Provider.of<OrderViewModel>(context);
    return detailProvider.isLoading
        ? appLoader()
        : Stack(
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
                          InternalDetailPageHeader(
                            text: 'Order Detail',
                          )
                        ],
                      ),
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
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "SOLD BY : ${detailProvider.detail.seller?.name}",
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ProductListBuilder(
                                productList: detailProvider.detail.products),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      "Price Detail",
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
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
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          detailProvider.detail.orderAmount
                                              .toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12),
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
                                          "Delivery free",
                                          style: TextStyle(
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          detailProvider.detail.deliveryCharge
                                              .toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12),
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
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          detailProvider.detail.discountAmount
                                              .toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12),
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
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          detailProvider.detail.subtotal
                                              .toString(),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              color: colors.textColor.withOpacity(0.2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.file_present_outlined,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Download Invoice",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showToastMessage("Invoice Downloaded");
                                    },
                                    child: Icon(
                                      Icons.download_for_offline_sharp,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
                                        Icon(Icons.location_on_outlined,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Shipping address",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider
                                          .detail.shippingAddress!.address
                                          .toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider.detail.shippingAddress!
                                          .contactPersonName
                                          .toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider
                                          .detail.shippingAddress!.city
                                          .toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider.detail.shippingAddress!.zip
                                          .toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      "Phone Number: ${detailProvider.detail.shippingAddress!.phone.toString()}",
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              color: colors.homeBGGradient1.withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBar.builder(
                                    initialRating: rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemSize: 30,
                                    itemPadding:
                                        const EdgeInsets.only(right: 5),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    onRatingUpdate: (newRating) {
                                      rating = newRating;
                                    },
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.edit_outlined,
                                        color: colors.homeBGGradient1,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          writeReview(
                                              context,
                                              detailProvider
                                                  .detail.products[0].productId
                                                  .toString());
                                        },
                                        child: const Text(
                                          "Write Review",
                                          style: TextStyle(
                                              color: colors.homeBGGradient1),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Arrived Wednesday",
                                    style: TextStyle(
                                        color: colors.buttonColor,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 20),
                                  OrderTracker(
                                    status: Status.delivered,
                                    activeColor: colors.buttonColor,
                                    inActiveColor: Colors.grey[300],
                                    orderTitleAndDateList: orderList,
                                    shippedTitleAndDateList: shippedList,
                                    outOfDeliveryTitleAndDateList:
                                        outOfDeliveryList,
                                    deliveredTitleAndDateList: deliveredList,
                                    headingTitleStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14),
                                    headingDateTextStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14),
                                    subTitleTextStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14),
                                    subDateTextStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14),
                                  ),
                                ],
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.textFieldBG
                            : Color.fromARGB(255, 227, 227, 227),
                        child: Center(
                          child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: CommonButton(
                                text: "RETURN ORDER",
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
            content: ReturnDialogWidget(
              orderId: detailProvider.detail.orderId.toString(),
              amount: detailProvider.detail.subtotal.toString(),
            ));
      },
    );
  }

  Future<void> writeReview(context, String product_id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: WriteReviewPopup(
              order_id: widget.order_id,
              product_id: product_id,
              rating: rating,
            ));
      },
    );
  }
}

class ReturnDialogWidget extends StatefulWidget {
  final String orderId;
  final String amount;

  const ReturnDialogWidget(
      {super.key, required this.orderId, required this.amount});

  @override
  State<ReturnDialogWidget> createState() => _ReturnDialogWidgetState();
}

class _ReturnDialogWidgetState extends State<ReturnDialogWidget> {
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
      width: 700,
      height: 80 * reasons.length.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.overlayBG
            : Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Return order reason',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 57 * reasons.length.toDouble(),
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
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
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
                // Routes.navigateToPreviousScreen(context);
                Navigator.pop(context);
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        insetPadding: EdgeInsets.all(50),
                        contentPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        content: ReturnOrderPopup(
                          order_id: widget.orderId,
                          refund_reason: selectedReason,
                          amount: widget.amount,
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
