import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/model/profile.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/logOut/logOut.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import 'common_header.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late HomeViewModel homeProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken) ?? "";
  var name = "";
  var phone = "";
  var image = "";
  var loyaltyPoint = "";
  var walletBalance = "";
  bool iisSubscribed = false;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
  }

  setProfile() {
    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    ProfileModel user = ProfileModel.fromJson(model);
    name = user.data[0].fName;
    phone = user.data[0].phone;
    image = user.data[0].image;
    loyaltyPoint = user.data[0].loyaltyPoint;
    walletBalance = user.data[0].walletBalance.toString();
    iisSubscribed = user.data[0].isSubscribed == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);
    if (token.isEmpty) {
    } else {
      setProfile();
    }
    return Stack(
      children: [
        const LightBackGround(),
        RefreshIndicator(
          color: colors.buttonColor,
          backgroundColor: Colors.white,
          displacement: 40.0,
          strokeWidth: 2.0,
          semanticsLabel: 'Pull to refresh',
          semanticsValue: 'Refresh',
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));

            setProfile();
            setState(() {});
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            extendBody: true,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Routes.navigateToChatScreen(context);
              },
              backgroundColor: colors.buttonColor,
              child: Image.asset(
                Images.chat,
                height: 40,
                width: 40,
              ),
            ),
            body: token == "" || token == null
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size_200,
                        ),
                        Text(
                          "Please login First to continue",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: size_20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.hovered) ||
                                    states.contains(MaterialState.pressed)) {
                                  return colors.buttonColor;
                                }
                                return colors.buttonColor;
                              }),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              SharedPref.shared.pref
                                  ?.setString(PrefKeys.mobile, "");
                              SharedPref.shared.pref
                                  ?.setString(PrefKeys.isLoggedIn, "0");
                              SharedPref.shared.pref
                                  ?.setString(PrefKeys.jwtToken, "");

                              Routes.navigateToSignInScreen(context);
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.transparent
                            : colors.buttonColor,
                        child: const Stack(
                          children: [
                            ProfileHeader(),
                            DashboardHeader(),
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.buttonColor
                            : const Color(0xFFE1F4F4),
                        child: Stack(
                          // fit: StackFit.passthrough,
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(Images.semicircles),
                              height: MediaQuery.of(context).size.height * .075,
                              // width: MediaQuery.of(context).size.width * .1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 15, left: 15, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size_85, // Set your desired width
                                    height: size_85, // Set your desired height
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: image,
                                        fit: BoxFit.fill,
                                        errorWidget: (context, url, error) =>
                                            ClipOval(
                                          child: Image.asset(
                                            Images.defaultProfile,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize:
                                                            Platform.isAndroid
                                                                ? size_16
                                                                : size_18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                padding:
                                                    const EdgeInsets.all(2),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: InkWell(
                                                    highlightColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      Routes
                                                          .navigateToEditProfileScreen(
                                                              context);
                                                    },
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: colors.buttonColor,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            phone,
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              // SizedBox(
                                              //   height: MediaQuery.of(context)
                                              //           .size
                                              //           .height *
                                              //       .025,
                                              //   child: Image.asset(
                                              //     Images.coin,
                                              //   ),
                                              // ),
                                              // VerticalDivider(
                                              //   color: Colors.transparent,
                                              //   width: 4,
                                              // ),
                                              // Text(
                                              //   loyaltyPoint,
                                              //   style: Theme.of(context)
                                              // .textTheme
                                              // .titleSmall!
                                              // .copyWith(

                                              //     color: Theme.of(context)
                                              //                 .brightness ==
                                              //             Brightness.dark
                                              //         ? Colors.white
                                              //         : Colors.black,
                                              //     Platform.isAndroid ? size_14 : size_16,
                                              //     fontWeight: FontWeight.bold,
                                              //   ),
                                              // ),
                                              // VerticalDivider(
                                              //   color: Colors.transparent,
                                              //   width: 10,
                                              // ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                child: Image.asset(
                                                  Images.wallet,
                                                ),
                                              ),
                                              VerticalDivider(
                                                color: Colors.transparent,
                                                width: 4,
                                              ),
                                              Text(
                                                walletBalance,
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
                                                              : size_14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 15,
                            ),
                            !iisSubscribed
                                ? Container()
                                : Positioned(
                                    bottom: 0,
                                    left:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Container(
                                      width: 150,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Images.alphaProfile,
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "ALPHA Membership",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontSize: Platform.isAndroid
                                                      ? size_10
                                                      : size_12,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                  color: Colors.transparent, height: size_20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: size_10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Routes.navigateToOrderScreen(context);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .12,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.overlayBG
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark
                                              ? null
                                              : Border.all(
                                                  color: colors.lightBorder),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Visibility(
                                                visible: false,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "8",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                            color: Colors.white,
                                                            fontSize: Platform
                                                                    .isAndroid
                                                                ? size_8
                                                                : size_10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    Images.order,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .05,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                  Text(
                                                    "My Orders",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize:
                                                              Platform.isAndroid
                                                                  ? size_12
                                                                  : size_14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Routes.navigateToWishlistScreen(
                                            context);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .12,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.overlayBG
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Theme.of(context)
                                                      .brightness ==
                                                  Brightness.dark
                                              ? null
                                              : Border.all(
                                                  color: colors.lightBorder),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  Images.heart,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .05,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                Text(
                                                  "My Wishlist",
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
                                                                : size_14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: Colors.transparent, height: 5),
                              SizedBox(
                                height: 57 * profile.length.toDouble(),
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Color(0xFF4A5054)
                                        : Colors.grey,
                                    height: 1,
                                  ),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: profile.length,
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        if (profile[i]
                                                .navigationScreen
                                                .runtimeType ==
                                            String) {
                                          if (profile[i].profileText ==
                                              "Logout") {
                                            logOut(context);
                                          } else {
                                            deleteAccount(
                                                context, homeProvider);
                                          }
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => profile[i]
                                                    .navigationScreen),
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: ListTile(
                                          leading: Image.asset(
                                            profile[i].profileIcon,
                                            height: 30,
                                            width: 30,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                          title: Text(
                                            profile[i].profileText,
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
                                                        : size_14),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        )
      ],
    );
  }
}
