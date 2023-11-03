import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../helper/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> reasons = [
    'Changed My Mind',
    'Found a Better Deal',
    'Delay in Delivery',
    'No longer Need the item',
    'Technical Issues',
    'Personal Emergency'
  ];

  int initial = 0;

  List<TextDto> orderList = [];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", ""),
  ];

  List<TextDto> outOfDeliveryList = [];

  List<TextDto> deliveredList = [];

  @override
  Widget build(BuildContext context) {
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
              Stack(
                children: const [
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
                            children: const [
                              Text(
                                "Order ID - OID5266245375",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "SOLD BY : SELLER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 75,
                                  height: 75,
                                  decoration: const BoxDecoration(
                                      color: colors.boxBorder,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Image.asset(
                                    Images.dettol,
                                    width: 50,
                                    height: 50,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.59,
                                    child: const Text(
                                      "Dettol Refresh Long Lasting",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "\$120.00",
                                    style: TextStyle(
                                      color: colors.buttonColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "MRP (4 items)",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    "\$480.00",
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
                                children: const [
                                  Text(
                                    "Delivery free",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    "\$20.00",
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
                                children: const [
                                  Text(
                                    "Discount",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    "\$80.00",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 5,
                              color: colors.greyText,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    "\$600.00",
                                    style: TextStyle(
                                        color: colors.buttonColor,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: const [
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
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "2118 Thorridge Cir. Synmouse, Connection 35624",
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Naman Pawar",
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Indore",
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "MP - 452010",
                                style: TextStyle(
                                    color: colors.lightTextColor, fontSize: 14),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Phone - 4523671234",
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
                        height: 230,
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
                                      Row(
                                        children: const [
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
                          onClick: () {},
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

  // Future<void> showCancelDialog(context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.transparent,
  //         content: Container(
  //           height: 450,
  //           width: 700,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15.0),
  //             color: colors.overlayBG,
  //           ),
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             children: [
  //               for (int i = 0; i < reasons.length; i++)
  //                 ListTile(
  //                   title: Text(reasons[i]),
  //                   leading: Radio(
  //                     value: i,
  //                     groupValue: initial,
  //                     onChanged: (int? value) {
  //                       setState(() {
  //                         initial = value!;
  //                       });
  //                     },
  //                   ),
  //                 ),
  //               // Column(
  //               //   crossAxisAlignment: CrossAxisAlignment.center,
  //               //   children: [
  //               //     const Text(
  //               //       'Cancel order reason',
  //               //       style: TextStyle(
  //               //         color: Colors.white,
  //               //         fontSize: 20.0,
  //               //       ),
  //               //     ),
  //               //     const SizedBox(height: 20),
  //               //     for (int i = 0; i < reasons.length; i++)
  //               //       Row(
  //               //         children: [
  //               //           Theme(
  //               //             data: ThemeData(
  //               //                 unselectedWidgetColor: const colors.greyText),
  //               //             child: Radio<int>(
  //               //               value: i,
  //               //               groupValue: selectedReason,
  //               //               onChanged: (int? value) {
  //               //                 setState(() {
  //               //                   selectedReason = value;
  //               //                 });
  //               //               },
  //               //               focusColor: colors.buttonColor,
  //               //               hoverColor: colors.buttonColor,
  //               //               activeColor: colors.buttonColor,
  //               //             ),
  //               //           ),
  //               //           Text(
  //               //             reasons[i],
  //               //             style: TextStyle(
  //               //                 color: Colors.white.withOpacity(0.8), fontSize: 14),
  //               //           ),
  //               //         ],
  //               //       ),
  //               //     SizedBox(
  //               //       width: 200,
  //               //       child: ElevatedButton(
  //               //         style: ElevatedButton.styleFrom(
  //               //           primary: colors.buttonColor,
  //               //           onPrimary: Colors.white,
  //               //           shape: RoundedRectangleBorder(
  //               //             borderRadius: BorderRadius.circular(10.0),
  //               //           ),
  //               //         ),
  //               //         onPressed: () {
  //               //           Routes.navigateToPreviousScreen(context);
  //               //         },
  //               //         child: const Text('DONE'),
  //               //       ),
  //               //     ),
  //               //   ],
  //               // ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
