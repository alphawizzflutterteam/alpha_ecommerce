import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/view/order/returnOrderPopup.dart';
import 'package:alpha_ecommerce_18oct/view/order/writeReviewPopup.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/createQuery.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
  double rating = 1;
  String comment = "";
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
    detailProvider.getOrderDetail(context, widget.order_id, true);
  }

  String convertTimestampToFormattedDate(String timestamp) {
    // Parse the timestamp string into a DateTime object
    print(timestamp);
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the DateTime object as "dd Month name yyyy"
    String formattedDate = DateFormat('dd MMM yyyy, h:mm a').format(dateTime);

    return "(" + formattedDate + " )";
  }

  @override
  Widget build(BuildContext context) {
    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    ProfileModel user = ProfileModel.fromJson(model);
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
                                      "SOLD BY : ${detailProvider.detail.seller?.name}",
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Payment Method",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                        Text(
                                          "${detailProvider.detail.payment_method ?? ""}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Payment Status",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: Platform.isAndroid
                                                        ? size_10
                                                        : size_12,
                                                  ),
                                            ),
                                            Text(
                                              "${detailProvider.detail.paymentStatus}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: detailProvider
                                                                  .detail
                                                                  .paymentStatus!
                                                                  .toLowerCase() ==
                                                              "paid"
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? size_12
                                                              : size_14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      "Price Detail",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: colors.greyText,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                        Text(
                                          detailProvider
                                              .detail.products.first.price
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
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
                                        Text(
                                          "Quantity",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: colors.greyText,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                        Text(
                                          detailProvider
                                              .detail.products.first.qty
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
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
                                        Text(
                                          "Delivery fee",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: colors.greyText,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                        Text(
                                          detailProvider.detail.deliveryCharge
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: colors.greyText,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                        Text(
                                          "- " +
                                              detailProvider
                                                  .detail.discountAmount
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
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
                                        Text(
                                          "Tax",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: colors.greyText,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
                                        ),
                                        Text(
                                          detailProvider
                                              .detail.products.first.tax
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: Platform.isAndroid
                                                    ? size_10
                                                    : size_12,
                                              ),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: Platform.isAndroid
                                                      ? size_12
                                                      : size_14),
                                        ),
                                        Text(
                                          detailProvider.detail.orderAmount
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: colors.buttonColor,
                                                  fontSize: Platform.isAndroid
                                                      ? size_12
                                                      : size_14),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () async {
                                      final Uri url = Uri.parse(
                                          AppUrl.inVoiceUrl + widget.order_id);
                                      if (!await launchUrl(url,
                                          mode:
                                              LaunchMode.externalApplication)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: Platform.isAndroid
                                                      ? size_12
                                                      : size_14),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider.detail.shippingAddress!
                                          .contactPersonName
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider
                                          .detail.shippingAddress!.city
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      detailProvider.detail.shippingAddress!.zip
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      "Phone Number: ${detailProvider.detail.shippingAddress!.phone.toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            detailProvider.detail.orderReviews.isEmpty
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    color:
                                        colors.homeBGGradient1.withOpacity(0.3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          updateOnDrag: false,
                                          itemCount: 5,
                                          itemSize: 30,
                                          itemPadding:
                                              const EdgeInsets.only(right: 5),
                                          itemBuilder: (context, _) =>
                                              const Icon(
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
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                writeReview(
                                                    context,
                                                    detailProvider.detail
                                                        .products[0].productId
                                                        .toString());
                                              },
                                              child: Text(
                                                "Write Review",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: colors
                                                            .homeBGGradient1),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Theme.of(context).brightness !=
                                                Brightness.dark
                                            ? const Color.fromARGB(
                                                255, 231, 231, 231)
                                            : colors.darkBG,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              65,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    220,
                                                                child: Text(
                                                                  "My Review",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleSmall!
                                                                      .copyWith(
                                                                        color: Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star,
                                                                        size:
                                                                            size_18,
                                                                        color: Colors
                                                                            .orange,
                                                                      ),
                                                                      Text(
                                                                        detailProvider
                                                                            .detail
                                                                            .orderReviews[0]
                                                                            .rating
                                                                            .toString(),
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .titleSmall!
                                                                            .copyWith(
                                                                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        size_20,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          rating = detailProvider
                                                                              .detail
                                                                              .orderReviews[0]
                                                                              .rating!
                                                                              .toDouble();
                                                                          comment = detailProvider
                                                                              .detail
                                                                              .orderReviews[0]
                                                                              .comment!;
                                                                          writeReview(
                                                                              context,
                                                                              detailProvider.detail.products[0].productId.toString());
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color: Theme.of(context).brightness == Brightness.dark
                                                                              ? Colors.white
                                                                              : Colors.black,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          detailProvider.deleteReviewRequest(
                                                                              order_id: widget.order_id,
                                                                              context: context,
                                                                              id: widget.order_id);
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color: Theme.of(context).brightness == Brightness.dark
                                                                              ? Colors.white
                                                                              : Colors.black,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              70,
                                                          child: Text(
                                                            detailProvider
                                                                .detail
                                                                .orderReviews[0]
                                                                .comment!,
                                                            style:
                                                                Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall!
                                                                    .copyWith(
                                                                      color: Theme.of(context).brightness ==
                                                                              Brightness
                                                                                  .dark
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black,
                                                                    ),
                                                          ),
                                                        ),
                                                        detailProvider
                                                                .detail
                                                                .orderReviews[0]
                                                                .attachment
                                                                .isNotEmpty
                                                            ? Align(
                                                                alignment: Alignment
                                                                    .bottomRight,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              5.0),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return FullImageDialog(
                                                                            image:
                                                                                detailProvider.detail.orderReviews[0].attachment.first,
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      "View Attachment",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        // detailProvider
                                                        //         .detail
                                                        //         .orderReviews[0]
                                                        //         .attachment
                                                        //         .isNotEmpty
                                                        //     ? GestureDetector(
                                                        //         onTap: () {
                                                        //           showDialog(
                                                        //             context:
                                                        //                 context,
                                                        //             builder:
                                                        //                 (BuildContext
                                                        //                     context) {
                                                        //               return FullImageDialog(
                                                        //                 image: detailProvider
                                                        //                     .detail
                                                        //                     .orderReviews[0]
                                                        //                     .attachment
                                                        //                     .first,
                                                        //               );
                                                        //             },
                                                        //           );
                                                        //         },
                                                        //         child: Image
                                                        //             .network(
                                                        //           detailProvider
                                                        //               .detail
                                                        //               .orderReviews[
                                                        //                   0]
                                                        //               .attachment
                                                        //               .first,
                                                        //           fit: BoxFit
                                                        //               .cover,
                                                        //           height:
                                                        //               size_60,
                                                        //           width:
                                                        //               size_60,
                                                        //         ),
                                                        //       )
                                                        //     : Container()
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivered " +
                                        detailProvider
                                            .detail.expectedDeliveryDate!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: colors.buttonColor,
                                            fontSize: 25),
                                  ),
                                  const SizedBox(height: 0),
                                  detailProvider.detail.expectedDeliveryDate ==
                                          ""
                                      ? Container()
                                      : const SizedBox(height: 15),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                          ? Colors.orangeAccent
                                                          : detailProvider
                                                                  .detail
                                                                  .orderStatusHistory[
                                                                      i]
                                                                  .status!
                                                                  .toLowerCase()
                                                                  .contains(
                                                                      "confir")
                                                              ? Colors.orange
                                                              : detailProvider
                                                                      .detail
                                                                      .orderStatusHistory[
                                                                          i]
                                                                      .status!
                                                                      .toLowerCase()
                                                                      .contains(
                                                                          "pack")
                                                                  ? Colors
                                                                      .lightBlue
                                                                  : detailProvider
                                                                          .detail
                                                                          .orderStatusHistory[
                                                                              i]
                                                                          .status!
                                                                          .toLowerCase()
                                                                          .contains(
                                                                              "ship")
                                                                      ? Colors
                                                                          .lightGreen
                                                                      : detailProvider.detail.orderStatusHistory[i].status!.toLowerCase().contains("out for")
                                                                          ? Colors.greenAccent
                                                                          : colors.buttonColor),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                  Text(
                                                    " " +
                                                        convertTimestampToFormattedDate(
                                                            detailProvider
                                                                .detail
                                                                .orderStatusHistory[
                                                                    i]
                                                                .updatedAt
                                                                .toString()),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 10),
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
                                                  height: 40,
                                                  child: const VerticalDivider(
                                                    color: Colors.grey,
                                                    thickness: 1.6,
                                                    indent: 1,
                                                    endIndent: 1,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  //   OrderTracker(
                                  //   status: Status.delivered,
                                  //   activeColor: colors.buttonColor,
                                  //   inActiveColor: Colors.grey[300],
                                  //   orderTitleAndDateList: orderList,
                                  //   shippedTitleAndDateList: shippedList,
                                  //   outOfDeliveryTitleAndDateList:
                                  //       outOfDeliveryList,
                                  //   deliveredTitleAndDateList: deliveredList,
                                  //   headingTitlestyle: Theme.of(context)
                                  // .textTheme
                                  // .titleSmall!
                                  // .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_14 : size_14),
                                  // //   headingDateTextstyle: Theme.of(context)
                                  //                   .textTheme
                                  //                   .titleSmall!
                                  //                   .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_14 : size_14),
                                  //   subTitleTextstyle: Theme.of(context)
                                  // .textTheme
                                  // .titleSmall!
                                  // .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_14 : size_14),
                                  //   subDateTextstyle: Theme.of(context)
                                  // .textTheme
                                  // .titleSmall!
                                  // .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_14 : size_14),
                                  // ),
                                  const Divider(
                                    color: colors.greyText,
                                  ),

                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CreateQueryScreen(
                                                  orderId: detailProvider
                                                      .detail.orderId
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
                                colorsText: Colors.white,
                                fontSize:
                                    Platform.isAndroid ? size_12 : size_14,
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
      barrierDismissible: true,
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
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: WriteReviewPopup(
              order_id: widget.order_id,
              product_id: product_id,
              rating: rating,
              comment: comment,
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
      width: MediaQuery.of(context).size.width,
      height: 82 * reasons.length.toDouble(),
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
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: Platform.isAndroid ? size_18 : size_20,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              height: 57 * reasons.length.toDouble(),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    for (int i = 0; i < reasons.length; i++)
                      RadioListTile(
                        title: Text(
                          reasons[i],
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize:
                                        Platform.isAndroid ? size_12 : size_14,
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
                  ],
                ),
              )

              // Theme(
              //   data: ThemeData(unselectedWidgetColor: Colors.white),
              //   child: ListView.builder(
              //     padding: EdgeInsets.zero,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: reasons.length,
              //     itemBuilder: (context, i) {
              //       return
              //       Material(
              //         color: Colors.transparent,
              //         child: RadioListTile(
              //           title: Text(
              //             reasons[i],
              //             style: Theme.of(context).textTheme.titleSmall!.copyWith(
              //                   color: Theme.of(context).brightness ==
              //                           Brightness.dark
              //                       ? Colors.white
              //                       : Colors.black,
              //                   fontSize: Platform.isAndroid ? size_14 : size_14,
              //                 ),
              //             softWrap: false,
              //           ),
              //           activeColor: colors.buttonColor,
              //           value: reasons[i],
              //           groupValue: selectedReason,
              //           onChanged: (value) {
              //             handleOptionChange(value.toString());
              //           },
              //           contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              //         ),
              //       );

              //       // CommonRadioTile(
              //       //     options: selectedReason,
              //       //     name: reasons[i],
              //       //     color: Theme.of(context).brightness == Brightness.dark
              //       //         ? Colors.black
              //       //         : Colors.white,
              //       //     onChanged: handleOptionChange);
              //       // return RadioListTile(value: value, groupValue: opt, onChanged: (value) => handleOptionChange("hj"),);
              //   },
              //  ),
              //),
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

class FullImageDialog extends StatefulWidget {
  final String image;

  const FullImageDialog({super.key, required this.image});
  @override
  State<FullImageDialog> createState() => _FullImageDialogState();
}

class _FullImageDialogState extends State<FullImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.image, // Replace with your image URL
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
