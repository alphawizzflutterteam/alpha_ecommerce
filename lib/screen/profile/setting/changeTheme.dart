import 'package:flutter/material.dart';

import '../../../helper/color.dart';

Future<void> changeTheme(context) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: const Color(0xff2D3438),
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
                  color: Color(0xff4A5054),
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
