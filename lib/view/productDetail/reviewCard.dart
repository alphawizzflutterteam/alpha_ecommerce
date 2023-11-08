import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/images.dart';

reviewCard({required rating}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Review",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Images.profile),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Customer Name",
                  style: TextStyle(color: Colors.white),
                ),
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.only(right: 5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onRatingUpdate: (newRating) {
                    rating = newRating;
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.white,
          height: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Images.profile),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Customer Name",
                  style: TextStyle(color: Colors.white),
                ),
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.only(right: 5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onRatingUpdate: (newRating) {
                    rating = newRating;
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  );
}
