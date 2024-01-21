import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/walletCard.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_button.dart';
import '../../../widget_common/common_header.dart';
import '../../common_header.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ProfileViewModel provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<ProfileViewModel>(context, listen: false);
    provider.getWalletHistory(context);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProfileViewModel>(context);

    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    ProfileModel user = ProfileModel.fromJson(model);
    var walletBalance = user.data[0].walletBalance.toString();
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
                child: Stack(
                  children: const [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "My Wallet",
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.overlayBG
                                    : Colors.white,
                            elevation:
                                2.0, // Set the elevation value to control the shadow intensity
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Available Balance :  $walletBalance',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: Platform.isAndroid
                                              ? size_11
                                              : size_13,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    child: SizedBox(
                                        height: 35,
                                        width: size_150 * 0.9,
                                        child: CommonButton(
                                            text: "ADD MONEY",
                                            fontSize: Platform.isAndroid
                                                ? size_10
                                                : size_12,
                                            colorsText: Colors.white,
                                            onClick: () {
                                              Routes.navigateToAddMoneyScreen(
                                                  context);
                                            })),
                                  )
                                ],
                              ),
                            )),
                      ),
                      provider.walletHistory.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Image.asset(
                                    'assets/images/Group 3021.png',
                                    height: size_150,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "No transactions yet.",
                                    style: TextStyle(
                                      color: colors.greyText,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: provider.walletHistory.length,
                                    itemBuilder: (context, i) {
                                      return walletCart(
                                          context: context,
                                          data: provider.walletHistory[i]);
                                    },
                                  ),
                                ),
                              ],
                            )
                    ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
