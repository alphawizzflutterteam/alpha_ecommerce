import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
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
    print(Theme.of(context).brightness);
    return Material(
      color: Colors.transparent,
      child: RadioListTile(
        title: Text(
          widget.name,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: widget.color,
                fontSize: Platform.isAndroid ? size_12 : size_14,
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
    );
  }
}
