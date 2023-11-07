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
                  children: const [
                    Icon(Icons.dark_mode),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Dark",
                      style: TextStyle(color: colors.textColor, fontSize: 18),
                    )
                  ],
                ),
                const Divider(
                  color: colors.dividerGrey,
                  height: 1,
                ),
                Row(
                  children: const [
                    Icon(Icons.light_mode),
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
