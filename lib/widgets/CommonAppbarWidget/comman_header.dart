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
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                Images.headerBGLine,
                color: Theme.of(context).brightness == Brightness.dark
                    ? null
                    : Colors.white54,
                // width: MediaQuery.of(context).size.width * .8,
              ),
            ),
            Theme.of(context).brightness == Brightness.dark
                ? Image.asset(
                    Images.commonHeader,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                  )
                : Container(),
          ],
        ));
  }
}

class InternalDetailPageHeader extends StatelessWidget {
  final String text;
  const InternalDetailPageHeader({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 45),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // Routes.navigateToPreviousScreen(context);
                  Navigator.pop(context, true);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
