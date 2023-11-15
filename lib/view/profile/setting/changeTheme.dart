import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';

Future<void> changeTheme(context) async {
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
                      Images.darkTheme,
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Dark",
                      style: TextStyle(color: colors.textColor, fontSize: 18),
                    )
                  ],
                ),
                Divider(
                  color: colors.dividerGrey,
                  height: 1,
                ),
                Row(
                  children: [
                    Image.asset(
                      Images.lightTheme,
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Light",
                        style: TextStyle(color: colors.textColor, fontSize: 18))
                  ],
                )
              ],
            ),
          ));
    },
  );
}
