import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/model/profile.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/profile/logOut/logOut.dart';
import 'package:flutter/material.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var name = SharedPref.shared.pref!.getString(PrefKeys.name) ??
        "Cameron Wiiliamson";
    var mobile =
        SharedPref.shared.pref!.getString(PrefKeys.mobile) ?? "9212716009";
    var mail = SharedPref.shared.pref!.getString(PrefKeys.email) ??
        "cameronwiiliamson@yyopmail.com";

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
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
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  DashboardHeader(),
                ],
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: colors.buttonColor,
                        padding: const EdgeInsets.only(left: 5),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipOval(
                                child: Image.asset(
                                  Images.human,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {
                                                Routes
                                                    .navigateToEditProfileScreen(
                                                        context);
                                              },
                                              child: const Icon(
                                                Icons.edit,
                                                color: colors.buttonColor,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.email_outlined,
                                          color: colors.lightTextColor,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          mail,
                                          style: const TextStyle(
                                              color: colors.lightTextColor,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone_outlined,
                                          color: colors.lightTextColor,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          mobile,
                                          style: const TextStyle(
                                              color: colors.lightTextColor,
                                              fontSize: 12),
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
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width * 0.3,
                    child: Container(
                      width: 150,
                      height: 25,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.alphaProfile,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "ALPHA Membership",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Routes.navigateToOrderScreen(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 100,
                              color: colors.overlayBG,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Images.order,
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            "My Order",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Routes.navigateToWishlistScreen(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 100,
                              color: colors.overlayBG,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Images.heart,
                                            height: 50,
                                            width: 50,
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            "My Wishlist",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 57 * profile.length.toDouble(),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: profile.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                if (profile[i].navigationScreen.runtimeType ==
                                    String) {
                                  logOut(context);
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            profile[i].navigationScreen),
                                  );
                                }
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ListTile(
                                      leading: Image.asset(
                                        profile[i].profileIcon,
                                        height: 30,
                                        width: 30,
                                      ),
                                      title: Text(
                                        profile[i].profileText,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
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
              )
            ],
          ),
        )
      ],
    );
  }
}
