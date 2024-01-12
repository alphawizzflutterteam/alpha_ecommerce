import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/toast_message.dart';

class OTPVerification extends StatefulWidget {
  final bool isComingForLogin;
  final bool isComingFromForgotPassword;
  const OTPVerification(
      {Key? key,
      required this.isComingForLogin,
      required this.isComingFromForgotPassword})
      : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    var mobile = SharedPref.shared.pref!.getString(PrefKeys.mobile);
    final authViewModel = Provider.of<AuthViewModel>(context);
    var otp = SharedPref.shared.pref!.getString(PrefKeys.otp);
    for (int i = 0; i < otp!.length; i++) {
      otpControllers[i].text = otp[i];
    }
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : Colors.white,
      body: Stack(
        children: [
          Theme.of(context).brightness == Brightness.dark
              ? CommonBackgroundPatternAuthWidget()
              : Image.asset(
                  Images.light_bg,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
          Theme.of(context).brightness == Brightness.dark
              ? CommonBackgroundAuthWidget()
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 35),
                height: 80,
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
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textColor
                                  : Colors.black,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            translation(context).otpverification,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.textColor
                                    : Colors.black,
                                fontSize:
                                    Platform.isAndroid ? size_18 : size_20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Theme.of(context).brightness == Brightness.dark
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Image.asset(
                        Images.logoWithoutText,
                        height: MediaQuery.of(context).size.height * 0.1,
                        // width: 120,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Image.asset(
                        "assets/images/loogo_black.png",
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  translation(context).enterverificationcode,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.textColor
                          : Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "${translation(context).entertheotpsentto} $mobile",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.lightTextColor
                        : colors.greyText,
                    fontSize: Platform.isAndroid ? size_14 : size_16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: TextField(
                              controller: otpControllers[index],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colors.textFieldColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colors.textFieldColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: colors.textFieldColor),
                                ),
                                counterStyle:
                                    TextStyle(color: colors.textFieldColor),
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ], // Limit to one character
                            ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CommonButton(
                              text: translation(context).verify,
                              fontSize: Platform.isAndroid ? size_16 : size_18,
                              onClick: () {
                                if (_formKey.currentState!.validate()) {
                                  var enterdOTp = authViewModel
                                      .retrieveStringFromControllers(
                                          otpControllers);
                                  authViewModel.verifyOTP(
                                      widget.isComingForLogin,
                                      context,
                                      enterdOTp,
                                      widget.isComingFromForgotPassword);
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 30, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  translation(context).didntReceivedOTP,
                                  style: TextStyle(
                                      fontSize: Platform.isAndroid
                                          ? size_12
                                          : size_14,
                                      color: colors.lightTextColor),
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Map data = {
                                      'phone': mobile,
                                      'fcm_id': "",
                                    };
                                    if (!widget.isComingForLogin) {
                                      Map data = {'phone': mobile};
                                      authViewModel.resendRegisterOtp(
                                          data, context);
                                    } else {
                                      authViewModel.resendOTP(data, context);
                                    }
                                  },
                                  child: Text(
                                    translation(context).resendOTP,
                                    style: TextStyle(
                                        fontSize: Platform.isAndroid
                                            ? size_12
                                            : size_14,
                                        color: colors.buttonColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isComingForLogin
                        ? translation(context).alreadyhaveanaccount
                        : translation(context).dontHaveanaccount,
                    style: TextStyle(
                      fontSize: Platform.isAndroid ? size_12 : size_14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.textColor
                          : colors.greyText,
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      widget.isComingForLogin
                          ? Routes.navigateToSignInScreen(context)
                          : Routes.navigateToVerifyNumberScreen(context, true);
                    },
                    child: Text(
                      widget.isComingForLogin
                          ? translation(context).signIn
                          : translation(context).signUp,
                      style: TextStyle(
                        fontSize: Platform.isAndroid ? size_12 : size_14,
                        color: colors.buttonColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.transparent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
