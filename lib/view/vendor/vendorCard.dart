import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';

vendorCard(context) {
  return InkWell(
    onTap: () {
      Routes.navigateToVendorDetailsScreen(context);
    },
    child: Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0x14E9E9E9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                Images.vendor,
                width: 80,
                height: 80,
              ),
            ),
          ),
          const SizedBox(width: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Mart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "167 ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Follower",
                      style: TextStyle(color: colors.greyText, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(""),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "View Details",
                        style:
                            TextStyle(color: colors.buttonColor, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
