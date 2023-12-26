import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';

class PaySuccess extends StatefulWidget {
  const PaySuccess({Key? key}) : super(key: key);

  @override
  State<PaySuccess> createState() => _PaySuccessState();
}

class _PaySuccessState extends State<PaySuccess> {
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
          body: const Center(
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
                    "Order Placed Successfully",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "",
                    style:
                        TextStyle(color: colors.lightTextColor, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "",
                    style:
                        TextStyle(color: colors.lightTextColor, fontSize: 16),
                  ),
                )
              ],
            ),
          ))
    ]);
  }
}
