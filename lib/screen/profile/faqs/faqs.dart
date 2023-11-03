import 'package:flutter/material.dart';

import '../../../helper/color.dart';
import '../../../helper/constant.dart';
import '../../../helper/routes.dart';
import '../common_header.dart';

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.topRight,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: colors.darkBG,
        ),
      ),
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
                                  right: MediaQuery.of(context).size.width * 0.1),
                              child: const Text(
                                "Faqs",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 20),
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
