import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/textfield_validation.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/common_header.dart';
import '../../widget_common/common_textfield.dart';
import '../common_header.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late HomeViewModel homeProvider;

  final TextEditingController typeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.transparent
              : Colors.white,
          body: Column(
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : colors.buttonColor,
                child: Stack(
                  children: const [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Customer Support",
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 10),
                              //   child: TextFormField(
                              //     controller: typeController,
                              //     validator: validateName,
                              //     decoration: commonInputDecoration(
                              //       labelText: 'Select Type',
                              //     style: const TextStyle(color: colors.textColor),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 10),
                              //   child: TextFormField(
                              //     controller: emailController,
                              //     validator: validateEmail,
                              //     decoration: commonInputDecoration(
                              //       labelText: 'Email',
                              //     ),
                              //     style: const TextStyle(color: colors.textColor),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: homeProvider.subjectController,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textFieldBG
                                        : Colors.white,
                                    labelText: "Subject",
                                    labelStyle: TextStyle(
                                      color: colors.labelColor,
                                      fontSize: Platform.isAndroid
                                          ? size_12
                                          : size_14,
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
                                  // decoration: commonInputDecoration(
                                  //   labelText: 'Subject',
                                  // ),
                                  // style: const TextStyle(color: colors.textColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: SizedBox(
                                  height: 150,
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller:
                                        homeProvider.descriptionController,
                                    validator: validateName,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: "\n",
                                      fillColor: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.textFieldBG
                                          : Colors.white,
                                      labelText: "Description",
                                      labelStyle: TextStyle(
                                        color: colors.labelColor,
                                        fontSize: Platform.isAndroid
                                            ? size_12
                                            : size_14,
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
                                    // decoration: commonInputDecoration(
                                    //     labelText: 'Description', hintText: '\n'),
                                    // style:
                                    //     const TextStyle(color: colors.textColor),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          width: 120,
                                          child: CommonButton(
                                              text: translation(context).send,
                                              fontSize: Platform.isAndroid
                                                  ? size_16
                                                  : size_18,
                                              onClick: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();

                                                  var name = SharedPref
                                                      .shared.pref!
                                                      .getString(
                                                          PrefKeys.name)!;
                                                  var mobile = SharedPref
                                                      .shared.pref!
                                                      .getString(
                                                          PrefKeys.mobile)!;

                                                  var email = SharedPref
                                                      .shared.pref!
                                                      .getString(
                                                          PrefKeys.email)!;

                                                  Map datta = {
                                                    "name": name,
                                                    "email": email,
                                                    "mobile_number": mobile,
                                                    "subject": homeProvider
                                                        .subjectController.text,
                                                    "message": homeProvider
                                                        .descriptionController
                                                        .text
                                                  };

                                                  homeProvider.customerSupport(
                                                      datta, context);
                                                }
                                              })),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
