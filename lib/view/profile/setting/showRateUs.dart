import 'package:flutter/material.dart';

import '../../rate_us/rate.dart';

Future<void> showAlertDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent, content: RateUs());
    },
  );
}