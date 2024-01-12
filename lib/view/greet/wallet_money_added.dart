import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../profile/setting/showRateUs.dart';

class WalletSuccess extends StatefulWidget {
  const WalletSuccess({Key? key}) : super(key: key);

  @override
  State<WalletSuccess> createState() => _WalletSuccessState();
}

class _WalletSuccessState extends State<WalletSuccess> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Routes.navigateToDashboardScreen(context, 4);
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
              showAlertDialog(context);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image(
                        height: 100,
                        width: 150,
                        image: AssetImage(Images.tickSquare)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Money added to wallet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "successfully",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Platform.isAndroid ? size_14 : size_16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Platform.isAndroid ? size_14 : size_16),
                    ),
                  )
                ],
              ),
            ),
          ))
    ]);
  }
}
