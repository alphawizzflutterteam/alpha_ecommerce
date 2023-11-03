import 'package:alpha_ecommerce_18oct/screen/order/filter.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../helper/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> orderItems = [
    {
      'image': Images.dettol,
      'text': 'Dettol refresh long lasting',
      'subText': 'Lorem Ipsum is simply dummy',
      'status': 'On the way',
    },
    {
      'image': Images.oreo,
      'text': 'Oreo family pack',
      'subText': 'Lorem Ipsum is simply dummy',
      'status': 'Order Cancelled',
    },
    {
      'image': Images.biscuit,
      'text': 'all rounder(chatpata...)',
      'subText': 'Lorem Ipsum is simply dummy',
      'status': 'Delivered',
    },
    {
      'image': Images.powder,
      'text': 'Oreo family pack',
      'subText': 'Lorem Ipsum is simply dummy',
      'status': 'Delivered',
    },
    {
      'image': Images.dettol,
      'text': 'Dettol refresh long lasting',
      'subText': 'Lorem Ipsum is simply dummy',
      'status': 'Returned',
    },
  ];

  Color getTextColor(String status) {
    switch (status) {
      case 'On the way':
        return colors.onTheWayDark;
      case 'Order Cancelled':
        return colors.orderCancelledDark;
      case 'Delivered':
        return colors.deliveredDark;
      case 'Returned':
        return colors.returnedDark;
      default:
        return Colors.transparent;
    }
  }

  Color getBackgroundColor(String status) {
    switch (status) {
      case 'On the way':
        return colors.onTheWayLight;
      case 'Order Cancelled':
        return colors.orderCancelledLight;
      case 'Delivered':
        return colors.deliveredLight;
      case 'Returned':
        return colors.returnedLight;
      default:
        return Colors.transparent;
    }
  }

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
                  InternalPageHeader(
                    text: "My Orders",
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  fillColor: colors.textFieldBG,
                                  filled: true,
                                  hintText: 'Search',
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  color: colors.textFieldBG,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: InkWell(
                                onTap: () {
                                  filter(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.filter_list_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (int i = 0; i < 5; i++)
                        InkWell(
                          onTap: () {
                            Routes.navigateToOrderDetailScreen(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0x14E9E9E9),
                                width: 2,
                              ),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    orderItems[i]['image'],
                                    width: 50,
                                    height: 170,
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          orderItems[i]['text'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          orderItems[i]['subText'],
                                          style: const TextStyle(
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(3)),
                                          border: Border.all(
                                            color: const Color(0x14E9E9E9),
                                            width: 2,
                                          ),
                                          color: getBackgroundColor(
                                              orderItems[i]['status']),
                                        ),
                                        child: Text(
                                          orderItems[i]['status'],
                                          style: TextStyle(
                                              color: getTextColor(
                                                  orderItems[i]['status']),
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
