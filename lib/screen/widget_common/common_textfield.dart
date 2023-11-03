import 'package:flutter/material.dart';
import '../../helper/color.dart';

InputDecoration commonInputDecoration(
    {String labelText = '', String hintText = '', Color? color}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    fillColor: colors.textFieldBG,
    labelText: labelText,
    hintText: hintText,
    labelStyle: const TextStyle(
      color: colors.labelColor,
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      color: colors.labelColor,
    ),
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


