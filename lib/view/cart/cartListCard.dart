// import 'package:alpha_ecommerce_18oct/model/cartList.dart';
// import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import '../../utils/color.dart';
// import '../../utils/routes.dart';
// import '../widget_common/toast_message.dart';

// cartListCard(CartProduct model, BuildContext context) {
//   return Container(
//     height: 190,
//     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: colors.boxBorder)),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             InkWell(
                      // highlightColor: Colors.transparent,
                      // splashColor: Colors.transparent,
//               onTap: () {
//                 Routes.navigateToProductDetailPageScreen(context);
//               },
//               child: Image.asset(
//                 model.images[0],
//                 width: 110,
//                 height: 140,
//               ),
//             ),
//             const SizedBox(width: 30),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 InkWell(
                      // highlightColor: Colors.transparent,
                      // splashColor: Colors.transparent,
//                   onTap: () {
//                     Routes.navigateToProductDetailPageScreen(context);
//                   },
//                   child: Text(
//                     cartList[widget.i].productName,
//                     style:
//                         Theme.of(context).textTheme.titleSmall!.copyWith(color: colors.textColor, fontSize: Platform.isAndroid ? size_12 : size_14),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       cartList[widget.i].productPrice,
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           color: colors.buttonColor, Platform.isAndroid ? size_14 : size_16),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Text(
//                         cartList[widget.i].productDiscount,
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                             decoration: TextDecoration.lineThrough,
//                             color: colors.greyText,
//                             fontSize: Platform.isAndroid ? size_12 : size_14),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   cartList[widget.i].productWeight,
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colors.greyText, fontSize:
             //                       Platform.isAndroid ? size_10 : size_12,),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 50,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(5)),
//                       border: Border.all(color: colors.boxBorder)),
//                   child: DropdownButtonFormField2<String>(
//                     isExpanded: true,
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(vertical: 15),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.zero,
//                           borderSide: BorderSide.none),
//                     ),
//                     hint: const Text(
//                       'Qty 1',
//                       style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                    //   fontSize: Platform.isAndroid ? size_12 : size_14, color: colors.textColor),
//                     ),
//                     items: quantity
//                         .map((item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                                     fontSize:
                         //           Platform.isAndroid ? size_10 : size_12,, color: colors.textColor),
//                               ),
//                             ))
//                         .toList(),
//                     validator: (value) {
//                       if (value == null) {
//                         return 'Select Quantity.';
//                       }
//                       return null;
//                     },
//                     onChanged: (value) {},
//                     onSaved: (value) {
//                       selectedValue = value.toString();
//                     },
//                     buttonStyleData: const ButtonStyleData(
//                       padding: EdgeInsets.only(right: 8),
//                     ),
//                     iconStyleData: const IconStyleData(
//                       icon: Icon(
//                         Icons.arrow_drop_down,
//                         color: colors.textColor,
//                       ),
//                       iconSize: 18,
//                     ),
//                     dropdownStyleData: DropdownStyleData(
//                         elevation: 8,
//                         decoration: BoxDecoration(
//                           color: colors.textFieldBG,
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(color: colors.boxBorder),
//                         )),
//                     menuItemStyleData: const MenuItemStyleData(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//               height: 35,
//               width: MediaQuery.of(context).size.width * 0.3,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(5)),
//                   border: Border.all(color: colors.boxBorder)),
//               child: const Text(
//                 "Save for later",
//                 style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                    //   color: colors.textColor, fontSize:
                     //               Platform.isAndroid ? size_10 : size_12,),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//               height: 35,
//               width: MediaQuery.of(context).size.width * 0.35,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(5)),
//                   border: Border.all(color: colors.boxBorder)),
//               child: InkWell(
                      // highlightColor: Colors.transparent,
                      // splashColor: Colors.transparent,
//                 onTap: () {
//                   showToastMessage("Item remove from cart");
//                 },
//                 child: const Text(
//                   "Remove from cart",
//                   style: Theme.of(context)
                                                    // .textTheme
                                                    // .titleSmall!
                                                    // .copyWith(
                                                    //   color: colors.textColor, fontSize:
                          //          Platform.isAndroid ? size_10 : size_12,),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
