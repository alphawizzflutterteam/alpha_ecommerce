import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../utils/color.dart';

recommendedProductCard({required context, required List<ProductList> model}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.33,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(model.length, (index) {
        var card = model[index];
        return Container(
          height: MediaQuery.of(context).size.height * 0.31,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
              // image: DecorationImage(image: NetworkImage(model.images.first)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                colors: [
                  colors.boxGradient1.withOpacity(1),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: colors.boxBorder)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.44,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: card.images.first,
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0005),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${card.discount}% Off",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                      ),
                    ),
                    LikeButton(
                      // onTap: (isLiked) {
                      //   Map data = {'product_id': card.id.toString()};
                      //   if (isLiked) {
                      //     return true;
                      //     //homeProvider.removeFromWishlist(data, context);
                      //   } else {
                      //     return false;
                      //     //  homeProvider.addToWishlist(data, context);
                      //   }
                      // },
                      size: size_20,
                      isLiked: card.isFavorite,
                      circleColor:
                          const CircleColor(start: Colors.red, end: Colors.red),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.red,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.pink : Colors.grey,
                          size: 20,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  card.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Text(
                      card.unitPrice,
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      card.purchasePrice,
                      style: const TextStyle(
                        color: colors.lightTextColor,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Map data;
                    if (!card.isCart) {
                      data = {
                        'id': card.id.toString(),
                        'quantity': "1",
                        'color': card.colorImage.isNotEmpty
                            ? "#" + card.colorImage[0].color
                            : "",
                        'choice_2': card.choiceOptions.isNotEmpty
                            ? card.choiceOptions[0].options[0]
                            : ""
                      };
                    } else {
                      data = {
                        'key': card.cart_id.toString(),
                      };
                    }
                    print(data);
                    // card.isCart
                    //     ? homeProvider.removeFromCart(data, context)
                    //     : homeProvider.addToCart(data, context);
                  },
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: colors.boxBorder)),
                    child: Text(
                      card.isCart ? "Remove From Cart" : "Add to Cart",
                      style: const TextStyle(
                          color: colors.textColor, fontSize: size_12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );
}
