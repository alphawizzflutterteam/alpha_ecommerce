import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
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
                    InternalDetailPageHeader(
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
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "SOLD BY : ${detailProvider.detail.seller!.name}",
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
                                          "MRP ",
                                          style: TextStyle(
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          detailProvider.detail.subtotal
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Delivery fee",
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
                                          "- " +
                                              detailProvider
                                                  .detail.discountAmount
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
                                          detailProvider.detail.orderAmount
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
                                  detailProvider.detail.expectedDeliveryDate ==
                                          ""
                                      ? Container()
                                      : Text(
                                          "Arriving " +
                                              detailProvider
                                                  .detail.expectedDeliveryDate!,
                                          style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 25),
                                        ),
                                  detailProvider.detail.expectedDeliveryDate ==
                                          ""
                                      ? Container()
                                      : const SizedBox(height: 20),
                                  for (int i = 0;
                                      i <
                                          detailProvider
                                              .detail.orderStatusHistory.length;
                                      i++)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                              .orderStatusHistory[
                                                                  i]
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
                                                    style: TextStyle(
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
                                                            .orderStatusHistory[
                                                                i]
                                                            .updatedAt
                                                            .toString()),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          i ==
                                                  detailProvider
                                                          .detail
                                                          .orderStatusHistory
                                                          .length -
                                                      1
                                              ? Container()
                                              : Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
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
                                  // OrderTracker(
                                  //   status: Status.order,
                                  //   activeColor: Colors.orange,
                                  //   inActiveColor: Colors.grey[300],
                                  //   orderTitleAndDateList: orderList,
                                  //   shippedTitleAndDateList: shippedList,
                                  //   outOfDeliveryTitleAndDateList:
                                  //       outOfDeliveryList,
                                  //   deliveredTitleAndDateList: deliveredList,
                                  //   headingTitleStyle: TextStyle(
                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: 14),
                                  //   headingDateTextStyle: TextStyle(
                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: 14),
                                  //   subTitleTextStyle: TextStyle(
                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: 14),
                                  //   subDateTextStyle: TextStyle(
                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: 14),
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                "Recommended Product",
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.325,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    detailProvider.RecommendedProducts.length,
                                itemBuilder: (context, index) => InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Routes.navigateToProductDetailPageScreen(
                                        context,
                                        detailProvider
                                            .RecommendedProducts[index].slug);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width *
                                        0.44,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        // image: DecorationImage(image: NetworkImage(model.images.first)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        gradient: LinearGradient(
                                          colors: Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark
                                              ? [
                                                  colors.boxGradient1
                                                      .withOpacity(1),
                                                  Colors.transparent,
                                                ]
                                              : [
                                                  Colors.grey.withOpacity(0.2),
                                                  Colors.transparent,
                                                ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        border: Border.all(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? colors.boxBorder
                                                    : colors.lightBorder)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.14,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.44,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                detailProvider
                                                    .RecommendedProducts[index]
                                                    .images
                                                    .first,
                                              ),
                                              fit: BoxFit.cover,
                                              onError:
                                                  (exception, stackTrace) =>
                                                      ErrorImageWidget(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0005),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${detailProvider.RecommendedProducts[index].discount}% Off",
                                                style: const TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              LikeButton(
                                                // onTap: (isLiked) {
                                                //   Map data = {'product_id': detailProvider.RecommendedProducts[index].id.toString()};
                                                //   if (isLiked) {
                                                //     return true;
                                                //     //homeProvider.removeFromWishlist(data, context);
                                                //   } else {
                                                //     return false;
                                                //     //  homeProvider.addToWishlist(data, context);
                                                //   }
                                                // },
                                                size: size_20,
                                                isLiked: detailProvider
                                                    .RecommendedProducts[index]
                                                    .isFavorite,
                                                circleColor: const CircleColor(
                                                    start: Colors.red,
                                                    end: Colors.red),
                                                bubblesColor:
                                                    const BubblesColor(
                                                  dotPrimaryColor: Colors.red,
                                                  dotSecondaryColor: Colors.red,
                                                ),
                                                likeBuilder: (bool isLiked) {
                                                  return Icon(
                                                    Icons.favorite,
                                                    color: isLiked
                                                        ? Colors.pink
                                                        : Colors.grey,
                                                    size: 20,
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Text(
                                            detailProvider
                                                .RecommendedProducts[index]
                                                .name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                detailProvider
                                                    .RecommendedProducts[index]
                                                    .unitPrice,
                                                style: const TextStyle(
                                                  color: Colors.cyan,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                detailProvider
                                                    .RecommendedProducts[index]
                                                    .purchasePrice,
                                                style: const TextStyle(
                                                  color: colors.lightTextColor,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              Map data;
                                              if (!detailProvider
                                                  .RecommendedProducts[index]
                                                  .isCart) {
                                                data = {
                                                  'id': detailProvider
                                                      .RecommendedProducts[
                                                          index]
                                                      .id
                                                      .toString(),
                                                  'quantity': "1",
                                                  'color': detailProvider
                                                          .RecommendedProducts[
                                                              index]
                                                          .colorImage
                                                          .isNotEmpty
                                                      ? "#" +
                                                          detailProvider
                                                              .RecommendedProducts[
                                                                  index]
                                                              .colorImage[0]
                                                              .color
                                                      : "",
                                                  'choice_2': detailProvider
                                                          .RecommendedProducts[
                                                              index]
                                                          .choiceOptions
                                                          .isNotEmpty
                                                      ? detailProvider
                                                          .RecommendedProducts[
                                                              index]
                                                          .choiceOptions[0]
                                                          .options[0]
                                                      : ""
                                                };
                                              } else {
                                                data = {
                                                  'key': detailProvider
                                                      .RecommendedProducts[
                                                          index]
                                                      .cart_id
                                                      .toString(),
                                                };
                                              }
                                              print(data);
                                              // detailProvider.RecommendedProducts[index].isCart
                                              //     ? homeProvider.removeFromCart(data, context)
                                              //     : homeProvider.addToCart(data, context);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  border: Border.all(
                                                      color: colors.boxBorder)),
                                              child: Text(
                                                detailProvider
                                                        .RecommendedProducts[
                                                            index]
                                                        .isCart
                                                    ? "Remove From Cart"
                                                    : "Add to Cart",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: size_12),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              detailProvider.isLoading
                  ? Container()
                  : Align(
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
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.overlayBG
            : Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Cancel order reason',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
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
                  return Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: RadioListTile(
                        title: Text(
                          reasons[i],
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 14,
                          ),
                          softWrap: false,
                        ),
                        activeColor: colors.buttonColor,
                        value: reasons[i],
                        groupValue: selectedReason,
                        onChanged: (value) {
                          handleOptionChange(value.toString());
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                      ),
                    ),
                  );

                  // CommonRadioTile(
                  //     options: selectedReason,
                  //     name: reasons[i],
                  //     color: Theme.of(context).brightness == Brightness.dark
                  //         ? Colors.black
                  //         : Colors.white,
                  //     onChanged: handleOptionChange);
                  // return RadioListTile(value: value, groupValue: opt, onChanged: (value) => handleOptionChange("hj"),);
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
