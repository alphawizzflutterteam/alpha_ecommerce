import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_textfield.dart';
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileOrEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Stack(children: [
      //background with pattern
      const CommonBackgroundPatternAuthWidget(),
      //background with colour
      const CommonBackgroundAuthWidget(),
      Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                Images.logoWithoutText,
                height: 90,
                width: 120,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  translation(context).signInToYourAccount,
                  style: const TextStyle(
                      color: colors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  signIn2,
                  style: TextStyle(
                      color: colors.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      authViewModel.setLoggingViaPhone(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(
                            authViewModel.isLoggingViaPhone
                                ? 0.2
                                : 0.0), // Adjust the opacity as needed
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        translation(context).loginViaPhone,
                        style: TextStyle(
                          color: authViewModel.isLoggingViaPhone
                              ? colors.buttonColor
                              : Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      authViewModel.setLoggingViaPhone(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: colors.buttonColor.withOpacity(!authViewModel
                                .isLoggingViaPhone
                            ? 0.2
                            : 0.0), // Adjus), // Adjust the opacity as needed
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        translation(context).loginviaEmail,
                        style: TextStyle(
                          color: !authViewModel.isLoggingViaPhone
                              ? colors.buttonColor
                              : Colors.white,
                          fontSize: 12.0,
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
                            ? TextInputType.phone
                            : TextInputType.emailAddress,
                        controller: mobileOrEmailController,
                        validator: authViewModel.isLoggingViaPhone
                            ? validateMobile
                            : validateEmail,
                        decoration: commonInputDecoration(
                          labelText: authViewModel.isLoggingViaPhone
                              ? translation(context).mobileno
                              : translation(context).emailid,
                        ),
                        style: const TextStyle(color: colors.textColor),
                      ),
                    ),
                    authViewModel.isLoggingViaPhone
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: obscureText,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: colors.textFieldBG,
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
                                    color: colors.labelColor,
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  color: colors.labelColor,
                                  fontSize: 14,
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
                          authViewModel.isLoading
                              ? appLoader()
                              : SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Map data = {};
                                      if (authViewModel.isLoggingViaPhone) {
                                        data = {
                                          'phone': mobileOrEmailController.text,
                                          'fcm_id': ""
                                        };
                                      } else {
                                        data = {
                                          'email': mobileOrEmailController.text,
                                          'password': passwordController.text,
                                          'fcm_id': ""
                                        };
                                      }

                                      authViewModel.loginFn(_formKey, context,
                                          mobileOrEmailController.text, data);
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
                                            style:
                                                const TextStyle(fontSize: 18)),
                                        const SizedBox(width: 10),
                                        const Icon(Icons.arrow_forward,
                                            size: 23),
                                      ],
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
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
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: colors.lightTextColor,
                                      decoration: TextDecoration.underline,
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
                                style: const TextStyle(
                                  fontSize: 16,
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
                                Image.asset(
                                  Images.google,
                                  height: 50,
                                  width: 60,
                                ),
                                Image.asset(
                                  Images.facebook,
                                  height: 50,
                                  width: 60,
                                ),
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
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () {
                                    Routes.navigateToDashboardScreen(context);
                                  },
                                  child: Text(translation(context).guestUser,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: colors.textColor)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(translation(context).dontHaveanaccount,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: colors.lightTextColor)),
                                InkWell(
                                  onTap: () {
                                    Routes.navigateToVerifyNumberScreen(
                                        context, true);
                                  },
                                  child: Text(translation(context).signUp,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: colors.buttonColor,
                                          decoration:
                                              TextDecoration.underline)),
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
      )
    ]);
  }
}
