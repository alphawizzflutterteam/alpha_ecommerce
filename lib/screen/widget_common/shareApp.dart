import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/routes.dart';
import '../../model/sharingApp.dart';

Future<void> share(context) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: colors.overlayBG,
            height: 200,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Share",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < sharingApp.length; i++)
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Routes.navigateToPreviousScreen(context);
                                    },
                                    child: Image.asset(
                                      sharingApp[i].appImage,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  sharingApp[i].appName,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    },
  );
}
