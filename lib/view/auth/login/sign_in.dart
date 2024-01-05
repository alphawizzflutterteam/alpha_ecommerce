import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileOrEmailController = TextEditingController();

  void showPasswordRequirementsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Password Requirements',
            style: TextStyle(
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
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                '• Password must contain at least one lowercase letter & one uppercase letter.\n',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                '• Password must contain at least one number.\n',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                '• Password must contain at least one special character.\n',
                style: TextStyle(
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
                style: TextStyle(
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
                  height: size_100,
                ),
                Theme.of(context).brightness == Brightness.dark
                    ? Image.asset(
                        Images.logoWithoutText,
                        height: 90,
                        width: 120,
                      )
                    : Image.asset(
                        "assets/images/loogo_black.png",
                        height: 90,
                        width: 120,
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    translation(context).signInToYourAccount,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.textColor
                            : Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    signIn2,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.textColor
                            : Colors.black,
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
                        FocusManager.instance.primaryFocus?.unfocus();
                        mobileOrEmailController.text = "";
                        passwordController.text = "";
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
                          style: TextStyle(
                            color: authViewModel.isLoggingViaPhone
                                ? colors.buttonColor
                                : Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        authViewModel.setLoggingViaPhone(false);
                        FocusManager.instance.primaryFocus?.unfocus();
                        mobileOrEmailController.text = "";
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
                          style: TextStyle(
                            color: !authViewModel.isLoggingViaPhone
                                ? colors.buttonColor
                                : Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
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
                          // validator: authViewModel.isLoggingViaPhone
                          //     ? validateMobile
                          //     : validateEmail,
                          maxLength: authViewModel.isLoggingViaPhone ? 10 : 100,
                          decoration: (const InputDecoration())
                              .applyDefaults(
                                  Theme.of(context).inputDecorationTheme)
                              .copyWith(
                                labelText: authViewModel.isLoggingViaPhone
                                    ? translation(context).mobileno
                                    : translation(context).emailid,
                              ),
                          style: TextStyle(
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
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                controller: passwordController,
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
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textColor
                                        : Colors.black),
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
                                            'phone':
                                                mobileOrEmailController.text,
                                            'fcm_id': ""
                                          };
                                        } else {
                                          final bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(
                                                  mobileOrEmailController.text);

                                          if (emailValid) {
                                            data = {
                                              'email':
                                                  mobileOrEmailController.text,
                                              'password':
                                                  passwordController.text,
                                              'fcm_id': ""
                                            };
                                          } else {
                                            Utils.showFlushBarWithMessage(
                                                "Alert",
                                                "Invalid Email",
                                                context);
                                          }

                                          if (validatePassword(
                                                  passwordController.text) !=
                                              null) {
                                            showPasswordRequirementsDialog(
                                                context);
                                          }
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
                                              style: const TextStyle(
                                                  fontSize: 18)),
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
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.lightTextColor
                                            : colors.greyText,
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
                                  InkWell(
                                    onTap: () {
                                      authViewModel.loginGoogle(context);
                                    },
                                    child: Image.asset(
                                      Images.google,
                                      height: 50,
                                      width: 60,
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
                                    height: 25,
                                    width: 25,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : colors.bodyBackgroundDark,
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Routes.navigateToDashboardScreen(
                                          context, 2);
                                    },
                                    child: Text(translation(context).guestUser,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : colors.bodyBackgroundDark,
                                        )),
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
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.lightTextColor
                                            : colors.greyText,
                                      )),
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
        ],
      ),
    );
  }
}


//  //background with pattern
//       const CommonBackgroundPatternAuthWidget(),
//       //background with colour
//       const CommonBackgroundAuthWidget(),
