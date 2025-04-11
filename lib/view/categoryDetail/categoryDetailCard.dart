// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';
// import '../../utils/color.dart';
// import '../../utils/images.dart';
// import '../../utils/routes.dart';

// categoryDetailCard({required BuildContext context}) {
//   return InkWell(
//     highlightColor: Colors.transparent,
//     splashColor: Colors.transparent,
//     onTap: () {
//       //Routes.navigateToProductDetailPageScreen(context);
//     },
//     child: Container(
//       height: MediaQuery.of(context).size.height * 0.25,
//       width: MediaQuery.of(context).size.width * 0.42,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           gradient: LinearGradient(
//             colors: [
//               colors.boxGradient1.withOpacity(1),
//               Colors.transparent,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           border: Border.all(color: colors.boxBorder)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             Images.onBoarding2,
//             width: 80,
//             height: 80,
//           ),
//           const SizedBox(height: 8),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 5,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                  Text(
//                   '35% Off',
//                   style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                     color: Colors.orange,
//                     fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                   ),
//                 ),
//                 LikeButton(
//                   size: 20,
//                   circleColor:
//                       const CircleColor(start: Colors.red, end: Colors.red),
//                   bubblesColor: const BubblesColor(
//                     dotPrimaryColor: Colors.red,
//                     dotSecondaryColor: Colors.red,
//                   ),
//                   likeBuilder: (bool isLiked) {
//                     return Icon(
//                       Icons.favorite,
//                       color: isLiked ? Colors.pink : Colors.grey,
//                       size: 20,
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 5,
//             ),
//             child: Text(
//               'Dettol refresh longi...',
//               style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                 color: Colors.white,
//                 fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 5,
//             ),
//             child: Row(
//               children: const [
//                 Text(
//                   '120.00',
//                   style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                     color: Colors.cyan,
//                     fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "\$200",
//                   style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                      
//                     color: colors.lightTextColor,
//                     decoration: TextDecoration.lineThrough,
//                     fontSize:
//                                     Platform.isAndroid ? size_10 : size_12,,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
