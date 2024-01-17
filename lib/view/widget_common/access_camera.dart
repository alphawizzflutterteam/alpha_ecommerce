import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/images.dart';

Future<void> accessCamera(context) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: colors.overlayBG,
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Images.camera,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Camera",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontSize: Platform.isAndroid ? size_17 : size_18),
                    )
                  ],
                ),
                const Divider(
                  color: colors.dividerGrey,
                  height: 1,
                ),
                Row(
                  children: [
                    Image.asset(
                      Images.gallery,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("Gallery",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                            fontSize: Platform.isAndroid ? size_17 : size_18))
                  ],
                )
              ],
            ),
          ));
    },
  );
}
