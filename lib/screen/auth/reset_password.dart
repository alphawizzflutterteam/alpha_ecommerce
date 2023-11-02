import 'package:alpha_ecommerce_18oct/helper/constant.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../helper/routes.dart';
import '../../widgets/commonBackground.dart';
import '../../widgets/textfield_validation.dart';

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
                              onTap: () {
                                Routes.navigateToPreviousScreen(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.1),
                            child: const Text(
                              "Reset Password",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Image.asset(
                  Images.greenTopLogo,
                  height: 90,
                  width: 110,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  changePassword1,
                  style: TextStyle(
                      color: colors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  changePassword2,
                  style: TextStyle(
                      color: colors.lightTextColor,
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
                        controller: passwordController,
                        obscureText: obscureText,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          labelText: 'Create New Password',
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
                              color: const Color(
                                  0xFFA8AAC1), // Change the color of the icon
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
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: obscureText2,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
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
                              color: const Color(
                                  0xFFA8AAC1), // Change the color of the icon
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
                                if (_formKey.currentState!.validate()) {
                                  Routes.navigateToSignInScreen(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: colors.buttonColor,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Reset Password',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(signIn4,
                            style: TextStyle(
                                fontSize: 14, color: colors.lightTextColor)),
                        InkWell(
                          onTap: () {
                            Routes.navigateToVerifyNumberScreen(context, false);
                          },
                          child: const Text('Sign up',
                              style: TextStyle(
                                  fontSize: 14,
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
