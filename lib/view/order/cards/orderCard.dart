// import 'package:alpha_ecommerce_18oct/utils/color.dart';
// import 'package:alpha_ecommerce_18oct/utils/images.dart';
// import 'package:alpha_ecommerce_18oct/utils/routes.dart';
// import 'package:alpha_ecommerce_18oct/view/order/model/ordersModel.dart';
// import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
// import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
// import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

//  Color getTextColor(String status) {
//     switch (status) {
//       case 'On the way':
//         return colors.onTheWayDark;
//       case 'Order Cancelled':
//         return colors.orderCancelledDark;
//       case 'Delivered':
//         return colors.deliveredDark;
//       case 'Returned':
//         return colors.returnedDark;
//       default:
//         return Colors.transparent;
//     }
//   }

//   Color getBackgroundColor(String status) {
//     switch (status) {
//       case 'On the way':
//         return colors.onTheWayLight;
//       case 'Order Cancelled':
//         return colors.orderCancelledLight;
//       case 'Delivered':
//         return colors.deliveredLight;
//       case 'Returned':
//         return colors.returnedLight;
//       default:
//         return Colors.transparent;
//     }
//   }
 
// orderItemCard(OrdersList model, BuildContext context, CartViewModel provider) {

//   return  Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.12,
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(
//                                     color: const Color(0x14E9E9E9),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 child: ListTile(
//                                   title: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                        Images.dettol,
//                                         width: 50,
//                                         height: 170,
//                                       ),
//                                       const SizedBox(width: 30),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.5,
//                                             child: Text(
//                                               model.,
//                                               style: const TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: Platform.isAndroid ? size_12 : size_14),
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.5,
//                                             child: Text(
//                                               orderItems[i]['subText'],
//                                               style: const TextStyle(
//                                                   color: colors.greyText,
//                                                   fontSize:
                             //       Platform.isAndroid ? size_10 : size_12,),
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Container(
//                                             height: 20,
//                                             alignment: Alignment.center,
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 10, vertical: 2),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(3)),
//                                               border: Border.all(
//                                                 color: const Color(0x14E9E9E9),
//                                                 width: 2,
//                                               ),
//                                               color: getBackgroundColor(
//                                                   orderItems[i]['status']),
//                                             ),
//                                             child: Text(
//                                               orderItems[i]['status'],
//                                               style: TextStyle(
//                                                   color: getTextColor(
//                                                       orderItems[i]['status']),
//                                                   fontSize:
                                //    Platform.isAndroid ? size_8 : size_10,),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                            }

// Column ordersCardsRow(BuildContext context, List<OrdersList> model,
//         OrderViewModel provider) =>
//     Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           child: Column(
//             children: List.generate(
//               model.length,
//               (index) => orderItemCard(model[index].product, context, provider),
//             ),
//           ),
//         )
//       ],
//     );
