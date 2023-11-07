import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/constant.dart';
import '../widget_common/commonBackground.dart';
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            term1,
                            style: TextStyle(
                                color: colors.textColor, fontSize: 14),
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
                            style: TextStyle(
                                color: colors.textColor, fontSize: 14),
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
                            style: TextStyle(
                                color: colors.textColor, fontSize: 14),
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
