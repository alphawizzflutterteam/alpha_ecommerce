import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              Images.headerBGLine,
              fit: BoxFit.contain,
            ),
            Image.asset(
              Images.commonHeader,
              fit: BoxFit.contain,
            ),
          ],
        ));
  }
}
