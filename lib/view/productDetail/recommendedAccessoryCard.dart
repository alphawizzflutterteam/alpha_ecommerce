// import 'package:alpha_ecommerce_18oct/utils/routes.dart';
// import 'package:flutter/material.dart';
// import '../../utils/color.dart';
// import '../../utils/images.dart';

// recommendedAccessoryCard({required context}) {
//   return InkWell(
//     highlightColor: Colors.transparent,
//     splashColor: Colors.transparent,
//     onTap: () {},
//     child: Container(
//       height: 300,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           gradient: LinearGradient(
//             colors: [
//               colors.boxGradient1.withOpacity(0.4),
//               colors.boxBorder.withOpacity(0.4),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           border: Border.all(color: colors.boxBorder)),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: List.generate(3, (index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: 200,
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       Images.powder,
//                       height: 120,
//                     ),
//                     const SizedBox(height: 5),
//                      Text(
//                       "Oats Fitness",
//                       style: TextStyle(color: colors.textColor, fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,),
//                     ),
//                     const SizedBox(height: 5),
//                     const Row(
//                       children: [
//                         Text(
//                           "\$200",
//                           style: TextStyle(
//                             color: colors.lightTextColor,
//                             fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "\$120.00",
//                           style: TextStyle(
//                             color: colors.buttonColor,
//                             fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     const Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           color: Colors.orange,
//                           size: 16,
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "4.3",
//                           style: TextStyle(
//                             color: Colors.orange,
//                             fontSize: Platform.isAndroid ? size_12 : size_14,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 70,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                           border: Border.all(color: colors.textColor)),
//                       child: const Text(
//                         "ADD",
//                         style: TextStyle(color: colors.textColor, fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,),
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     ),
//   );
// }
