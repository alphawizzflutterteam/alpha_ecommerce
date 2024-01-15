import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/textfield_validation.dart';
import '../common_header.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool obscureText = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

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
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.05),
                                child: Text(
                                  "Change Password",
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: oldPasswordController,
                              obscureText: obscureText,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                                labelText: 'Old Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText =
                                          !obscureText; // Toggle the password visibility
                                    });
                                  },
                                  child: Icon(
                                    obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: colors
                                        .labelColor, // Change the color of the icon
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
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: obscureText2,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                                labelText: 'New Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText2 =
                                          !obscureText2; // Toggle the password visibility
                                    });
                                  },
                                  child: Icon(
                                    obscureText2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: colors
                                        .labelColor, // Change the color of the icon
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
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              obscureText: obscureText3,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                                labelText: 'Confirm Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText3 =
                                          !obscureText3; // Toggle the password visibility
                                    });
                                  },
                                  child: Icon(
                                    obscureText3
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: colors
                                        .labelColor, // Change the color of the icon
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
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: Theme.of(context).brightness == Brightness.dark
                    ? colors.textFieldBG
                    : Color.fromARGB(255, 245, 245, 245),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CommonButton(
                                text: "CHANGE PASSWORD",
                                fontSize:
                                    Platform.isAndroid ? size_16 : size_18,
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (authViewModel.matchPassword(
                                        passwordController.text,
                                        confirmPasswordController.text)) {
                                      if (authViewModel.matchPassword(
                                          oldPasswordController.text,
                                          passwordController.text)) {
                                        Utils.showFlushBarWithMessage(
                                            "",
                                            "Old annd new password should not be same.",
                                            context);
                                      } else {
                                        Map data = {
                                          'old_password':
                                              oldPasswordController.text,
                                          'password': passwordController.text,
                                          "confirm_password":
                                              confirmPasswordController.text
                                        };

                                        authViewModel.uupdatePasswordApi(
                                            data, context);
                                      }
                                    } else {
                                      Utils.showFlushBarWithMessage(
                                          "",
                                          "Password and confirm password should not be same.",
                                          context);
                                    }
                                  }
                                })),
                      ],
                    ),
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
