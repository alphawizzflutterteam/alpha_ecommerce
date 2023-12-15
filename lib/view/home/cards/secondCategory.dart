import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

secondCategoryCard(CategoryList model, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
    child: Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: model.icon!,
                height: 50,
                width: 50,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size_70,
          child: Text(
            model.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
  List<CategoryList> model,
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
