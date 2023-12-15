import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../utils/routes.dart';

categoryCard(
    {required BuildContext context,
    required categoryIndex,
    required categoryListIndex,
    required Childes model}) {
  return InkWell(
    onTap: () {
      Routes.navigateToCategoryDetailScreen(context);
    },
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: model.icon!,
            height: 70,
            width: 90,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.name!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
