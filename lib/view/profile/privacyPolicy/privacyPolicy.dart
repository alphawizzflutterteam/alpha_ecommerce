import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../common_header.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ProfileViewModel profileModelProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileModelProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileModelProvider.getPrivacyPolicyData(context);
  }

  @override
  Widget build(BuildContext context) {
    profileModelProvider = Provider.of<ProfileViewModel>(context);
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
                      padding: const EdgeInsets.only(top: 35),
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
                                  child: const Icon(Icons.arrow_back_ios)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.1),
                                child: Text(
                                  "Privacy Policy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
            profileModelProvider.isLoading
                ? Container()
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: profileModelProvider
                              .privacyPolicyData.data!.privacyPolicy,
                          style: {
                            'p': Style(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: FontSize(14),
                            ),
                            'li': Style(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: FontSize(14),
                            )
                          },
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
