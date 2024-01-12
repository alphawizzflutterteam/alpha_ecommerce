import 'dart:io';

import 'package:alpha_ecommerce_18oct/provider/theme_provider.dart';
import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';

Future<void> changeTheme(context) async {
  ThemeNotifier theme = Provider.of<ThemeNotifier>(context, listen: false);

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? colors.overlayBG
                : Colors.white,
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    theme.setThemeMode(ThemeMode.dark);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Images.darkTheme,
                        height: 25,
                        width: 25,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Dark",
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textColor
                                    : Colors.black,
                            fontSize: Platform.isAndroid ? size_16 : size_18),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: colors.dividerGrey,
                  height: 1,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    theme.setThemeMode(ThemeMode.light);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        size: 25,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Light",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textColor
                                  : Colors.black,
                              fontSize: Platform.isAndroid ? size_16 : size_18))
                    ],
                  ),
                ),
                SizedBox(
                  height: size_10,
                )
              ],
            ),
          ));
    },
  );
}
