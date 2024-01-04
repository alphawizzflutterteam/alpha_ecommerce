import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/common_textfield.dart';
import '../../widget_common/textfield_validation.dart';

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
  final TextEditingController referralController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Stack(children: [
      const CommonBackgroundPatternAuthWidget(),
      const CommonBackgroundAuthWidget(),
      Scaffold(
        key: _scaffoldKey,
        extendBody: true,
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
            Column(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: Text(
                            translation(context).createyouraccount,
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.lightTextColor
                                    : colors.greyText,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            translation(context)
                                .createanaccounttoviewandmanageyourprojects,
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.lightTextColor
                                    : colors.greyText,
                                fontSize: 15),
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
                                  keyboardType: TextInputType.text,
                                  controller: nameController,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textFieldBG
                                        : Colors.white,
                                    labelText: translation(context).fullname,
                                    labelStyle: const TextStyle(
                                      color: colors.labelColor,
                                      fontSize: 14,
                                    ),
                                    hintStyle: const TextStyle(
                                      color: colors.labelColor,
                                    ),
                                  ),
                                  // decoration: commonInputDecoration(
                                  //   labelText: translation(context).fullname,
                                  // ),
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
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: validateEmail,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textFieldBG
                                        : Colors.white,
                                    labelText: translation(context).email,
                                    labelStyle: const TextStyle(
                                      color: colors.labelColor,
                                      fontSize: 14,
                                    ),
                                    hintStyle: const TextStyle(
                                      color: colors.labelColor,
                                    ),
                                  ),
                                  // decoration: commonInputDecoration(
                                  //   labelText: translation(context).fullname,
                                  // ),
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
                                  obscureText: obscureText,
                                  validator: validatePassword,
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
                                    labelText:
                                        translation(context).confirmpassword,
                                    filled: true,
                                    fillColor: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textFieldBG
                                        : Colors.white,
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: referralController,
                            validator: validateEmail,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textFieldBG
                                  : Colors.white,
                              labelText: translation(context).referralcode,
                              labelStyle: const TextStyle(
                                color: colors.labelColor,
                                fontSize: 14,
                              ),
                              hintStyle: const TextStyle(
                                color: colors.labelColor,
                              ),
                            ),
                            // decoration: commonInputDecoration(
                            //   labelText: translation(context).fullname,
                            // ),
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
                ),
                authViewModel.isLoading
                    ? Align(
                        child: appLoader(),
                      )
                    : Container(),
                authViewModel.isLoading
                    ? Align(
                        child: appLoader(),
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80,
                          color: Theme.of(context).brightness != Brightness.dark
                              ? const Color.fromARGB(255, 253, 253, 253)
                              : colors.textFieldBG,
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
                                          text: translation(context)
                                              .createaccount,
                                          fontSize: 18,
                                          onClick: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              var mobile = SharedPref
                                                  .shared.pref!
                                                  .getString(PrefKeys.mobile);
                                              var languageID = SharedPref
                                                      .shared.pref!
                                                      .getString(PrefKeys
                                                          .selectedLanguageID) ??
                                                  "1";
                                              var currencyID = SharedPref
                                                      .shared.pref!
                                                      .getString(PrefKeys
                                                          .currencyID) ??
                                                  "3";

                                              final bool emailValid = RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(
                                                      emailController.text);
                                              if (emailValid) {
                                                Map data = {
                                                  "f_name": nameController.text,
                                                  'email': emailController.text,
                                                  'phone': mobile,
                                                  'password':
                                                      passwordController.text,
                                                  'referral_code':
                                                      referralController.text,
                                                  'language_id': languageID,
                                                  "currency_id": currencyID,
                                                  "fcm_id": ""
                                                };

                                                authViewModel.createAccountApi(
                                                    data, context);
                                              } else {
                                                Utils.showFlushBarWithMessage(
                                                    "Alert",
                                                    "Invalid Email",
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
          ],
        ),
      ),
    ]);
  }
}
