import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

productRatingAndFollowersCard() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0x14E9E9E9),
        )),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(Images.vendor),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Best Mart",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.3",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rating",
                      style: TextStyle(color: colors.lightTextColor),
                    )
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "167",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(color: colors.lightTextColor),
                    )
                  ],
                ),
              ],
            ),
            Image.asset(
              Images.arrow,
              width: 30,
              height: 30,
            )
          ],
        )
      ],
    ),
  );
}
