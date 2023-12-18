import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/toast_message.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';

class VerifyNumber extends StatefulWidget {
  final bool forSignUp;
  const VerifyNumber({Key? key, required this.forSignUp}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCheckboxChecked = false;
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

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
                                widget.forSignUp
                                    ? translation(context).verifyNumber
                                    : translation(context).forgotPassword,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    translation(context).enteryourmobilenumber,
                    style: const TextStyle(
                        color: colors.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
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
                                controller: mobileController,
                                decoration: InputDecoration(
                                  labelText: translation(context).mobileNumber,
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
                                style: const TextStyle(color: colors.textColor),
                                initialCountryCode: 'IN',
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.forSignUp
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
                                      Text(
                                        translation(context)
                                            .bycontinuingyouagreetoour,
                                        style: const TextStyle(
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
                                          child: Text(
                                            translation(context).termsofservice,
                                            style: const TextStyle(
                                              color: colors.buttonColor,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          translation(context).and,
                                          style: const TextStyle(
                                              color: colors.lightTextColor),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Routes
                                                .navigateToPrivacyPolicyScreen(
                                                    context);
                                          },
                                          child: Text(
                                            translation(context).privacypolicy,
                                            style: const TextStyle(
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
                            child: CommonButton(
                              text: translation(context).send,
                              fontSize: 18,
                              onClick: () {
                                Map data = {'phone': mobileController.text};
                                widget.forSignUp
                                    ? isCheckboxChecked
                                        ? authViewModel.sendRegisterOtp(
                                            data, context)
                                        : showToastMessage(
                                            "Please agree on terms and privacy")
                                    : authViewModel.sendOtpforForgotScreen(
                                        data, context);
                              },
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.forSignUp
                                    ? translation(context).alreadyhaveanaccount
                                    : translation(context).dontHaveanaccount,
                                style: const TextStyle(
                                    fontSize: 14, color: colors.textColor),
                              ),
                              InkWell(
                                onTap: () {
                                  widget.forSignUp
                                      ? Routes.navigateToSignInScreen(context)
                                      : Routes.navigateToVerifyNumberScreen(
                                          context, true);
                                },
                                child: Text(
                                  widget.forSignUp
                                      ? translation(context).signIn
                                      : translation(context).signUp,
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
