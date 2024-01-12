import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';

class DeletePopup extends StatefulWidget {
  final dynamic delete;
  const DeletePopup({Key? key, required this.delete}) : super(key: key);

  @override
  State<DeletePopup> createState() => _DeletePopupState();
}

class _DeletePopupState extends State<DeletePopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors.overlayBG,
      ),
      height: 280,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                Images.iconBG,
                width: 80,
                height: 80,
              ),
              Image.asset(
                Images.delete,
                width: 80,
                height: 80,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Are you sure?',
            style: TextStyle(
              color: Colors.white,
              fontSize: Platform.isAndroid ? size_18 : size_20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Do you want to remove this from your cart?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colors.greyText,
                fontSize: Platform.isAndroid ? size_12 : size_14),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 90,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return colors.buttonColor;
                      }
                      return Colors.transparent; // Default color
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.white, width: 1)),
                  ),
                  onPressed: () {
                    Routes.navigateToPreviousScreen(context);
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: Platform.isAndroid ? size_10 : size_12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 90, // Increase button width
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return colors.buttonColor;
                      }
                      return colors.buttonColor;
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      widget.delete();
                    });
                  },
                  child: Text(
                    'REMOVE',
                    style: TextStyle(
                      fontSize: Platform.isAndroid ? size_10 : size_12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
