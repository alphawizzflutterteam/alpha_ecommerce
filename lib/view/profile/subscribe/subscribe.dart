import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_header.dart';
import '../common_header.dart';

class Subscribe extends StatefulWidget {
  final bool? signUp;
  const Subscribe({Key? key, this.signUp}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  late bool showHeader;
  late ProfileViewModel subscriptionProvider;

  List<Color> getCardGradients({required String type}) {
    switch (type) {
      case "Premium":
        return [colors.lightGrey.withOpacity(0.5), Colors.transparent];
      case "Gold":
        return [Colors.amber.withOpacity(0.7), Colors.transparent];
      case "Basic":
        return [colors.buttonColor, Colors.transparent];
      default:
        return [Colors.white30, Colors.transparent];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showHeader = widget.signUp ?? false;
    subscriptionProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    subscriptionProvider.getSubscriptionData(context);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isYearlyTabSelected = true;

  @override
  Widget build(BuildContext context) {
    subscriptionProvider = Provider.of<ProfileViewModel>(context);
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
          body: subscriptionProvider.isLoading
              ? appLoader()
              : Column(
                  children: [
                    showHeader
                        ? Container(
                            padding: const EdgeInsets.only(top: 40, right: 20),
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Routes.navigateToDashboardScreen(context, 2);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 30,
                                )),
                          )
                        : Container(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.transparent
                                    : colors.buttonColor,
                            child: const Stack(
                              children: [
                                ProfileHeader(),
                                InternalPageHeader(
                                  text: "Alpha Subscription",
                                )
                              ],
                            ),
                          ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            showHeader
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Review your detail",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                                color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Your Plans & benefits",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: Platform.isAndroid
                                                    ? size_14
                                                    : size_16,
                                                color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 20,
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTabButton("Yearly", isYearlyTabSelected,
                                    () {
                                  setState(() {
                                    isYearlyTabSelected = true;
                                  });
                                }),
                                buildTabButton("Monthly", !isYearlyTabSelected,
                                    () {
                                  setState(() {
                                    isYearlyTabSelected = false;
                                  });
                                }),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height *
                                          .735),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: isYearlyTabSelected
                                    ? subscriptionProvider
                                        .subscriptionList[0].yearly.length
                                    : subscriptionProvider
                                        .subscriptionList[0].monthly.length,
                                separatorBuilder: (context, _) =>
                                    SizedBox(height: 20),
                                itemBuilder: (context, index) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  decoration: BoxDecoration(
                                      // color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                          colors: getCardGradients(
                                              type: isYearlyTabSelected
                                                  ? subscriptionProvider
                                                      .subscriptionList[0]
                                                      .yearly[index]
                                                      .title
                                                      .toString()
                                                  : subscriptionProvider
                                                      .subscriptionList[0]
                                                      .monthly[index]
                                                      .title
                                                      .toString()),
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                child: Text(
                                                  isYearlyTabSelected
                                                      ? subscriptionProvider
                                                          .subscriptionList[0]
                                                          .yearly[index]
                                                          .title
                                                          .toString()
                                                      : subscriptionProvider
                                                          .subscriptionList[0]
                                                          .monthly[index]
                                                          .title
                                                          .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        fontSize: Platform
                                                                .isAndroid
                                                            ? size_18
                                                            : size_20, // Adjust the size as needed
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors
                                                                .black, // Customize the color
                                                      ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '', // The dollar sign
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        fontSize:
                                                            18, // Adjust the size as needed
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors
                                                                .black, // Customize the color
                                                      ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: isYearlyTabSelected
                                                          ? subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .yearly[index]
                                                              .priceWithCurrency
                                                              .toString()
                                                          : subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .monthly[index]
                                                              .priceWithCurrency
                                                              .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                            fontSize:
                                                                24, // Adjust the size as needed
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors
                                                                    .black, //Customize the color
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: isYearlyTabSelected
                                                          ? "/ year"
                                                          : ' / month',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                            fontSize:
                                                                18, // Adjust the size as needed
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors
                                                                    .black, // Customize the color
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          isYearlyTabSelected
                                              ? subscriptionProvider
                                                      .subscriptionList[0]
                                                      .yearly[index]
                                                      .isPurchased
                                                  ? Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_outline_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                              "CURRENT PLAN",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      fontSize: Platform
                                                                              .isAndroid
                                                                          ? size_10
                                                                          : size_12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          isYearlyTabSelected
                                                              ? subscriptionProvider
                                                                  .subscriptionList[
                                                                      0]
                                                                  .yearly[index]
                                                                  .createdAt
                                                                  .toString()
                                                              : subscriptionProvider
                                                                  .subscriptionList[
                                                                      0]
                                                                  .monthly[
                                                                      index]
                                                                  .createdAt
                                                                  .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                    fontSize: Platform
                                                                            .isAndroid
                                                                        ? size_10
                                                                        : size_12,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        )
                                                      ],
                                                    )
                                                  : UpgradePlanWidget(
                                                      showHeader: showHeader,
                                                      planId: isYearlyTabSelected
                                                          ? subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .yearly[index]
                                                              .id
                                                              .toString()
                                                          : subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .monthly[index]
                                                              .id
                                                              .toString(),
                                                      price: isYearlyTabSelected
                                                          ? subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .yearly[index]
                                                              .price
                                                              .toString()
                                                          : subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .monthly[index]
                                                              .price
                                                              .toString(),
                                                    )
                                              : subscriptionProvider
                                                      .subscriptionList[0]
                                                      .monthly[index]
                                                      .isPurchased
                                                  ? Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_outline_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                              "CURRENT PLAN",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      fontSize: Platform
                                                                              .isAndroid
                                                                          ? size_10
                                                                          : size_12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          isYearlyTabSelected
                                                              ? subscriptionProvider
                                                                  .subscriptionList[
                                                                      0]
                                                                  .yearly[index]
                                                                  .createdAt
                                                                  .toString()
                                                              : subscriptionProvider
                                                                  .subscriptionList[
                                                                      0]
                                                                  .monthly[
                                                                      index]
                                                                  .createdAt
                                                                  .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                    fontSize: Platform
                                                                            .isAndroid
                                                                        ? size_10
                                                                        : size_12,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        )
                                                      ],
                                                    )
                                                  : UpgradePlanWidget(
                                                      showHeader: showHeader,
                                                      planId: isYearlyTabSelected
                                                          ? subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .yearly[index]
                                                              .id
                                                              .toString()
                                                          : subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .monthly[index]
                                                              .id
                                                              .toString(),
                                                      price: isYearlyTabSelected
                                                          ? subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .yearly[index]
                                                              .price
                                                              .toString()
                                                          : subscriptionProvider
                                                              .subscriptionList[
                                                                  0]
                                                              .monthly[index]
                                                              .price
                                                              .toString(),
                                                    ),
                                        ],
                                      ),
                                      Divider(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.lightGrey
                                            : Colors.white.withOpacity(0.5),
                                      ),
                                      Html(
                                        data: isYearlyTabSelected
                                            ? subscriptionProvider
                                                .subscriptionList[0]
                                                .yearly[index]
                                                .description
                                            : subscriptionProvider
                                                .subscriptionList[0]
                                                .monthly[index]
                                                .description,
                                        style: {
                                          "body": Style(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        },
                                      )
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

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    Color textColor = isSelected ? Colors.black : Colors.white;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: isSelected ? colors.buttonColor : Colors.transparent,
            onPrimary: textColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: Platform.isAndroid ? size_16 : size_18,
              color: Colors.white),
        ),
      ),
    );
  }
}

class UpgradePlanWidget extends StatelessWidget {
  final String planId;
  final String price;
  const UpgradePlanWidget({
    super.key,
    required this.showHeader,
    required this.planId,
    required this.price,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: () {
          Routes.navigateToPaymentScreen(
              context, planId, "", price, true, "subscription");
        },
        child: Text(
          showHeader ? 'SUBSCRIBE NOW' : 'UPGRADE PLAN',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: Platform.isAndroid ? size_10 : size_12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//  if (isYearlyTabSelected)
//                                 // Yearly content
//                                 Column(
//                                   children: [

//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     //   Container(
//                                     //     height: 250,
//                                     //     decoration: BoxDecoration(
//                                     //       gradient: LinearGradient(
//                                     //         colors: [
//                                     //           colors.subscribeYellow.withOpacity(0.5),
//                                     //           colors.subscribeYellow.withOpacity(0.1),
//                                     //         ],
//                                     //         begin: Alignment.centerRight,
//                                     //         end: Alignment.centerLeft,
//                                     //       ),
//                                     //       borderRadius: BorderRadius.circular(10),
//                                     //       border: Border.all(
//                                     //         color: Colors
//                                     //             .white, // Set the border color here
//                                     //       ),
//                                     //     ),
//                                     //     child: Row(
//                                     //       mainAxisAlignment: MainAxisAlignment.start,
//                                     //       children: [
//                                     //         SizedBox(
//                                     //           child: Column(
//                                     //             crossAxisAlignment:
//                                     //                 CrossAxisAlignment.start,
//                                     //             mainAxisAlignment:
//                                     //                 MainAxisAlignment.start,
//                                     //             children: [
//                                     //               const SizedBox(
//                                     //                 height: 12,
//                                     //               ),
//                                     //               Padding(
//                                     //                 padding: const EdgeInsets.symmetric(
//                                     //                     horizontal: 20, vertical: 10),
//                                     //                 child: Row(
//                                     //                   mainAxisAlignment:
//                                     //                       MainAxisAlignment
//                                     //                           .spaceBetween,
//                                     //                   children: [
//                                     //                     const Column(
//                                     //                       mainAxisAlignment:
//                                     //                           MainAxisAlignment.start,
//                                     //                       crossAxisAlignment:
//                                     //                           CrossAxisAlignment.start,
//                                     //                       children: [
//                                     //                         Text(
//                                     //                           "ALPHA GOLD",
//                                     //                           style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                             fontSize:
//                                     //                                 20, // Adjust the size as needed
//                                     //                             fontWeight:
//                                     //                                 FontWeight.bold,
//                                     //                             color: Colors
//                                     //                                 .white, // Customize the color
//                                     //                           ),
//                                     //                         ),
//                                     //                         SizedBox(
//                                     //                           height: 10,
//                                     //                         ),
//                                     //                         Text.rich(
//                                     //                           TextSpan(
//                                     //                             text:
//                                     //                                 '\$', // The dollar sign
//                                     //                             style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                               fontSize:
//                                     //                                   18, // Adjust the size as needed
//                                     //                               fontWeight:
//                                     //                                   FontWeight.bold,
//                                     //                               color: colors
//                                     //                                   .lightTextColor, // Customize the color
//                                     //                             ),
//                                     //                             children: <TextSpan>[
//                                     //                               TextSpan(
//                                     //                                 text: '9.99',
//                                     //                                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                                   fontSize:
//                                     //                                       24, // Adjust the size as needed
//                                     //                                   fontWeight:
//                                     //                                       FontWeight
//                                     //                                           .bold,
//                                     //                                   color: Colors
//                                     //                                       .white, // Customize the color
//                                     //                                 ),
//                                     //                               ),
//                                     //                               TextSpan(
//                                     //                                 text: ' / month',
//                                     //                                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                                   fontSize:
//                                     //                                       18, // Adjust the size as needed
//                                     //                                   fontWeight:
//                                     //                                       FontWeight
//                                     //                                           .normal,
//                                     //                                   color: Colors
//                                     //                                       .white, // Customize the color
//                                     //                                 ),
//                                     //                               ),
//                                     //                             ],
//                                     //                           ),
//                                     //                         )
//                                     //                       ],
//                                     //                     ),
//                                     //                     const SizedBox(
//                                     //                       width: 20,
//                                     //                     ),
//                                     //                     Container(
//                                     //                         alignment:
//                                     //                             Alignment.centerRight,
//                                     //                         child: showHeader
//                                     //                             ? const Text(
//                                     //                                 'SUBSCRIBE NOW',
//                                     //                                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                                     fontSize:
                                //    Platform.isAndroid ? size_10 : size_12,,
//                                     //                                     color: Colors
//                                     //                                         .white),
//                                     //                               )
//                                     //                             : Column(
//                                     //                                 crossAxisAlignment:
//                                     //                                     CrossAxisAlignment
//                                     //                                         .end,
//                                     //                                 children: [
//                                     //                                   Row(
//                                     //                                     children: [
//                                     //                                       const Icon(
//                                     //                                         Icons
//                                     //                                             .check_circle_outline,
//                                     //                                         size: 18,
//                                     //                                       ),
//                                     //                                       const SizedBox(
//                                     //                                         width: 3,
//                                     //                                       ),
//                                     //                                       InkWell(
                      // highlightColor: Colors.transparent,
                      // splashColor: Colors.transparent,
//                                     //                                         onTap: () {
//                                     //                                           Routes.navigateToCurrentPlanScreen(
//                                     //                                               context);
//                                     //                                         },
//                                     //                                         child:
//                                     //                                             const Text(
//                                     //                                           'CURRENT PLAN',
//                                     //                                           style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                                               fontSize:
//                                     //                                                   12,
//                                     //                                               color:
//                                     //                                                   Colors.white),
//                                     //                                         ),
//                                     //                                       ),
//                                     //                                     ],
//                                     //                                   ),
//                                     //                                   const SizedBox(
//                                     //                                     height: 4,
//                                     //                                   ),
//                                     //                                   const Text(
//                                     //                                     'Expiring by 02 Feb, 2023',
//                                     //                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                                         fontSize:
//                                     //                                             12,
//                                     //                                         color: Colors
//                                     //                                             .white),
//                                     //                                   ),
//                                     //                                 ],
//                                     //                               )),
//                                     //                   ],
//                                     //                 ),
//                                     //               ),
//                                     //               const SizedBox(
//                                     //                 height: 10,
//                                     //               ),
//                                     //               const Divider(
//                                     //                 color: Colors.white,
//                                     //                 height: 1,
//                                     //               ),
//                                     //               const SizedBox(height: 15),
//                                     //               for (int i = 0; i < 4; i++)
//                                     //                 const Padding(
//                                     //                   padding: EdgeInsets.only(
//                                     //                       bottom: 5, top: 5),
//                                     //                   child: Row(
//                                     //                     children: [
//                                     //                       SizedBox(width: 20),
//                                     //                       Icon(
//                                     //                         Icons.check_circle_outline,
//                                     //                         size: 14,
//                                     //                       ),
//                                     //                       SizedBox(width: 10),
//                                     //                       Text(
//                                     //                         "Lorem Ipsum is simply dummy text",
//                                     //                         style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                             color: Colors.white,
//                                     //                             fontSize:
                               //     Platform.isAndroid ? size_10 : size_12,),
//                                     //                       ),
//                                     //                     ],
//                                     //                   ),
//                                     //                 ),
//                                     //             ],
//                                     //           ),
//                                     //         ),
//                                     //       ],
//                                     //     ),
//                                     //   ),
//                                     //   const SizedBox(
//                                     //     height: 20,
//                                     //   ),
//                                     //   Container(
//                                     //     height: 100,
//                                     //     padding: const EdgeInsets.symmetric(
//                                     //         horizontal: 20, vertical: 10),
//                                     //     decoration: BoxDecoration(
//                                     //       gradient: const LinearGradient(
//                                     //         colors: [
//                                     //           colors.buttonColor,
//                                     //           Colors.transparent,
//                                     //         ],
//                                     //         begin: Alignment.centerRight,
//                                     //         end: Alignment.centerLeft,
//                                     //       ),
//                                     //       borderRadius: BorderRadius.circular(10),
//                                     //       border: Border.all(
//                                     //         color: Colors
//                                     //             .white, // Set the border color here
//                                     //       ),
//                                     //     ),
//                                     //     child: const Row(
//                                     //       mainAxisAlignment:
//                                     //           MainAxisAlignment.spaceBetween,
//                                     //       children: [
//                                     //         Column(
//                                     //           mainAxisAlignment:
//                                     //               MainAxisAlignment.start,
//                                     //           crossAxisAlignment:
//                                     //               CrossAxisAlignment.start,
//                                     //           children: [
//                                     //             Text(
//                                     //               "ALPHA BASIC",
//                                     //               style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                 fontSize:
//                                     //                     20, // Adjust the size as needed
//                                     //                 fontWeight: FontWeight.bold,
//                                     //                 color: Colors
//                                     //                     .white, // Customize the color
//                                     //               ),
//                                     //             ),
//                                     //             SizedBox(
//                                     //               height: 10,
//                                     //             ),
//                                     //             Text.rich(
//                                     //               TextSpan(
//                                     //                 text: '\$', // The dollar sign
//                                     //                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                   fontSize:
//                                     //                       18, // Adjust the size as needed
//                                     //                   fontWeight: FontWeight.bold,
//                                     //                   color: colors
//                                     //                       .lightTextColor, // Customize the color
//                                     //                 ),
//                                     //                 children: <TextSpan>[
//                                     //                   TextSpan(
//                                     //                     text: '0.00',
//                                     //                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                       fontSize:
//                                     //                           24, // Adjust the size as needed
//                                     //                       fontWeight: FontWeight.bold,
//                                     //                       color: Colors
//                                     //                           .white, // Customize the color
//                                     //                     ),
//                                     //                   ),
//                                     //                   TextSpan(
//                                     //                     text: ' / month',
//                                     //                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     //                       fontSize:
//                                     //                           18, // Adjust the size as needed
//                                     //                       fontWeight: FontWeight.normal,
//                                     //                       color: Colors
//                                     //                           .white, // Customize the color
//                                     //                     ),
//                                     //                   ),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ],
//                                     //         ),
//                                     //       ],
//                                     //     ),
//                                     //   ),
//                                   ],
//                                 )
//                               else
//                                 Container(
//                                   child: const Text(""),
//                                 ),
