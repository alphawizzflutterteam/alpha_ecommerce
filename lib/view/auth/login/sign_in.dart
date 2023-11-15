import 'package:alpha_ecommerce_18oct/utils/constant.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../provider/authentication_provider.dart';
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  signIn1,
                  style: TextStyle(
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: mobileOrEmailController,
                        validator: validateMobileOrEmail,
                        decoration: commonInputDecoration(
                          labelText: 'Mobile no. or Email Id',
                        ),
                        style: const TextStyle(color: colors.textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: obscureText,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colors.textFieldBG,
                          labelText: 'Password',
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
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                AuthenticationProvider authProvider =
                                    Provider.of<AuthenticationProvider>(
                                        this.context,
                                        listen: false);
                                authProvider.loginFn(_formKey, context,
                                    mobileOrEmailController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: colors.buttonColor,
                                onPrimary: colors.textColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Login', style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward, size: 23),
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
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: colors.lightTextColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Divider(
                                    color: colors.textColor,
                                    height: 1,
                                  ),
                                ),
                              ),
                              Text(
                                'OR',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: colors.textColor,
                                ),
                              ),
                              Expanded(
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
                                  child: const Text(signIn3,
                                      style: TextStyle(
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
                                const Text(signIn4,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: colors.lightTextColor)),
                                InkWell(
                                  onTap: () {
                                    Routes.navigateToVerifyNumberScreen(
                                        context, true);
                                  },
                                  child: const Text('Sign up',
                                      style: TextStyle(
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
