import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/textfield_validation.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool obscureText2 = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const CommonBackgroundPatternAuthWidget(),
        const CommonBackgroundAuthWidget(),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
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
                              child: const Icon(Icons.arrow_back_ios)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.1),
                            child: Text(
                              translation(context).changepassword,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Platform.isAndroid ? size_18 : size_20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                Images.greenTopLogo,
                height: 90,
                width: 120,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  changePassword1,
                  style: TextStyle(
                      color: colors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  changePassword2,
                  style: TextStyle(
                      color: colors.lightTextColor,
                      fontSize: Platform.isAndroid ? size_13 : size_15,
                      fontWeight: FontWeight.w400),
                ),
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
                        controller: passwordController,
                        obscureText: obscureText,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          labelText: translation(context).createpassword,
                          filled: true,
                          fillColor: colors.textFieldBG,
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
                              color: colors.labelColor,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: colors.labelColor,
                            fontSize: Platform.isAndroid ? size_12 : size_14,
                          ),
                          hintStyle: const TextStyle(
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
                        style: const TextStyle(color: colors.textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: obscureText2,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          filled: true,
                          fillColor: colors.textFieldBG,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText2 = !obscureText2;
                              });
                            },
                            child: Icon(
                              obscureText2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: colors.labelColor,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: colors.labelColor,
                            fontSize: Platform.isAndroid ? size_12 : size_14,
                          ),
                          hintStyle: const TextStyle(
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
                        style: const TextStyle(color: colors.textColor),
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
                                text: "Reset Password",
                                fontSize:
                                    Platform.isAndroid ? size_16 : size_18,
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (authViewModel.matchPassword(
                                        passwordController.text,
                                        confirmPasswordController.text)) {
                                      Map data = {
                                        'password': passwordController.text,
                                        "confirm_password":
                                            confirmPasswordController.text
                                      };

                                      authViewModel.resetPasswordApi(
                                          data, context);
                                    }
                                    // Routes.navigateToSignInScreen(context);
                                  }
                                },
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(signIn4,
                            style: TextStyle(
                                fontSize:
                                    Platform.isAndroid ? size_12 : size_14,
                                color: colors.lightTextColor)),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Routes.navigateToVerifyNumberScreen(context, true);
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontSize:
                                      Platform.isAndroid ? size_12 : size_14,
                                  color: colors.buttonColor,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
