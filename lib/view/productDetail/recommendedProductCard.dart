import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

recommendedProductCard({required context}) {
  return Container(
    height: 230,
    padding: const EdgeInsets.symmetric(
        horizontal: 20, vertical: 15),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                    Radius.circular(10)),
                gradient: const LinearGradient(
                  colors: [
                    colors.boxGradient1,
                    colors.boxBorder,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                border:
                Border.all(color: colors.boxBorder)),
            width: MediaQuery.of(context).size.width * 0.42,
            height: 200,
            child: Center(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      Images.powder,
                      height: 120,
                    ),
                  ),
                  const Text(
                    "25% Off",
                    style: TextStyle(
                        color: Colors.orange, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Oats Fitness",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Text(
                        "\$200",
                        style: TextStyle(
                          color: colors.lightTextColor,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$120.00",
                        style: TextStyle(
                          color: colors.buttonColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
