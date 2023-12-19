import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/color.dart';

class WriteReviewPopup extends StatefulWidget {
  final String order_id;

  const WriteReviewPopup({super.key, required this.order_id});

  @override
  _WriteReviewPopupState createState() => _WriteReviewPopupState();
}

class _WriteReviewPopupState extends State<WriteReviewPopup> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors.overlayBG,
      ),
      height: MediaQuery.of(context).size.height * 0.43,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Write Review",
                    style: TextStyle(color: colors.textColor, fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Routes.navigateToPreviousScreen(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Review',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 25,
            itemPadding: const EdgeInsets.only(right: 5),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.orange,
            ),
            onRatingUpdate: (newRating) {
              rating = newRating;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Description',
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.textColor),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 3,
            style: const TextStyle(color: colors.textColor, fontSize: 12),
            decoration: InputDecoration(
              filled: true,
              fillColor: colors.textFieldBG,
              hintText: "Write here...",
              hintStyle:
                  const TextStyle(color: colors.lightTextColor, fontSize: 12),
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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
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
                  Routes.navigateToOrderCancelledScreen(
                      context, widget.order_id);
                },
                child: const Text(
                  'Submit Review',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
