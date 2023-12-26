import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/app_utils.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../utils/color.dart';
import '../../../utils/routes.dart';

productForYouCard(
    ProductList model, BuildContext context, HomeViewModel homeProvider) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Routes.navigateToProductDetailPageScreen(context, model.slug);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          width: MediaQuery.of(context).size.width * 0.44,
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
                    imageUrl: model.images.first,
                    errorWidget: (context, url, error) =>
                        Image.asset(Images.defaultProductImg),
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
                      "${model.discount}% Off",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                      ),
                    ),
                    LikeButton(
                      onTap: (isLiked) {
                        var isLoggedIn = SharedPref.shared.pref
                            ?.getString(PrefKeys.isLoggedIn);

                        if (isLoggedIn == "1") {
                          Map data = {'product_id': model.id.toString()};
                          if (isLiked) {
                            return homeProvider.removeFromWishlist(
                                data, context);
                          } else {
                            return homeProvider.addToWishlist(data, context);
                          }
                        } else {
                          return AppUtils.appUtilsInstance.nothing();
                        }
                      },
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.textColor
                        : Colors.black,
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
                      model.specialPrice,
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
                    var isLoggedIn =
                        SharedPref.shared.pref?.getString(PrefKeys.isLoggedIn);

                    if (isLoggedIn == "1") {
                      Map data;
                      if (!model.isCart) {
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
                      } else {
                        data = {
                          'key': model.cart_id.toString(),
                        };
                      }
                      print(data);
                      model.isCart
                          ? homeProvider.removeFromCart(data, context)
                          : homeProvider.addToCart(data, context);
                    } else {
                      AppUtils.appUtilsInstance.showLoginAlertDialog(context);
                    }
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
                      model.isCart ? "Remove From Cart" : "Add to Cart",
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.textColor
                              : Colors.black,
                          fontSize: size_12),
                      textAlign: TextAlign.center,
                    ),
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
