import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

deliveryCard({required context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0x14E9E9E9)
          : Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Image.asset(Images.freeDelivery,
                  height: 30,
                  width: 30,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Free Delivery",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80,
          child: Column(
            children: [
              Image.asset(Images.nonRefundable,
                  height: 30,
                  width: 30,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Non -\nRefundable",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Image.asset(Images.topBrand,
                  height: 30,
                  width: 30,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Top Brand",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Image.asset(Images.warranty,
                  height: 30,
                  width: 30,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Pay on Delivery",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
