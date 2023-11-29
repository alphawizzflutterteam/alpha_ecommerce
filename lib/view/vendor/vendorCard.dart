import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';

vendorCard(context, VendorDatum model) {
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
              child: Image.network(
                model.image,
                width: 80,
                height: 80,
              ),
            ),
          ),
          const SizedBox(width: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.rating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      model.followers,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const Text(
                      "Follower",
                      style: TextStyle(color: colors.greyText, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(""),
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
                const SizedBox(
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
