import 'package:flutter/material.dart';
import '../../utils/color.dart';

class CommonRadioTile extends StatefulWidget {
  final String options;
  final String name;
  final Color color;
  final Function(String) onChanged;
  const CommonRadioTile({
    Key? key,
    required this.options,
    required this.name,
    required this.onChanged,
    required this.color,
  }) : super(key: key);

  @override
  State<CommonRadioTile> createState() => _CommonRadioTileState();
}

class _CommonRadioTileState extends State<CommonRadioTile> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: RadioListTile(
          title: Text(
            widget.name,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 14,
            ),
            softWrap: false,
          ),
          activeColor: colors.buttonColor,
          value: widget.name,
          groupValue: widget.options,
          onChanged: (value) {
            widget.onChanged(value.toString());
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
    );
  }
}
