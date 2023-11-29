import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

secondCategoryCard(CategoriesList model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
    child: Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: model.icon,
              height: 45,
              width: 45,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size_90,
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: size_10),
          ),
        ),
      ],
    ),
  );
}

Row secondCategoryListCard(
  BuildContext context,
  List<CategoriesList> model,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: List.generate(
              model.length,
              (index) => secondCategoryCard(model[index], context),
            ),
          ),
        )
      ],
    );
