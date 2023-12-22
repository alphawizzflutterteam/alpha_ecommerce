import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:flutter/material.dart';

wishlistCard(WishlistItemProduct model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            //  Routes.navigateToProductDetailPageScreen(context);
          },
          child: Container(
            height: 200,
            width: 160,
            decoration: BoxDecoration(
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
                Image.asset(
                  Images.onBoarding2,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    model.discount.toString() + "% Off",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: colors.textColor,
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
                        model.purchasePrice,
                        style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        model.unitPrice,
                        style: const TextStyle(
                          color: colors.lightTextColor,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Row wishlistCardsRow(
  BuildContext context,
  List<WishlistItem> model,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) => wishlistCard(model[index].product, context),
            ),
          ),
        )
      ],
    );
