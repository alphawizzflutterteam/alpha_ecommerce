import 'package:flutter/material.dart';
import '../../utils/color.dart';

specificationCard({required context}) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 10, vertical: 10),
    margin: const EdgeInsets.symmetric(
        horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: const Color(0x14E9E9E9),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Specification",
          style:
          TextStyle(color: Colors.white, fontSize: 14),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Weight",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "190 MI",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Made IN",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "India",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Warranty",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "1 year",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Guarantee",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "1 year",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Refundable",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "1 Days",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Warranty",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "1 year",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cancellable",
              style: TextStyle(
                  color: colors.greyText, fontSize: 12),
            ),
            Text(
              "Till received",
              style: TextStyle(
                  color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}
