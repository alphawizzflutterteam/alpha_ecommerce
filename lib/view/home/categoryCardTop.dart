import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:flutter/material.dart';

categoryCardTop() {
  return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(children: [
        Icon(Icons.category),
        SizedBox(
          width: 5,
        ),
        Text(
          "Categories",
          style: TextStyle(color: colors.textColor),
        )
      ]));
}
