import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';

class ReturnOrderPopup extends StatefulWidget {
  const ReturnOrderPopup({super.key});

  @override
  _ReturnOrderPopupState createState() => _ReturnOrderPopupState();
}

class _ReturnOrderPopupState extends State<ReturnOrderPopup> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors.overlayBG,
      ),
      height: 260,
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
          const Text(
            'Are you sure?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Are you sure, that you want to return Order',
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.greyText),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
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
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(fontSize: 12),
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Routes.navigateToPreviousScreen(context);
                    Routes.navigateToOrderReturnedDetailScreen(context);
                  },
                  child: const Text(
                    'RETURN ORDER',
                    style: TextStyle(fontSize: 12),
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
