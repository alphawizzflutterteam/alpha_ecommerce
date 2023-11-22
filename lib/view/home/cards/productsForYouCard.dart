import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModels.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../homeTexts&Spaces.dart';

productForYouCard(Product model, BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Routes.navigateToProductDetailPageScreen(context);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width * 0.44,
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
              Image.network(model.images.first,
                  height: MediaQuery.of(context).size.height * 0.12,
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width * 0.44),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${model.discount}% Off",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                      ),
                    ),
                    LikeButton(
                      size: size_20,
                      isLiked: model.isFavorite,
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
                  model.name,
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
                      model.unitPrice,
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      model.purchasePrice,
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
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: colors.boxBorder)),
                  child: Text(
                    model.isCart ? "Remove From Cart" : "Add to Cart",
                    style: const TextStyle(
                        color: colors.textColor, fontSize: size_12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //  spaceOfHeight(),
    ],
  );
}


// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 3, // number of items in each row
//     mainAxisSpacing: 8.0, // spacing between rows
//     crossAxisSpacing: 8.0, // spacing between columns
//   ),
//   padding: EdgeInsets.all(8.0), // padding around the grid
//   itemCount: items.length, // total number of items
//   itemBuilder: (context, index) {
//     return Container(
//       color: Colors.blue, // color of grid items
//       child: Center(
//         child: Text(
//           items[index],
//           style: TextStyle(fontSize: 18.0, color: Colors.white),
//         ),
//       ),
//     );
//   },
// )
