import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUtils {
  static final AppUtils _appUtils = AppUtils();

  static AppUtils get appUtilsInstance => _appUtils;

  // hide keyboard
  hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Future<bool> nothing() async {
    return false;
  }

  Future<void> showLoginAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: colors.overlayBG,
              ),
              height: 160,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Alert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Platform.isAndroid ? size_18 : size_20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Please login first to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colors.greyText,
                        fontSize: Platform.isAndroid ? size_12 : size_14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 90,
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
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              fontSize: Platform.isAndroid ? size_10 : size_12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90, // Increase button width
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
                          onPressed: () async {
                            Routes.navigateToSignInScreen(context);
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: Platform.isAndroid ? size_10 : size_12,
                            ),
                          ),
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
}
