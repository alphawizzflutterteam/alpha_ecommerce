import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/order/productListBuilder.dart';
import 'package:alpha_ecommerce_18oct/view/order/returnOrderPopup.dart';
import 'package:alpha_ecommerce_18oct/view/order/writeReviewPopup.dart';
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
                                      "Status : ${detailProvider.detail.paymentStatus}",
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
                                          "MRP (1 item)",
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
                                          detailProvider.detail.orderAmount
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
                                          detailProvider.detail.discountAmount
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
                                          detailProvider.detail.subtotal
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
                                          'https://alpha-ecom.developmentalphawizz.com/generate-invoice/' +
                                              widget.order_id);
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
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width:
                                                        size_40, // Set your desired width
                                                    height:
                                                        size_40, // Set your desired height
                                                    child: ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            user.data[0].image,
                                                        fit: BoxFit.contain,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            ClipOval(
                                                          child: Image.asset(
                                                            Images
                                                                .defaultProfile,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          user.data[0].fName,
                                                          style:
                                                              Theme.of(context)
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
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              150,
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
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: size_18,
                                                    color: Colors.orange,
                                                  ),
                                                  Text(
                                                    detailProvider.detail
                                                        .orderReviews[0].rating
                                                        .toString(),
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
                                                        ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
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
                                  Text(
                                    "Arrived " +
                                        detailProvider
                                            .detail.expectedDeliveryDate!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: colors.buttonColor,
                                            fontSize: 25),
                                  ),
                                  const SizedBox(height: 20),
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
                                  //       fontSize: Platform.isAndroid ? size_12 : size_14),
                                  // //   headingDateTextstyle: Theme.of(context)
                                  //                   .textTheme
                                  //                   .titleSmall!
                                  //                   .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_12 : size_14),
                                  //   subTitleTextstyle: Theme.of(context)
                                  // .textTheme
                                  // .titleSmall!
                                  // .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_12 : size_14),
                                  //   subDateTextstyle: Theme.of(context)
                                  // .textTheme
                                  // .titleSmall!
                                  // .copyWith(

                                  //       color: Theme.of(context).brightness ==
                                  //               Brightness.dark
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontSize: Platform.isAndroid ? size_12 : size_14),
                                  // ),
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
              //                   fontSize: Platform.isAndroid ? size_12 : size_14,
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
