import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../helper/color.dart';

Future<Future<bool?>> showToastMessage(text) async {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      backgroundColor: colors.buttonColor,
      textColor: Colors.white,
      fontSize: 16.0);
}


