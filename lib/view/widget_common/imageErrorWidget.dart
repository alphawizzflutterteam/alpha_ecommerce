import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.defaultProductImg,
    );
  }
}
