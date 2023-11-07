import 'package:flutter/material.dart';

productForUText() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    alignment: Alignment.centerLeft,
    child: const Text(
      "Product for you",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    ),
  );
}

spaceOfHeight({double? height}) {
  return SizedBox(
    height: height ?? 10,
  );
}
