import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';

InputDecoration commonInputDecoration({
  String labelText = '',
  String hintText = '',
  Color? color,
}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    fillColor: colors.textFieldBG,
    labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(
      color: colors.labelColor,
      fontSize: Platform.isAndroid ? size_12 : size_14,
    ),
    // hintStyle: Theme.of(context!).textTheme.titleSmall!.copyWith(
    //       color: colors.labelColor,
    //     ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: colors.textFieldColor,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: colors.textFieldColor,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: colors.textFieldColor,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: colors.textFieldColor,
        width: 1,
      ),
    ),
  );
}
