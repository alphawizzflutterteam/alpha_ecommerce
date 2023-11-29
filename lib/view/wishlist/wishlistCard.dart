import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';

wishlistCard(BuildContext context, WishlistItemProduct model,
    HomeViewModel homeProvider) {
  return InkWell(
    onTap: () {
      Routes.navigateToProductDetailPageScreen(context);
    },
    child: Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0x14E9E9E9).withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              model.images[0],
              width: 100,
              height: 170,
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
                  style: const TextStyle(color: Colors.white, fontSize: 14),
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
                        style: const TextStyle(
                          color: colors.greyText,
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
                  style: const TextStyle(color: colors.greyText, fontSize: 12),
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
                              border: Border.all(color: colors.boxBorder)),
                          child: const Text(
                            "DELETE",
                            style: TextStyle(
                                color: colors.textColor, fontSize: 10),
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
                              border: Border.all(color: colors.boxBorder)),
                          child: Text(
                            model.isCart ? "Remove From Cart" : "Add To Cart",
                            style: const TextStyle(
                                color: colors.textColor, fontSize: 10),
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
