import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

deliveryCard({required context}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
    decoration: BoxDecoration(
      color: const Color(0x14E9E9E9),
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Image.asset(
                Images.freeDelivery,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Free Delivery",
                textAlign: TextAlign.center,
                style: TextStyle(color: colors.textColor),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80,
          child: Column(
            children: [
              Image.asset(
                Images.nonRefundable,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Non-\nRefundable",
                textAlign: TextAlign.center,
                style: TextStyle(color: colors.textColor),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Image.asset(
                Images.topBrand,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Top Brand",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Image.asset(
                Images.warranty,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Pay on Delivery",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
