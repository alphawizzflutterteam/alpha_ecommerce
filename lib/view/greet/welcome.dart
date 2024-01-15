import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Routes.navigateToDashboardScreen(context, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        color: colors.buttonColor,
        child: Image(
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
            image: const AssetImage(Images.success)),
      ),
      Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Routes.navigateToSubscribeScreen(context, true);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(Images.happy)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Alphawizz e-commerce",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontSize: Platform.isAndroid ? size_18 : size_20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 5),
                  //   child: Text(
                  //     "Welcome's you",
                  //     style: Theme.of(context)
                  // .textTheme
                  // .titleSmall!
                  // .copyWith(

                  //         color: Colors.white,
                  //         fontSize: Platform.isAndroid ? size_18 : size_20,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Unlock Your World: Seamless Access to Orders,Wishlists, and Tailored Recommendations Wishlists, and Tailored Recommendations",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                            fontSize: Platform.isAndroid ? size_15 : size_17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
    ]);
  }
}
