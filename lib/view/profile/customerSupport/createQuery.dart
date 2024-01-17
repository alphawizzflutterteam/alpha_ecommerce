import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_button.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/textfield_validation.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateQueryScreen extends StatefulWidget {
  const CreateQueryScreen({super.key, required this.orderId});
  final String orderId;
  @override
  State<CreateQueryScreen> createState() => _CreateQueryScreenState();
}

class _CreateQueryScreenState extends State<CreateQueryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late HomeViewModel homeProvider;

  final TextEditingController typeController = TextEditingController();
  final TextEditingController orderId = TextEditingController();
  List<DropdownMenuItem<String>> dropItems = [
    DropdownMenuItem(
      value: "Order Status Inquiry",
      child: Text("Order Status Inquiry", style: TextStyle(color: Colors.grey)),
    ),
    DropdownMenuItem(
      value: "Product Information",
      child: Text(
        "Product Information",
        style: TextStyle(color: Colors.grey),
      ),
    ),
    DropdownMenuItem(
        value: "Billing and Payment Issues",
        child: Text(
          "Billing and Payment Issues",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
        value: "Returns and Exchanges",
        child: Text(
          "Returns and Exchanges",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
        value: "Technical Issues",
        child: Text(
          "Technical Issues",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
        value: "Promotions and Discounts",
        child: Text(
          "Promotions and Discounts",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
        value: "Account Managemen",
        child: Text(
          "Account Managemen",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
        value: "Shipping and Delivery Issues",
        child: Text(
          "Shipping and Delivery Issues",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
        value: "Communication Preferences",
        child: Text(
          "Communication Preferences",
          style: TextStyle(color: Colors.grey),
        )),
    DropdownMenuItem(
      value: "Security Concerns",
      child: Text(
        "Security Concerns",
        style: TextStyle(color: Colors.grey),
      ),
    ),
    DropdownMenuItem(
      value: "Product Complaints or Defects",
      child: Text(
        "Product Complaints or Defects",
        style: TextStyle(color: Colors.grey),
      ),
    ),
    DropdownMenuItem(
      value: "General Inquiries",
      child: Text(
        "General Inquiries",
        style: TextStyle(color: Colors.grey),
      ),
    ),
  ];
  String? selVal;
  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    print("OrderId- ${widget.orderId}");
    orderId.text = widget.orderId;
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: orderId,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textFieldBG
                                        : Colors.white,
                                    labelText: "OrderID",
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: colors.labelColor,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                        ),
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: colors.labelColor,
                                        ),
                                  ),
                                  // decoration: commonInputDecoration(
                                  //   labelText: translation(context).fullname,
                                  // ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.textColor
                                              : Colors.black),
                                  // decoration: commonInputDecoration(
                                  //   labelText: 'Subject',
                                  // ),
                                  // style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colors.textColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.grey.shade700
                                            : colors.boxBorder,
                                      )),
                                  child: DropdownButton<String>(
                                    underline: Container(),
                                    isExpanded: true,
                                    dropdownColor:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.boxBorder
                                            : Colors.white,
                                    value: selVal,
                                    onChanged: (value) {
                                      setState(() {
                                        selVal = value;
                                      });
                                    },
                                    items: dropItems,
                                    hint: Text(
                                      'Select Query Type',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: colors.labelColor,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
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
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: colors.labelColor,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14,
                                        ),
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: colors.labelColor,
                                        ),
                                  ),
                                  // decoration: commonInputDecoration(
                                  //   labelText: translation(context).fullname,
                                  // ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.textColor
                                              : Colors.black),
                                  // decoration: commonInputDecoration(
                                  //   labelText: 'Subject',
                                  // ),
                                  // style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colors.textColor),
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
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: colors.labelColor,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: colors.labelColor,
                                          ),
                                    ),
                                    // decoration: commonInputDecoration(
                                    //   labelText: translation(context).fullname,
                                    // ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? colors.textColor
                                                    : Colors.black),
                                    // decoration: commonInputDecoration(
                                    //     labelText: 'Description', hintText: '\n'),
                                    // style:
                                    //     Theme.of(context).textTheme.titleSmall!.copyWith(color: colors.textColor),
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
                                                    "order_id": widget.orderId,
                                                    "type": selVal,
                                                    "subject": homeProvider
                                                        .subjectController.text,
                                                    "description": homeProvider
                                                        .descriptionController
                                                        .text,
                                                    "priority": "High",
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
