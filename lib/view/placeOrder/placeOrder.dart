// import 'dart:io';

// import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
// import 'package:alpha_ecommerce_18oct/utils/images.dart';
// import 'package:alpha_ecommerce_18oct/utils/routes.dart';
// import 'package:flutter/material.dart';
// import '../../utils/color.dart';
// import '../widget_common/commonBackground.dart';
// import '../widget_common/common_button.dart';
// import '../widget_common/common_header.dart';
// import '../widget_common/common_radioButton.dart';
// import '../widget_common/toast_message.dart';
// import '../profile/common_header.dart';

// class PlaceOrder extends StatefulWidget {
//   const PlaceOrder({Key? key}) : super(key: key);

//   @override
//   State<PlaceOrder> createState() => _PlaceOrderState();
// }

// class _PlaceOrderState extends State<PlaceOrder> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String selectedOption = 'Alpha Delivery';

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const LightBackGround(),
//         Scaffold(
//           resizeToAvoidBottomInset: false,
//           key: _scaffoldKey,
//           extendBody: true,
//           backgroundColor: Colors.transparent,
//           body: Column(
//             children: [
//               const Stack(
//                 children: [
//                   ProfileHeader(),
//                   InternalDetailPageHeader(
//                     text: 'Place Order',
//                   )
//                 ],
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Container(
//                           height: 40,
//                           margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                           decoration: BoxDecoration(
//                             color: Colors.yellow.withOpacity(0.2),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                           ),
//                           child: const Row(
//                             children: [
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Icon(
//                                 Icons.monetization_on_sharp,
//                                 color: Colors.yellow,
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "25% Off saved so far",
//                                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     color: Colors.orange,
//                                     Platform.isAndroid ? size_14 : size_16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                                 color: const Color(0x14E9E9E9), width: 3)),
//                         child: Column(children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 Images.maggie,
//                                 width: 100,
//                                 height: 100,
//                               ),
//                               const SizedBox(width: 20),
//                               const Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     "Maggie Masala",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                         color: Colors.white, fontSize: Platform.isAndroid ? size_14 : size_14),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "\$120.00",
//                                         style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                             color: colors.buttonColor,
//                                             Platform.isAndroid ? size_14 : size_16),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 10),
//                                         child: Text(
//                                           "\$200",
//                                           style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                               color: colors.greyText,
//                                               fontSize: Platform.isAndroid ? size_14 : size_14),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     "190ml",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: colors.greyText,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height: 30,
//                                 width: MediaQuery.of(context).size.width * 0.35,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(5)),
//                                     border: Border.all(
//                                         color: const Color(0x14E9E9E9),
//                                         width: 3)),
//                                 child: const Text(
//                                   "Save for later",
//                                   style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     color: Colors.white,
//                                     fontSize:
//                                         Platform.isAndroid ? size_10 : size_12,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               InkWell(
//                                 highlightColor: Colors.transparent,
//                                 splashColor: Colors.transparent,
//                                 onTap: () {
//                                   showToastMessage("Item remove from wishlist");
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.35,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(5)),
//                                       border: Border.all(
//                                           color: const Color(0x14E9E9E9),
//                                           width: 3)),
//                                   child: const Text(
//                                     "Remove from wishlist",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: Colors.white,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           )
//                         ]),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 20, top: 20),
//                             child: Text(
//                               "Delivery type",
//                               style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                   color: Colors.white,
//                                   fontSize: Platform.isAndroid ? size_14 : size_14,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                             ),
//                             child: Theme(
//                               data: ThemeData(
//                                   unselectedWidgetColor: colors.greyText),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   CommonRadioTile(
//                                     color: Theme.of(context).brightness ==
//                                             Brightness.light
//                                         ? Colors.black
//                                         : Colors.white,
//                                     options: selectedOption,
//                                     name: 'Normal Delivery',
//                                     onChanged: handleOptionChange,
//                                   ),
//                                   CommonRadioTile(
//                                     color: Theme.of(context).brightness ==
//                                             Brightness.light
//                                         ? Colors.black
//                                         : Colors.white,
//                                     options: selectedOption,
//                                     name: 'Alpha Delivery',
//                                     onChanged: handleOptionChange,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Text(
//                                 "Price Detail",
//                                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                     color: Colors.white, fontSize: Platform.isAndroid ? size_14 : size_14),
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "MRP (4 items)",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: colors.greyText,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                   Text(
//                                     "\$480.00",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: Colors.white,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Delivery fee",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: colors.greyText,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                   Text(
//                                     "\$20.00",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: Colors.white,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Discount",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: colors.greyText,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                   Text(
//                                     "\$80.00",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: Colors.white,
//                                       fontSize: Platform.isAndroid
//                                           ? size_10
//                                           : size_12,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Divider(
//                               height: 5,
//                               color: colors.greyText,
//                               thickness: 1,
//                               indent: 10,
//                               endIndent: 10,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Total Amount",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                         color: Colors.white, fontSize: Platform.isAndroid ? size_14 : size_14),
//                                   ),
//                                   Text(
//                                     "\$600.00",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                         color: colors.buttonColor,
//                                         fontSize: Platform.isAndroid ? size_14 : size_14),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Divider(
//                               height: 5,
//                               color: colors.greyText,
//                               thickness: 1,
//                               indent: 10,
//                               endIndent: 10,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Text(
//                                 "You will save Rs. 80 in this order",
// //                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .titleSmall!
//                                                     .copyWith(
                                                      
//                                     color: Colors.green, fontSize: Platform.isAndroid ? size_14 : size_14),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: InkWell(
//                                 highlightColor: Colors.transparent,
//                                 splashColor: Colors.transparent,
//                                 onTap: () {
//                                   Routes.navigateToOffersScreen(context);
//                                 },
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const Text(
//                                       "Offer & Benefits",
//                                       style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                           color: Colors.white, fontSize: Platform.isAndroid ? size_14 : size_14),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Image.asset(
//                                           Images.cartOffer,
//                                           height: 20,
//                                           width: 20,
//                                         ),
//                                         const SizedBox(width: 10),
//                                         const Text(
//                                           "View Offer",
//                                           style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                               color: Colors.white,
//                                               fontSize: Platform.isAndroid ? size_14 : size_14),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 40,
//                                       child: TextField(
//                                         textAlign: TextAlign.start,
//                                         decoration: InputDecoration(
//                                           contentPadding:
//                                               const EdgeInsets.symmetric(
//                                                   vertical: 10, horizontal: 10),
//                                           hintText: 'Voucher Number',
//                                           hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
//                                               color: colors.greyText),
//                                           focusedBorder: OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                               color: colors.textFieldColor,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           enabledBorder: OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                               color: colors.textFieldColor,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   SizedBox(
//                                       height: 40,
//                                       width: 100,
//                                       child: CommonButton(
//                                           text: "APPLY",
//                                           fontSize: Platform.isAndroid ? size_14 : size_14,
//                                           onClick: () {})),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: 130,
//                   color: colors.textFieldBG,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 15),
//                           child: InkWell(
//                             highlightColor: Colors.transparent,
//                             splashColor: Colors.transparent,
//                             onTap: () {
//                               Routes.navigateToManageAddressScreen(context);
//                             },
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on,
//                                       color: Colors.red,
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       "Add Address",
//                                       style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                           color: Colors.white, Platform.isAndroid ? size_14 : size_16),
//                                     ),
//                                   ],
//                                 ),
//                                 Icon(Icons.arrow_forward_ios_rounded)
//                               ],
//                             ),
//                           ),
//                         ),
//                         const Divider(
//                           color: Colors.white,
//                           height: 1,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 15),
//                           height: 70,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Text(
//                                     "\$120 - 10",
//                                     style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                                       color: colors.textColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 28,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Image.asset(
//                                     Images.rupees,
//                                     height: 25,
//                                     width: 25,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                   height: 40,
//                                   width: 150,
//                                   child: CommonButton(
//                                       text: "PLACE ORDER",
//                                       fontSize: Platform.isAndroid ? size_14 : size_14,
//                                       onClick: () {
//                                         Routes.navigateToPaymentScreen(
//                                             context, "", "", "", true, "order");
//                                       })),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   void handleOptionChange(String value) {
//     setState(() {
//       selectedOption = value;
//     });
//   }
// }
