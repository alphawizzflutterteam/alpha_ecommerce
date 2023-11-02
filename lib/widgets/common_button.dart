import 'package:flutter/material.dart';
import '../helper/color.dart';

class CommonButton extends StatelessWidget {
  final Function onClick;
  final String text;
  const CommonButton({Key? key, required this.text, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: ElevatedButton.styleFrom(
        primary: colors.buttonColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text('Verify', style: TextStyle(fontSize: 18)),
    );
  }
}
