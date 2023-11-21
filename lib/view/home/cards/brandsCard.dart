import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:flutter/material.dart';

brandCard(BrandsList model, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10, bottom: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              model.image,
              height: size_60,
            ),
          ),
          const SizedBox(
            height: size_5,
          ),
          Text(model.name)
        ],
      ));
}

Row brandsCard(
  BuildContext context,
  List<BrandsList> model,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: List.generate(
              model.length,
              (index) => brandCard(model[index], context),
            ),
          ),
        )
      ],
    );
