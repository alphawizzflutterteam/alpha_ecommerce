import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/shareApp.dart';
import '../common_header.dart';

class ViewAllReferall extends StatefulWidget {
  const ViewAllReferall({Key? key}) : super(key: key);

  @override
  State<ViewAllReferall> createState() => _ViewAllReferallState();
}

class _ViewAllReferallState extends State<ViewAllReferall> {
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
                                "Referall Member",
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
                    SizedBox(
                      height: 80 * 20,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0x6B969696),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "AS",
                                              style: TextStyle(
                                                color: Colors
                                                    .white, // Set the text color
                                                fontSize:
                                                    14, // Set the text size
                                                fontWeight: FontWeight
                                                    .bold, // Set the text weight
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Anshul Sharma",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("02 oct 2022",
                                                style: TextStyle(
                                                    color:
                                                        colors.lightTextColor,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "200",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Divider(
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ],
                            ),
                          );
                        },
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
