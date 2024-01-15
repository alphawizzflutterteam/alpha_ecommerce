import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/textfield_validation.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool obscureText = true;

  void showPasswordRequirementsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Password Requirements',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '• Password must be at least 8 characters.\n',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
              Text(
                '• Password must contain at least one lowercase letter & one uppercase letter.\n',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
              Text(
                '• Password must contain at least one number.\n',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
              Text(
                '• Password must contain at least one special character.\n',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(translation(context).dontHaveanaccount,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: Platform.isAndroid ? size_12 : size_14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.lightTextColor
                          : colors.greyText,
                    )),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Routes.navigateToVerifyNumberScreen(context, true);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(translation(context).signUp,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: Platform.isAndroid ? size_12 : size_14,
                        color: colors.buttonColor,
                        decoration: TextDecoration.underline)),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size_50,
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
                    translation(context).signInToYourAccount,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.textColor
                            : Colors.black,
                        fontSize: Platform.isAndroid ? size_22 : size_14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    signIn2,
                    textScaler: Platform.isAndroid
                        ? TextScaler.linear(0.8)
                        : TextScaler.linear(1),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.textColor
                            : Colors.black,
                        fontSize: Platform.isAndroid ? size_12 : size_14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        authViewModel.setLoggingViaPhone(true);
                        FocusManager.instance.primaryFocus?.unfocus();
                        authViewModel.mobileOrEmailController.text = "";
                        authViewModel.passwordController.text = "";
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(
                              authViewModel.isLoggingViaPhone
                                  ? 0.2
                                  : 0.0), // Adjust the opacity as needed
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          translation(context).loginViaPhone,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: authViewModel.isLoggingViaPhone
                                        ? colors.buttonColor
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        authViewModel.setLoggingViaPhone(false);
                        FocusManager.instance.primaryFocus?.unfocus();
                        authViewModel.mobileOrEmailController.text = "";
                        authViewModel.passwordController.text = "";
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: colors.buttonColor.withOpacity(!authViewModel
                                  .isLoggingViaPhone
                              ? 0.2
                              : 0.0), // Adjus), // Adjust the opacity as needed
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          translation(context).loginviaEmail,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: !authViewModel.isLoggingViaPhone
                                        ? colors.buttonColor
                                        : Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize:
                                        Platform.isAndroid ? size_10 : size_12,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          keyboardType: authViewModel.isLoggingViaPhone
                              ? TextInputType.numberWithOptions(signed: true)
                              : TextInputType.emailAddress,
                          controller: authViewModel.mobileOrEmailController,

                          inputFormatters: [
                            authViewModel.isLoggingViaPhone
                                ? FilteringTextInputFormatter.allow(
                                    RegExp(r'\d+'))
                                : FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9@.]')),
                          ],
                          // validator: authViewModel.isLoggingViaPhone
                          //     ? validateMobile
                          //     : validateEmail,
                          maxLength: authViewModel.isLoggingViaPhone ? 10 : 50,
                          decoration: (const InputDecoration())
                              .applyDefaults(
                                  Theme.of(context).inputDecorationTheme)
                              .copyWith(
                                labelText: authViewModel.isLoggingViaPhone
                                    ? translation(context).mobileno
                                    : translation(context).emailid,
                              ),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black),
                        ),
                      ),
                      authViewModel.isLoggingViaPhone
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              child: TextFormField(
                                controller: authViewModel.passwordController,
                                obscureText: obscureText,
                                // validator: validatePassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textFieldBG
                                      : Colors.white,
                                  labelText: translation(context).password,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    child: Icon(
                                      obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.labelColor
                                          : Colors.black,
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                    color: colors.labelColor,
                                    fontSize:
                                        Platform.isAndroid ? size_12 : size_14,
                                  ),
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: colors.labelColor,
                                      ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: colors.textFieldColor,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: colors.textFieldColor,
                                      width: 1,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: colors.textFieldColor,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: colors.textFieldColor,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.textColor
                                            : Colors.black),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            authViewModel.isLoading
                                ? appLoader()
                                : SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Map data = {};
                                        if (authViewModel.isLoggingViaPhone) {
                                          var fcm = SharedPref.shared.pref!
                                              .getString("FCMToken");
                                          data = {
                                            'phone': authViewModel
                                                .mobileOrEmailController.text,
                                            'fcm_id': fcm ?? ""
                                          };
                                        } else {
                                          final bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(authViewModel
                                                  .mobileOrEmailController
                                                  .text);

                                          if (emailValid) {
                                            var fcm = SharedPref.shared.pref!
                                                .getString("FCMToken");
                                            data = {
                                              'email': authViewModel
                                                  .mobileOrEmailController.text,
                                              'password': authViewModel
                                                  .passwordController.text,
                                              'fcm_id': fcm ?? ""
                                            };
                                          } else {
                                            Utils.showFlushBarWithMessage(
                                                "Alert",
                                                "Invalid Email",
                                                context);
                                          }

                                          if (validatePassword(authViewModel
                                                  .passwordController.text) !=
                                              null) {
                                            showPasswordRequirementsDialog(
                                                context);
                                          }
                                        }

                                        authViewModel.loginFn(
                                            _formKey,
                                            context,
                                            authViewModel
                                                .mobileOrEmailController.text,
                                            data);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: colors.buttonColor,
                                        onPrimary: colors.textColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(translation(context).login,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      fontSize:
                                                          Platform.isAndroid
                                                              ? size_16
                                                              : size_18,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.white)),
                                          const SizedBox(width: 10),
                                          const Icon(Icons.arrow_forward,
                                              size: 23),
                                        ],
                                      ),
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Routes.navigateToVerifyNumberScreen(
                                          context, false);
                                    },
                                    child: Text(
                                      translation(context).forgotPassword,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? colors.lightTextColor
                                                    : colors.greyText,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Divider(
                                      color: colors.textColor,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                Text(
                                  translation(context).or,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: Platform.isAndroid
                                            ? size_14
                                            : size_16,
                                        color: colors.textColor,
                                      ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Divider(
                                      color: colors.textColor,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      authViewModel.loginGoogle(context);
                                    },
                                    child: Image.asset(
                                      Images.google,
                                      height: size_40,
                                      width: size_40,
                                    ),
                                  ),
                                  // Image.asset(
                                  //   Images.facebook,
                                  //   height: 50,
                                  //   width: 60,
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Images.guestUser,
                                    height: size_22,
                                    width: size_22,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : colors.bodyBackgroundDark,
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Routes.navigateToDashboardScreen(
                                          context, 2);
                                    },
                                    child: Text(translation(context).guestUser,
                                        style: TextStyle(
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : colors.bodyBackgroundDark,
                                        )),
                                  ),
                                ],
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
        ],
      ),
    );
  }
}


//  //background with pattern
//       const CommonBackgroundPatternAuthWidget(),
//       //background with colour
//       const CommonBackgroundAuthWidget(),
