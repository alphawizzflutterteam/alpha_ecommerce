import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/orderDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListBuilder extends StatelessWidget {
  final List<Product> productList;

  const ProductListBuilder({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.builder(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Routes.navigateToProductDetailPageScreen(
                  context, productList[index].productDetails!.slug!);
            },
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  // image: DecorationImage(image: NetworkImage(model.images.first)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: Theme.of(context).brightness == Brightness.dark
                      ? LinearGradient(
                          colors: [
                            colors.boxGradient1.withOpacity(1),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : LinearGradient(
                          colors: [
                            Color(0xFFE4E2ED),
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                  border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.boxBorder
                          : colors.lightBorder)),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // decoration: BoxDecoration(
              //   borderRadius:
              //       BorderRadius.circular(10),
              //   border: Border.all(
              //     color: Theme.of(context)
              //                 .brightness ==
              //             Brightness.dark
              //         ? const Color(0x14E9E9E9)
              //         : colors.lightBorder,
              //     width: 2,
              //   ),
              // ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 10, top: 4, bottom: 4),
                    child: Container(
                      height: double.maxFinite,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Image.network(
                        productList[index].productDetails!.thumbnail!,
                        width: MediaQuery.of(context).size.width * .2,
                        errorBuilder: (context, error, stackTrace) =>
                            ErrorImageWidget(),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width - size_200 * 0.8,
                        child: Text(
                          productList[index].productDetails!.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        productList[index].price.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: Platform.isAndroid ? size_11 : size_13),
                      ),
                    ],
                  )
                ],
              ),

              //  Container(
              //   width: MediaQuery.of(context).size.width,
              //   margin: const EdgeInsets.only(right: 15),
              //   padding: const EdgeInsets.all(4),
              //   decoration: BoxDecoration(
              //       // image: DecorationImage(image: NetworkImage(model.images.first)),
              //       borderRadius: const BorderRadius.all(Radius.circular(10)),
              //       gradient: Theme.of(context).brightness == Brightness.dark
              //           ? LinearGradient(
              //               colors: [
              //                 colors.boxGradient1.withOpacity(1),
              //                 Colors.transparent,
              //               ],
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //             )
              //           : LinearGradient(
              //               colors: [
              //                 Color(0xFFE4E2ED),
              //                 Colors.white,
              //               ],
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //             ),
              //       border: Border.all(
              //           color: Theme.of(context).brightness == Brightness.dark
              //               ? colors.boxBorder
              //               : colors.lightBorder)),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Column(
              //         children: [
              //           Container(
              //             height: 95,
              //             width: MediaQuery.of(context).size.width * 0.3,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.only(
              //                 topLeft: Radius.circular(10),
              //                 topRight: Radius.circular(10),
              //               ),
              //               image: DecorationImage(
              //                   image: NetworkImage(productList[index]
              //                       .productDetails!
              //                       .thumbnail!),
              //                   fit: BoxFit.contain),
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 15),
              //       Expanded(
              //         flex: 2,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               productList[index].productDetails!.name.toString(),
              //               maxLines: 1,
              //               overflow: TextOverflow.ellipsis,
              //               style:
              //                   Theme.of(context).textTheme.titleSmall!.copyWith(
              //                         color: Theme.of(context).brightness ==
              //                                 Brightness.dark
              //                             ? Colors.white
              //                             : Colors.black,
              //                         fontSize:
              //                             Platform.isAndroid ? size_10 : size_12,
              //                       ),
              //             ),
              //             const SizedBox(height: 5),
              //             Text(
              //               productList[index].price.toString(),
              //               style:
              //                   Theme.of(context).textTheme.titleSmall!.copyWith(
              //                         color: colors.buttonColor,
              //                         fontSize:
              //                             Platform.isAndroid ? size_10 : size_12,
              //                       ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
            ),
          ),
        ),
      ),
    );
  }
}
