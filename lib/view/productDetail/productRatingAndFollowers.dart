import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

productRatingAndFollowersCard(Shop shop, BuildContext ctx) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        color: Theme.of(ctx).brightness == Brightness.dark
            ? Colors.transparent
            : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0x14E9E9E9),
        )),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  shop.image,
                  height: size_55,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  shop.name,
                  style: TextStyle(
                      color: Theme.of(ctx).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                )
              ],
            ),
            Image.asset(
              Images.trusted,
              height: 40,
              width: 60,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          shop.rating,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rating",
                      style: TextStyle(
                          color: Theme.of(ctx).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          shop.followers,
                          style: TextStyle(
                            color: Theme.of(ctx).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                          color: Theme.of(ctx).brightness == Brightness.dark
                              ? colors.lightTextColor
                              : Colors.black),
                    )
                  ],
                ),
              ],
            ),
            Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: colors.buttonColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: colors.textColor,
                )),
          ],
        )
      ],
    ),
  );
}
