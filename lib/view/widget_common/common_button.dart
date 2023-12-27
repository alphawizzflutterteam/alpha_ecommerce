import 'package:flutter/material.dart';
import '../../utils/color.dart';

class CommonButton extends StatelessWidget {
  final Function() onClick;
  final String text;
  final double fontSize;
  final bool? whitePrimary;
  const CommonButton(
      {Key? key,
      required this.text,
      required this.onClick,
      this.whitePrimary,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = whitePrimary ?? false;
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: ElevatedButton.styleFrom(
        primary: color ? Colors.white : colors.buttonColor,
        onPrimary: color ? colors.buttonColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
    );
  }
}
