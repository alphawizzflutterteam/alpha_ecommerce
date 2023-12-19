import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
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
                                "Order ID - ${detailProvider.detail.orderId}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "SOLD BY : ${detailProvider.detail.seller!.name}",
                                style: TextStyle(
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
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.check_circle, color: Colors.red),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ordered Saturday, 6 Oct",
                                    style: TextStyle(color: colors.textColor)),
                                Text("Changed my mind",
                                    style: TextStyle(
                                        color: colors.lightTextColor,
                                        fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      )
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
