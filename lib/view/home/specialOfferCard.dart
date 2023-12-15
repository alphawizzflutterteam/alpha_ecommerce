import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_button.dart';
import 'package:flutter/material.dart';

specialOfferCard(SpecialOffersList model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Images.priceBG,
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            Text(
              model.title,
              style: const TextStyle(
                  fontSize: size_13,
                  color: colors.buttonColor,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: size_10,
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

Row specialOfferList(
  BuildContext context,
  List<SpecialOffersList> model,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) => specialOfferCard(model[index], context),
            ),
          ),
        )
      ],
    );
