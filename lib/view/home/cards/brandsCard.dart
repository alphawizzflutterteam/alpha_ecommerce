import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

brandCard(BrandsList model, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10, bottom: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: model.image,
              height: size_50,
              fit: BoxFit.fill,
              placeholder: (context, url) => appLoader(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: size_5,
          ),
          Text(
            model.name,
            style: const TextStyle(color: Colors.black, fontSize: size_10),
          )
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
