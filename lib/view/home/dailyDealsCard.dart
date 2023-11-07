import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

dailyDealCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Image.asset(
      Images.bestOffer,
      height: 130,
      width: 130,
    ),
  );
}
