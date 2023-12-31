import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/coupon/model/couponListModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/toast_message.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';

couponCard({required context, required CouponList coupon}) {
  DateTime parseDate =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(coupon.expireDate);

  return Container(
    height: 170,
    width: MediaQuery.of(context).size.width * 0.98,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: Colors.yellow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  coupon.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                Images.offer,
                height: 20,
                width: 20,
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            border: Border.all(
              color: colors.boxBorder,
            ),
            color: Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coupon.title,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // const Text(
              //   'Your One-Stop Grocery Destination!',
              //   style: TextStyle(color: Colors.white, fontSize: 12),
              // ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${coupon.discount}%",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expires',
                        style: TextStyle(color: colors.greyText, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${parseDate.day} ${getMonth(parseDate.month.toString())} ${parseDate.year}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: coupon.code));
                      Utils.showFlushBarWithMessage(
                          "Alert", "Coupon Copied", context);

                      // showToastMessage("Coupon Copied");
                    },
                    child: DottedBorder(
                      color: colors.greyText,
                      strokeWidth: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.file_copy,
                                color: Colors
                                    .white), // Replace with your desired icon
                            Text(
                              coupon.code,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

String getMonth(String day) {
  switch (day) {
    case "1":
      return "Jan";
    case "2":
      return "Feb";
    case "3":
      return "March";
    case "4":
      return "April";
    case "5":
      return "May";
    case "6":
      return "June";
    case "7":
      return "July";
    case "8":
      return "Aug";
    case "9":
      return "Sep";
    case "10":
      return "Oct";
    case "11":
      return "Nov";
    case "12":
      return "Dec";
  }
  return "";
}
