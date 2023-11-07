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
              child: Image.asset(
                Images.logoHorizontal,
                height: 50,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Routes.navigateToSearchScreen(context);
                    },
                    child: const Icon(
                      Icons.search_outlined,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Routes.navigateToNotificationScreen(context);
                    },
                    child: const Icon(
                      Icons.notifications_on_sharp,
                      size: 25,
                    ),
                  ),
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
                    child: const Icon(Icons.arrow_back_ios)),
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
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: colors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Routes.navigateToSearchScreen(context);
                    },
                    child: const Icon(
                      Icons.search_outlined,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Routes.navigateToCartScreen(context);
                      // const BottomNavPage(index: 0);
                    },
                    child: const Icon(
                      Icons.shopping_cart_sharp,
                      size: 25,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
