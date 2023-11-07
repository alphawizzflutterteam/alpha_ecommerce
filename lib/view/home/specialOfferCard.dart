import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_button.dart';
import 'package:flutter/material.dart';

specialOfferCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              Images.priceBG,
              height: 130,
              width: 130,
            ),
            const Positioned(
              top: 45,
              left: 40,
              child: Text(
                "Under\n\$399",
                style: TextStyle(
                    color: colors.buttonColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width * 0.25,
            child: CommonButton(
                text: "Shop now",
                fontSize: 12,
                whitePrimary: true,
                onClick: () {})),
      ],
    ),
  );
}
