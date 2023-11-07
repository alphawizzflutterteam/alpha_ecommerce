import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../widget_common/commonBackground.dart';

class PaySuccess extends StatefulWidget {
  const PaySuccess({Key? key}) : super(key: key);

  @override
  State<PaySuccess> createState() => _PaySuccessState();
}

class _PaySuccessState extends State<PaySuccess> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const CommonBackgroundPatternAuthWidget(),
      Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
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
                    "Lorem Ipsum is simply dummy text of the",
                    style: TextStyle(color: colors.lightTextColor, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "printing and typesetting industry",
                    style: TextStyle(color: colors.lightTextColor, fontSize: 16),
                  ),
                )
              ],
            ),
          ))
    ]);
  }
}
