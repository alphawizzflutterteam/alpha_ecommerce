import 'package:flutter/material.dart';

productForUText(BuildContext ctx) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    alignment: Alignment.centerLeft,
    child: Text(
      "Product for you",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Theme.of(ctx).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
    ),
  );
}

spaceOfHeight({double? height}) {
  return SizedBox(
    height: height ?? 10,
  );
}
