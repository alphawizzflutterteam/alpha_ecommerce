import 'package:alpha_ecommerce_18oct/screen/profile/setting/changeTheme.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/setting/selectCurrency.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/setting/selectLanguage.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/setting/showRateUs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      SettingList(
          settingIcon: Icons.currency_exchange,
          settingName: 'Currency',
          nextNavigation: false,
          navigationPage: () => currency(context)),
      SettingList(
          settingIcon: Icons.star,
          settingName: 'Rate Us',
          nextNavigation: false,
          navigationPage: () => showAlertDialog(context)),
      SettingList(
          settingIcon: FontAwesomeIcons.share,
          settingName: 'Share',
          nextNavigation: false,
          navigationPage: () => share(context)),
      SettingList(
          settingIcon: FontAwesomeIcons.lock,
          settingName: 'Change Password',
          nextNavigation: true,
          navigationPage: const ChangePassword()),
      SettingList(
          settingIcon: FontAwesomeIcons.language,
          settingName: 'Change Language',
          nextNavigation: false,
          navigationPage: () => language(context)),
      SettingList(
          settingIcon: FontAwesomeIcons.themeco,
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                children: const [
                  ProfileHeader(),
                  InternalPageHeader(
                    text: "Setting",
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      for (int i = 0; i < 6; i++)
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () {
                                  settings[i].nextNavigation
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  settings[i].navigationPage),
                                        )
                                      : settings[i].navigationPage();
                                },
                                child: ListTile(
                                  leading: Icon(
                                    settings[i].settingIcon,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    settings[i].settingName,
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
                            ),
                            const Divider(
                              color: Colors.white,
                              height: 1,
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
      ],
    );
  }
}
