import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';

class WriteReviewPopup extends StatefulWidget {
  final String order_id;
  final String product_id;
  final double rating;

  const WriteReviewPopup(
      {super.key,
      required this.order_id,
      required this.product_id,
      required this.rating});

  @override
  _WriteReviewPopupState createState() => _WriteReviewPopupState();
}

class _WriteReviewPopupState extends State<WriteReviewPopup> {
  late double rating;
  final _formKey = GlobalKey<FormState>();
  late OrderViewModel reviewProvider;
  final TextEditingController reviewCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    rating = widget.rating;
    reviewProvider = Provider.of<OrderViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    reviewProvider = Provider.of<OrderViewModel>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.overlayBG
            : Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Write Review",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.textColor
                              : Colors.black,
                          fontSize: Platform.isAndroid ? size_18 : size_20),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Routes.navigateToPreviousScreen(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Review',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.textColor
                        : Colors.black,
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
            Text(
              'Description',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.textColor
                        : Colors.black,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: reviewCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please write a review";
                } else
                  return null;
              },
              maxLines: 3,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.textColor
                        : Colors.black,
                    fontSize: Platform.isAndroid ? size_10 : size_12,
                  ),
              maxLength: 120,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? colors.textFieldBG
                    : Colors.white,
                hintText: "Write here...",
                hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: colors.lightTextColor,
                      fontSize: Platform.isAndroid ? size_10 : size_12,
                    ),
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
              height: size_20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
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
                    if (_formKey.currentState!.validate()) {
                      print(rating);
                      print(reviewCtrl.text);
                      print(widget.order_id);
                      print(widget.product_id);
                      reviewProvider.postOrderReviewRequest(
                          order_id: widget.order_id,
                          comment: reviewCtrl.text,
                          rating: rating.toString(),
                          product_id: widget.product_id,
                          context: context);
                    }
                    // Routes.navigateToPreviousScreen(context);
                    // Routes.navigateToOrderCancelledScreen(
                    //     context, widget.order_id);
                  },
                  child: Text(
                    'Submit Review',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.textColor
                              : Colors.white,
                          fontSize: Platform.isAndroid ? size_10 : size_12,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
