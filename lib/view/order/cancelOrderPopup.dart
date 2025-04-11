import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';

class CancelOrderPopup extends StatefulWidget {
  final String order_id;
  final String reason;

  const CancelOrderPopup(
      {super.key, required this.order_id, required this.reason});

  @override
  _CancelOrderPopupState createState() => _CancelOrderPopupState();
}

class _CancelOrderPopupState extends State<CancelOrderPopup> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    var pInstance = Provider.of<OrderViewModel>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.overlayBG
            : Colors.white,
      ),
      height: 270,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  Images.cancelOrder,
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Are you sure?',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: Platform.isAndroid ? size_18 : size_20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Are you sure, that you want to Cancel Order?',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: colors.greyText),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
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
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: Platform.isAndroid ? size_10 : size_12,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await pInstance.cancelOrder(
                        order_id: widget.order_id,
                        reason: widget.reason,
                        context: context);
                  },
                  child: Text(
                    'CANCEL ORDER',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: Platform.isAndroid ? size_10 : size_11,
                        color: Colors.white),
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
