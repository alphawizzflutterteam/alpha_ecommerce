import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:flutter/material.dart';

notificationCard(Map<String, dynamic> notifications) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(
      height: 5,
    ),
    SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            notifications['image'],
            width: 60,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifications['text'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      notifications['subText'],
                      style: const TextStyle(
                        color: colors.greyText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifications['date'],
                  style: const TextStyle(
                    color: colors.greyText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: Colors.white,
        height: 1,
      ),
    ),
  ]);
}
