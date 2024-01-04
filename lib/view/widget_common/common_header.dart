import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import 'commonTextStyle.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 35),
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Theme.of(context).brightness == Brightness.dark
                  ? Image.asset(
                      Images.logoHorizontal,
                      height: 50,
                      width: 120,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.asset(
                      "assets/images/Group 233.png",
                      height: 50,
                      width: 120,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Routes.navigateToSearchScreen(context);
                      },
                      child: Image.asset(
                        Images.search,
                        height: 25,
                        width: 25,
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                      onTap: () {
                        Routes.navigateToNotificationScreen(context);
                      },
                      child: Image.asset(
                        Images.notification,
                        height: 25,
                        width: 25,
                      )),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class InternalPageHeader extends StatelessWidget {
  final String text;
  const InternalPageHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 35),
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                    onTap: () {
                      Routes.navigateToPreviousScreen(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white)),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: HeaderText(text: text)),
              ),
            ],
          ),
        ),
      ),
    );
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
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 35),
        height: 100,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: InkWell(
                onTap: () {
                  Routes.navigateToPreviousScreen(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Visibility(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Routes.navigateToSearchScreen(context);
                      },
                      child: Image.asset(
                        Images.search,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Routes.navigateToBottomNavScreen(
                            context, 0); // const BottomNavPage(index: 0);
                      },
                      child: Image.asset(
                        Images.headerCart,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
