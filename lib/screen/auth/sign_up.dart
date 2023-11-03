import 'package:alpha_ecommerce_18oct/helper/constant.dart';
import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../widgets/commonBackground.dart';
import '../../widgets/common_textfield.dart';
import '../../widgets/textfield_validation.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCheckboxChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool obscureText = true;
  bool obscureText2 = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const CommonBackgroundPatternAuthWidget(),
      const CommonBackgroundAuthWidget(),
      Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                      width: 110,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Text(
                        signUP1,
                        style: TextStyle(
                            color: colors.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        signUP2,
                        style: TextStyle(
                            color: colors.lightTextColor, fontSize: 15),
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
                              controller: nameController,
                              validator: validateName,
                              decoration: commonInputDecoration(
                                labelText: 'Full Name',
                              ),
                              style: const TextStyle(color: colors.textColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: emailController,
                              validator: validateEmail,
                              decoration: commonInputDecoration(
                                labelText: 'Email',
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
                                      obscureText =
                                          !obscureText; // Toggle the password visibility
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
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              obscureText: obscureText2,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                filled: true,
                                fillColor: colors.textFieldBG,
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
                              horizontal: 10,
                              vertical: 0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              colors.textColor),
                                      child: Checkbox(
                                        value: isCheckboxChecked,
                                        checkColor: colors.textColor,
                                        activeColor: colors.buttonColor,
                                        onChanged: (value) {
                                          setState(() {
                                            isCheckboxChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    const Text(
                                      validateNumber3,
                                      style: TextStyle(
                                          color: colors.lightTextColor),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 45, bottom: 20),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Routes.navigateToTermsConditionScreen(
                                              context, const SignUP());
                                        },
                                        child: const Text(
                                          'Terms of Service',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colors.buttonColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        ' and ',
                                        style:
                                            TextStyle(color: colors.textColor),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Routes.navigateToPrivacyPolicyScreen(
                                              context);
                                        },
                                        child: const Text(
                                          'Privacy Policy',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colors.buttonColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                color: colors.textFieldBG,
                child: Center(
                  child: Padding(
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
                                Routes.navigateToWelcomeScreen(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: colors.buttonColor,
                              onPrimary: colors.textColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('CREATE ACCOUNT',
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
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
