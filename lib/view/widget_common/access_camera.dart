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
                    const Text(
                      "Camera",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                    const Text("Gallery",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                )
              ],
            ),
          ));
    },
  );
}
