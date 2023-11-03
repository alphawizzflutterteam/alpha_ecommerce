import 'package:flutter/material.dart';
import '../../../helper/color.dart';
import '../../../helper/constant.dart';
import '../../../helper/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../common_header.dart';

class ShippingPolicy extends StatefulWidget {
  const ShippingPolicy({Key? key}) : super(key: key);

  @override
  State<ShippingPolicy> createState() => _ShippingPolicyState();
}

class _ShippingPolicyState extends State<ShippingPolicy> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const LightBackGround(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                const ProfileHeader(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 35),
                    height: 100,
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
                                  right:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: const Text(
                                "Shipping & Delivery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            term1,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 30),
                            child: Text(
                              term2,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: colors.lightTextColor, fontSize: 14),
                            ),
                          ),
                          Text(
                            term3,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 30),
                            child: Text(
                              term4,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: colors.lightTextColor, fontSize: 14),
                            ),
                          ),
                          Text(
                            term3,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 30),
                            child: Text(
                              term4,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: colors.lightTextColor, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
