import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/constant.dart';
import '../../widgets/commonBackground.dart';
import '../profile/common_header.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({Key? key}) : super(key: key);

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
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
                    height: 110,
                    child: const Center(
                      child: Text(
                        "Term & Condition",
                        style: TextStyle(
                            color: colors.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
                          horizontal: 25, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            term1,
                            style: TextStyle(color: colors.textColor, fontSize: 14),
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
                            style: TextStyle(color: colors.textColor, fontSize: 14),
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
                            style: TextStyle(color: colors.textColor, fontSize: 14),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: colors.textFieldBG,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Routes.navigateToPreviousScreen(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: colors.buttonColor,
                              onPrimary: colors.textColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('AGREE',
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
