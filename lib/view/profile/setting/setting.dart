import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/profile/setting/changeTheme.dart';
import 'package:alpha_ecommerce_18oct/view/profile/setting/selectCurrency.dart';
import 'package:alpha_ecommerce_18oct/view/profile/setting/selectLanguage.dart';
import 'package:alpha_ecommerce_18oct/view/profile/setting/showRateUs.dart';
import 'package:flutter/material.dart';
import '../../../model/setting.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_header.dart';
import '../../widget_common/shareApp.dart';
import '../common_header.dart';
import 'changePassword.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<SettingList> settings = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = [
      // SettingList(
      //     settingIcon: Images.currency,
      //     settingName: 'Currency',
      //     nextNavigation: false,
      //     navigationPage: () => currency(context)),
      SettingList(
          settingIcon: Images.star,
          settingName: 'Rate Us',
          nextNavigation: false,
          navigationPage: () => showAlertDialog(context)),
      SettingList(
          settingIcon: Images.shareApp,
          settingName: 'Share',
          nextNavigation: false,
          navigationPage: () => share(context, "")),
      SettingList(
          settingIcon: Images.changePassword,
          settingName: 'Change Password',
          nextNavigation: true,
          navigationPage: const ChangePassword()),
      // SettingList(
      //     settingIcon: Images.changeLanguage,
      //     settingName: 'Change Language',
      //     nextNavigation: false,
      //     navigationPage: () => language(context)),
      SettingList(
          settingIcon: Images.changeTheme,
          settingName: 'Change Theme',
          nextNavigation: false,
          navigationPage: () => changeTheme(context)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                child: const Stack(
                  children: [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Settings",
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 65 * settings.length.toDouble(),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: settings.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      settings[i].nextNavigation
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      settings[i]
                                                          .navigationPage),
                                            )
                                          : settings[i].navigationPage();
                                    },
                                    child: ListTile(
                                      leading: Image.asset(
                                        settings[i].settingIcon,
                                        height: 30,
                                        width: 30,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : colors.bodyBackgroundDark,
                                      ),
                                      title: Text(
                                        settings[i].settingName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : colors.bodyBackgroundDark,
                                                fontSize: Platform.isAndroid
                                                    ? size_12
                                                    : size_14),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ],
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
        ),
      ],
    );
  }
}
