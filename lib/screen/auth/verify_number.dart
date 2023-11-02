import 'package:alpha_ecommerce_18oct/helper/constant.dart';
import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../widgets/commonBackground.dart';
import 'otp_verification.dart';

class VerifyNumber extends StatefulWidget {
  final bool signIn;
  const VerifyNumber({Key? key, required this.signIn}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCheckboxChecked = false;

  String? validateMobileOrEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number.';
    }
    if (int.tryParse(value) == null) {
      return 'Invalid mobile number format.';
    }
    if (value.length != 10) {
      return 'Invalid mobile number format.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
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
                                  right:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: Text(
                                widget.signIn
                                    ? "Verify Number"
                                    : "Forgot Password",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: colors.textColor, fontSize: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: Image.asset(
                    Images.greenTopLogo,
                    height: 90,
                    width: 110,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    validateNumber1,
                    style: TextStyle(
                        color: colors.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    validateNumber2,
                    style:
                        TextStyle(color: colors.lightTextColor, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: IntlPhoneField(
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  labelStyle: const TextStyle(
                                    color: colors.textColor,
                                    fontSize: 14,
                                  ),
                                  hintStyle: const TextStyle(
                                      color: colors.textFieldColor),
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
                                style:
                                    const TextStyle(color: colors.textColor),
                                initialCountryCode:
                                    'IN', // Set the initial country code here
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.signIn
                          ? Padding(
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
                                                colors.textFieldColor),
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
                                    padding: const EdgeInsets.only(left: 45),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Routes
                                                .navigateToTermsConditionScreen(
                                                    context, false);
                                          },
                                          child: const Text(
                                            'Terms of Service',
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          ' and ',
                                          style: TextStyle(
                                              color: colors.lightTextColor),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Routes
                                                .navigateToPrivacyPolicyScreen(
                                                    context);
                                          },
                                          child: const Text(
                                            'Privacy Policy',
                                            style: TextStyle(
                                              color: colors
                                                  .buttonColor, // Change the color to your preferred color
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 60, left: 20, right: 20),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OTPVerification(
                                          signIn: widget.signIn)),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: colors.buttonColor,
                              onPrimary: colors.textColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Send',
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.signIn ? signIn5 : signIn4,
                                style: const TextStyle(
                                    fontSize: 14, color: colors.textColor),
                              ),
                              InkWell(
                                onTap: () {
                                  widget.signIn
                                      ? Routes.navigateToSignInScreen(context)
                                      : Routes.navigateToVerifyNumberScreen(
                                          context, false);
                                },
                                child: Text(
                                  widget.signIn ? 'Sign In' : 'Sign Up',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: colors.buttonColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
