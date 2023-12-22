import 'dart:convert';

import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/shareApp.dart';
import '../common_header.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  late ProfileModel user;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    user = ProfileModel.fromJson(model);
  }

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
                                "Refer and Earn",
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
                      width: double.infinity,
                      color: colors.boxBorder,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.refer,
                            height: 100,
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.monetization_on,
                                    color: Colors.yellow),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  user.data[0].loyaltyPoint,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            "Referral Points",
                            style: TextStyle(
                                color: colors.lightTextColor, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: DottedBorder(
                                color: Colors.white,
                                strokeWidth: 1,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    color: const Color(0xA6064848),
                                    borderRadius: BorderRadius.circular(
                                        10), // Adjust the radius as needed
                                    // border: Border.all(
                                    //   color: Colors.white,
                                    //   width: 1, // Border width
                                    // ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            const Text(
                                              "You referral code",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              user.data[0].referralCode,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                          thickness: 3,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: user
                                                        .data[0].referralCode));
                                            Utils.showFlushBarWithMessage(
                                                "Alert",
                                                "Referral Code Copied.",
                                                context);
                                          },
                                          child: Text(
                                            "Copy\nCode",
                                            style: TextStyle(
                                                fontSize: 12,
                                                height: 1.5,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              share(context, user.data[0].referralCode);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.ios_share_outlined,
                                  color: Colors.orange,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Share Code",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Referall Member & Amount",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              Routes.navigateToViewAllReferallScreen(context);
                            },
                            child: const Text(
                              "View all",
                              style: TextStyle(
                                  color: colors.buttonColor, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 85 * 3,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
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
                                          width:
                                              40, // Set the width and height to create a circular shape
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape
                                                .circle, // Make the container circular
                                            color: Color(
                                                0x6B969696), // Set the background color
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
