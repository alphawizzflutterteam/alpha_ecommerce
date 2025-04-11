import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/referralModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/shareApp.dart';
import '../common_header.dart';
import 'package:intl/intl.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  late ProfileModel user;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ProfileViewModel profileProvider;
  var dateFormat = DateFormat('yMEd');

  @override
  void initState() {
    super.initState();
    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    user = ProfileModel.fromJson(model);
    profileProvider = Provider.of<ProfileViewModel>(context, listen: false);
    profileProvider.getReferralData(context);
  }

  @override
  Widget build(BuildContext context) {
    profileProvider = Provider.of<ProfileViewModel>(context);
    return Stack(children: [
      const LightBackGround(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : Colors.white,
        body: Column(
          children: [
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.transparent
                  : colors.buttonColor,
              child: Stack(
                children: [
                  const ProfileHeader(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      height: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Routes.navigateToPreviousScreen(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.1),
                                child: Text(
                                  "Refer and Earn",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize: Platform.isAndroid
                                              ? size_18
                                              : size_20),
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.boxBorder
                          : const Color(0xFFCEEAEA).withOpacity(0.8),
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
                                Image.asset(
                                  Images.coin,
                                  height: 28,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  user.data[0].loyaltyPoint,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Referral Points",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                    height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: DottedBorder(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : const Color(0xFF0A9494),
                                strokeWidth: 1,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color(0xA6064848)
                                        : Colors.white,
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
                                            Text(
                                              "You referral code",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    fontSize: Platform.isAndroid
                                                        ? size_8
                                                        : size_10,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : colors.greyText,
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              user.data[0].referralCode,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? size_18
                                                              : size_20,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: Platform.isAndroid
                                                      ? size_10
                                                      : size_12,
                                                  height: 1.5,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
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
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              share(context, user.data[0].referralCode);
                            },
                            child: Row(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Colors.orange,
                                          fontSize: Platform.isAndroid
                                              ? size_14
                                              : size_16),
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
                          Text(
                            "Referall Member & Amount",
                            style:
                                Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: Platform.isAndroid
                                            ? size_16
                                            : size_18),
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Routes.navigateToViewAllReferallScreen(
                                  context, profileProvider.referralList);
                            },
                            child: Text(
                              "View all",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: colors.buttonColor,
                                      fontSize: Platform.isAndroid
                                          ? size_12
                                          : size_14,
                                      fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 85 * 3,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: profileProvider.referralList.length,
                        separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 20),
                          color: Colors.grey.withOpacity(0.7),
                          height: .5,
                        ),
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
                                          child: Center(
                                            child: Text(
                                              "AS",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors
                                                            .black, // Set the text color
                                                    fontSize:
                                                        14, // Set the text size
                                                    fontWeight: FontWeight
                                                        .bold, // Set the text weight
                                                  ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              profileProvider
                                                  .referralList[i].description
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? size_12
                                                              : size_14),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                profileProvider
                                                    .referralList[i].createdAt
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      color:
                                                          colors.lightTextColor,
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? size_10
                                                              : size_12,
                                                    ))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      profileProvider.referralList[i].balance
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14,
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
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
