import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              Images.headerBGLine,
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : Colors.white54,
              width: MediaQuery.of(context).size.width,
            ),
            Theme.of(context).brightness == Brightness.dark
                ? Image.asset(
                    Images.commonHeader,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  )
                : Container(),
          ],
        ));
  }
}
