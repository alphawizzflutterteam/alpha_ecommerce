import 'package:alpha_ecommerce_18oct/helper/images.dart';
import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';

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
        color: const Color(0xFF2D3438),
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
            'Do you want to remove this from your cart?',
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.greyText, fontSize: 14),
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
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(fontSize: 12),
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
                  child: const Text(
                    'REMOVE',
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
