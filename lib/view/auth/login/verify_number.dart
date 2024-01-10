import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
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

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : Colors.white,
      resizeToAvoidBottomInset: false,
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
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.1),
                            child: Text(
                              widget.forSignUp
                                  ? translation(context).verifyNumber
                                  : translation(context).forgotPassword,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
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
                    translation(context).enteryourmobilenumber,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
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
                                showDropdownIcon: false,
                                readOnly: false,
                                enabled: true,
                                invalidNumberMessage: '',
                                controller: authViewModel.mobileController,
                                decoration: InputDecoration(
                                  labelText: translation(context).mobileNumber,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textColor
                                        : Colors.black,
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
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : colors.greyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 45),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
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
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
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
                                Map data = {
                                  'phone': authViewModel.mobileController.text
                                };
                                widget.forSignUp
                                    ? isCheckboxChecked
                                        ? authViewModel.sendRegisterOtp(
                                            data, context)
                                        : Utils.showFlushBarWithMessage(
                                            '',
                                            "Please agree on terms and privacy",
                                            context)
                                    : authViewModel.sendOtpforForgotScreen(
                                        data, context);
                              },
                            )),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.forSignUp
                            ? translation(context).alreadyhaveanaccount
                            : translation(context).dontHaveanaccount,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : colors.greyText,
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
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
                Divider(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
