import 'package:flutter/material.dart';
import '../../utils/color.dart';

class CommonRadioTile extends StatelessWidget {
  final String options;
  final String name;
  final Function(String) onChanged;
  const CommonRadioTile({
    Key? key,
    required this.options,
    required this.name,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        title: Text(
          name,
          style: const TextStyle(
            color: colors.textColor,
            fontSize: 14,
          ),
          softWrap: false,
        ),
        activeColor: colors.buttonColor,
        value: name,
        groupValue: options,
        onChanged: (value) {
          onChanged(value.toString());
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}
