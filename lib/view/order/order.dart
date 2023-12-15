// ignore_for_file: unnecessary_const

import 'package:alpha_ecommerce_18oct/view/order/filter.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
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
    switch (status.toLowerCase()) {
      case 'processing':
        return colors.onTheWayDark;
      case 'canceled':
        return colors.orderCancelledDark;
      case 'delivered':
        return colors.deliveredDark;
      case 'pending':
        return colors.returnedDark;
      default:
        return Colors.white;
    }
  }

  Color getBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return colors.onTheWayLight;
      case 'canceled':
        return colors.orderCancelledLight;
      case 'delivered':
        return colors.deliveredLight;
      case 'pending':
        return colors.returnedLight;
      default:
        return Colors.transparent;
    }
  }

  late OrderViewModel orderProvider;
  @override
  void initState() {
    super.initState();
    orderProvider = Provider.of<OrderViewModel>(context, listen: false);
    orderProvider.getOrderList(context);
  }

  @override
  Widget build(BuildContext context) {
    orderProvider = Provider.of<OrderViewModel>(context);

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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.15 *
                            orderProvider.orderList.length.toDouble(),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: orderProvider.orderList.length,
                          itemBuilder: (context, i) {
                            var data = orderProvider.orderList[i];
                            return InkWell(
                              onTap: () {
                                print(data.orderStatus!.toLowerCase());
                                if (data.orderStatus!.toLowerCase() ==
                                    "canceled") {
                                  Routes.navigateToOrderCancelledScreen(
                                      context);
                                } else if (data.orderStatus!.toLowerCase() ==
                                    "delivered") {
                                  Routes
                                      .navigateToOrderDetailDeliveredDetailScreen(
                                          context);
                                } else {
                                  print("here");

                                  Routes.navigateToOrderOnTheWayDetailScreen(
                                      context);
                                }
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        data.product!.images!.first,
                                        width: 80,
                                        height: 200,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              data.product!.name!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              data.product!.shop!.name!,
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(3)),
                                              border: Border.all(
                                                color: const Color(0x14E9E9E9),
                                                width: 2,
                                              ),
                                              color: getBackgroundColor(
                                                  data.deliveryStatus!),
                                            ),
                                            child: Text(
                                              data.deliveryStatus!,
                                              style: TextStyle(
                                                  color: getTextColor(
                                                      data.deliveryStatus!),
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
