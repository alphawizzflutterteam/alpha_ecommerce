import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';

wishlistCard(BuildContext context, WishlistItemProduct model,
    HomeViewModel homeProvider) {
  return InkWell(
    onTap: () {
      //  Routes.navigateToProductDetailPageScreen(context);
    },
    child: Container(
      height: MediaQuery.of(context).size.height * .18,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0x14E9E9E9).withOpacity(0.05)
            : Colors.white,
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0x14E9E9E9).withOpacity(0.05)
              : colors.lightBorder,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              model.images[0],
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset(Images.defaultProductImg),
              width: MediaQuery.of(context).size.width * .25,
              // height: MediaQuery.of(context).size.height * .15,
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  model.name,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      model.unitPrice,
                      style: const TextStyle(
                          color: colors.buttonColor, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        model.specialPrice,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.greyText
                              : Colors.black,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  model.code,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.greyText
                          : Colors.black,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Map data = {'product_id': model.id.toString()};
                          homeProvider.removeFromWishlist(data, context);
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.boxBorder
                                    : colors.lightBorder,
                              )),
                          child: Text(
                            "DELETE",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Map data;

                          if (model.isCart) {
                            data = {
                              'key': model.cart_id.toString(),
                            };

                            await homeProvider.removeFromCart(data, context);
                          } else {
                            data = {
                              'id': model.id.toString(),
                              'quantity': "1",
                              'color': model.colorImage.isNotEmpty
                                  ? "#" + model.colorImage[0].color
                                  : "",
                              'choice_2': model.choiceOptions.isNotEmpty
                                  ? model.choiceOptions[0].options[0]
                                  : ""
                            };
                            await homeProvider.addToCart(data, context);
                          }
                        },
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.23,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.boxBorder
                                    : colors.lightBorder,
                              )),
                          child: Text(
                            model.isCart ? "Remove From Cart" : "Add To Cart",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
