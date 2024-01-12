// import 'dart:io';

// import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
// import 'package:alpha_ecommerce_18oct/utils/color.dart';
// import 'package:alpha_ecommerce_18oct/utils/images.dart';
// import 'package:flutter/material.dart';
// import '../../../utils/routes.dart';

// savedCard(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       children: [
//         InkWell(
//           highlightColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           onTap: () {
//             //  Routes.navigateToProductDetailPageScreen(context);
//           },
//           child: Container(
//             height: 200,
//             width: 160,
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 gradient: LinearGradient(
//                   colors: [
//                     colors.boxGradient1.withOpacity(1),
//                     Colors.transparent,
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 border: Border.all(color: colors.boxBorder)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   Images.onBoarding2,
//                   width: 80,
//                   height: 80,
//                 ),
//                 const SizedBox(height: 8),
//                  Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 5,
//                   ),
//                   child: Text(
//                     '35% Off',
//                     style: TextStyle(
//                       color: Colors.orange,
//                       fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,
//                     ),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 5,
//                   ),
//                   child: Text(
//                     'Dettol refresh longi...',
//                     style: TextStyle(
//                       color: colors.textColor,
//                       fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 5,
//                   ),
//                   child: Row(
//                     children: const [
//                       Text(
//                         '120.00',
//                         style: TextStyle(
//                           color: Colors.cyan,
//                           fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "\$200",
//                         style: TextStyle(
//                           color: colors.lightTextColor,
//                           fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//       ],
//     ),
//   );
// }
