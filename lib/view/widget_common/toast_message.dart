import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/color.dart';

Future<Future<bool?>> showToastMessage(text) async {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      backgroundColor: colors.buttonColor,
      textColor: Colors.white,
      fontSize: Platform.isAndroid ? size_14 : size_16);
}
