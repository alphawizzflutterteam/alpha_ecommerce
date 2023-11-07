import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';
import '../widget_common/commonBackground.dart';

class WalletSuccess extends StatefulWidget {
  const WalletSuccess({Key? key}) : super(key: key);

  @override
  State<WalletSuccess> createState() => _WalletSuccessState();
}

class _WalletSuccessState extends State<WalletSuccess> {
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
                    "Lorem Ipsum is simply dummy text of the",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "printing and typesetting industry",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ))
    ]);
  }
}
