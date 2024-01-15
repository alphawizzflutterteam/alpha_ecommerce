import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_button.dart';
import '../../../widget_common/common_header.dart';
import '../../../widget_common/common_textfield.dart';
import '../../common_header.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                      text: "Add Money",
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: nameController,
                          decoration: commonInputDecoration(
                            labelText: 'Name on Card',
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: colors.textColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: cardController,
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            prefixIcon: const Icon(
                              Icons.credit_card_outlined,
                              color: colors.labelColor,
                            ),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: colors.labelColor,
                                  fontSize:
                                      Platform.isAndroid ? size_12 : size_14,
                                ),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
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
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: colors.textColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: dateController,
                          decoration: commonInputDecoration(
                            labelText: 'Expiry Date',
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: colors.greyText),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: cvvController,
                          decoration: commonInputDecoration(
                            labelText: 'CVV',
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: colors.textColor),
                        ),
                      )
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
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: CommonButton(
                                text: "PAY NOW",
                                fontSize:
                                    Platform.isAndroid ? size_13 : size_15,
                                onClick: () {
                                  Routes.navigateToWalletSuccessScreen(context);
                                },
                              )),
                        ],
                      ),
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
