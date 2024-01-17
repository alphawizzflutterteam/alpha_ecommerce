import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

class CommonBackgroundAuthWidget extends StatelessWidget {
  const CommonBackgroundAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        image: const AssetImage(Images.bgColor));
  }
}

class CommonBackgroundPatternAuthWidget extends StatelessWidget {
  const CommonBackgroundPatternAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        image: const AssetImage(Images.bgPattern));
  }
}

class DarkBackGround extends StatelessWidget {
  const DarkBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: colors.bodyBackgroundDark,
      ),
    );
  }
}

class LightBackGround extends StatelessWidget {
  const LightBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: colors.bodyBackgroundDark,
      ),
    );
  }
}
