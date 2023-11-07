import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

secondCategoryCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
            ),
            Image.asset(
              Images.homeBG,
              height: 70,
              width: 70,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
