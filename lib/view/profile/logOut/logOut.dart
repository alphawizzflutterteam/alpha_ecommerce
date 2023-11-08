import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';

Future<void> logOut(context) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: colors.overlayBG,
              ),
              height: 250,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        Images.iconBG,
                        width: 80,
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          Images.logOutSystem,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Are you sure, that you want to logout?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colors.greyText, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return colors.buttonColor;
                              }
                              return Colors.transparent; // Default color
                            }),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            side: MaterialStateProperty.all(const BorderSide(
                                color: Colors.white, width: 1)),
                          ),
                          onPressed: () {
                            Routes.navigateToPreviousScreen(context);
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return colors.buttonColor;
                              }
                              return colors.buttonColor;
                            }),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'LOGOUT',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
    },
  );
}
