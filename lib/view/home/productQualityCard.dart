import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

productQualityCard() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 2,
          ),
          const SizedBox(
              width: 50,
              child: Text(
                "100% Original Product",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 2,
          ),
          const SizedBox(
              width: 50,
              child: Text(
                "100% Original Product",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Images.product,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 2,
          ),
          const SizedBox(
              width: 50,
              child: Text(
                "100% Original Product",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ],
  );
}
