import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/viewModel/addressViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/common_header.dart';
import '../../widget_common/common_textfield.dart';
import '../common_header.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({Key? key}) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  String selectedOption = 'Home';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AddressViewModel addressProvider;
  @override
  void initState() {
    super.initState();
    addressProvider = Provider.of<AddressViewModel>(context, listen: false);
    addressProvider.getAddressList(context);
    addressProvider.setText();

    addressProvider.alternateMobileController.text = "";
    addressProvider.houseController.text = "";
    addressProvider.roadController.text = "";
    addressProvider.countryController.text = "";
    addressProvider.stateController.text = "";
    addressProvider.cityController.text = "";
    addressProvider.pinCodeController.text = "";
    addressProvider.latitude = "";
    addressProvider.longitude = "";
    addressProvider.getCountries(context, "", false);
  }

  @override
  Widget build(BuildContext context) {
    addressProvider = Provider.of<AddressViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
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
                child: const Stack(
                  children: [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Address",
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              addressProvider.getCurrentLoc(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: colors.buttonColor,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_disabled_outlined,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text('Use my location',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Select Delivery type",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: Platform.isAndroid
                                          ? size_12
                                          : size_14,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: colors.greyText),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      activeColor: colors.buttonColor,
                                      title: Text(
                                        'Home',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14,
                                            ),
                                        softWrap: false, // Add this line
                                      ),
                                      value: 'Home',
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value.toString();
                                        });
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text(
                                        'Office',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14,
                                            ),
                                        softWrap: false, // Add this line
                                      ),
                                      activeColor: colors.buttonColor,
                                      value: 'Office',
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value.toString();
                                        });
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text(
                                        'Other',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: Platform.isAndroid
                                                  ? size_12
                                                  : size_14,
                                            ),
                                        softWrap: false, // Add this line
                                      ),
                                      value: 'Other',
                                      activeColor: colors.buttonColor,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value.toString();
                                        });
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //       child: Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 15),
                      //         child: Divider(
                      //           color: Colors.white,
                      //           height: 1,
                      //         ),
                      //       ),
                      //     ),
                      //     Text(
                      //       'OR',
                      //       style: Theme.of(context)
                      // .textTheme
                      // .titleSmall!
                      // .copyWith(

                      //         Platform.isAndroid ? size_14 : size_16,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 15),
                      //         child: Divider(
                      //           color: Colors.white,
                      //           height: 1,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        decoration: BoxDecoration(
                          // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.nameController,
                          maxLength: 50,

                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\d+')),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            counterText: '',
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Name',
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
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          // color: colors
                          //     .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true),
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                          ],
                          controller: addressProvider.mobileController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Mobile Number',
                            counterText: '',
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
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          // color: colors
                          //     .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true),
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                          ],
                          controller: addressProvider.alternateMobileController,

                          decoration: InputDecoration(
                            filled: true,
                            counterText: '',
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Alternate Mobile Number',
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
                          controller: addressProvider.houseController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            counterText: '',
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'House no, Building Name',
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
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.roadController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(100),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            counterText: '',
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Road name, Area Colony',
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
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.textFieldBG
                              : Colors.white,
                          border: Border.all(
                            // Set the border color and width
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? colors.white10
                                : colors
                                    .greyText, // Replace with your desired border color
                            width:
                                2.0, // Replace with your desired border width
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: DropdownButton<String>(
                            underline: Container(),
                            isExpanded: true,
                            dropdownColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.darkBG
                                    : Colors.white,
                            value: addressProvider.selectedCountry,
                            onChanged: (value) {
                              setState(() {
                                addressProvider.selectedCountry = value!;
                                addressProvider.countryController.text = value;

                                for (int i = 0;
                                    i < addressProvider.countryList.length;
                                    i++) {
                                  if (addressProvider.countryList[i].name ==
                                      addressProvider.selectedCountry) {
                                    addressProvider.getStatesList(
                                      context,
                                      addressProvider.countryList[i].id
                                          .toString(),
                                    );
                                  }
                                }
                              });
                            },
                            items: addressProvider.countryList
                                .map((country) => DropdownMenuItem<String>(
                                      value: country.name,
                                      child: Text(
                                        country.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black),
                                      ),
                                    ))
                                .toList(),
                            hint: Text('Select a country'),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.textFieldBG
                              : Colors.white,
                          border: Border.all(
                            // Set the border color and width
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? colors.white10
                                : colors
                                    .greyText, // Replace with your desired border color
                            width:
                                2.0, // Replace with your desired border width
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: DropdownButton<String>(
                            underline: Container(),
                            isExpanded: true,
                            dropdownColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.darkBG
                                    : Colors.white,
                            value: addressProvider.selectedState,
                            onChanged: (value) {
                              setState(() {
                                addressProvider.selectedState = value!;
                                addressProvider.stateController.text = value;
                                for (int i = 0;
                                    i < addressProvider.stateList.length;
                                    i++) {
                                  if (addressProvider.stateList[i].name ==
                                      addressProvider.selectedState) {
                                    addressProvider.getCity(
                                        context,
                                        addressProvider.stateList[i].id
                                            .toString(),
                                        addressProvider.stateList[i].name
                                            .toString());
                                  }
                                }
                              });
                            },
                            items: addressProvider.stateList
                                .map((state) => DropdownMenuItem<String>(
                                      value: state.name,
                                      child: Text(
                                        state.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black),
                                      ),
                                    ))
                                .toList(),
                            hint: Text('Select a state'),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.textFieldBG
                              : Colors.white,
                          border: Border.all(
                            // Set the border color and width
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? colors.white10
                                : colors
                                    .greyText, // Replace with your desired border color
                            width:
                                2.0, // Replace with your desired border width
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: DropdownButton<String>(
                            underline: Container(),
                            isExpanded: true,
                            dropdownColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.darkBG
                                    : Colors.white,
                            value: addressProvider.selectedCity,
                            onChanged: (value) {
                              setState(() {
                                addressProvider.selectedCity = value!;
                                addressProvider.cityController.text = value;
                              });
                            },
                            items: addressProvider.cityList
                                .map((city) => DropdownMenuItem<String>(
                                      value: city.name,
                                      child: Text(
                                        city.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black),
                                      ),
                                    ))
                                .toList(),
                            hint: Text('Select a city'),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          maxLength: 6,
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true),
                          controller: addressProvider.pinCodeController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            counterText: '',
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Pincode',
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
                  color: Theme.of(context).brightness == Brightness.dark
                      ? colors.textFieldBG
                      : Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: CommonButton(
                              text: "SAVE ADDRESS",
                              colorsText: Colors.white,
                              fontSize: Platform.isAndroid ? size_14 : size_14,
                              onClick: () {
                                try {
                                  Map data = {
                                    "contact_person_name":
                                        addressProvider.nameController.text,
                                    "phone":
                                        addressProvider.mobileController.text,
                                    "alt_phone": addressProvider
                                        .alternateMobileController.text,
                                    "address":
                                        addressProvider.houseController.text,
                                    "address1":
                                        addressProvider.roadController.text,
                                    "country":
                                        addressProvider.countryController.text,
                                    "state":
                                        addressProvider.stateController.text,
                                    "city": addressProvider.cityController.text,
                                    "zip":
                                        addressProvider.pinCodeController.text,
                                    "latitude": addressProvider.latitude
                                                .toString() ==
                                            ""
                                        ? "0.0"
                                        : addressProvider.latitude.toString(),
                                    "longitude": addressProvider.longitude
                                                .toString() ==
                                            ""
                                        ? "0.0"
                                        : addressProvider.longitude.toString(),
                                    "address_type": selectedOption,
                                    "is_billing": "1"
                                  };
                                  if (addressProvider.nameController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(context, "Name");
                                    return;
                                  } else if (addressProvider
                                          .mobileController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(
                                        context, "Mobile Number");
                                    return;
                                  } else if (addressProvider
                                          .houseController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(
                                        context, "House number");
                                    return;
                                  } else if (addressProvider.roadController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(
                                        context, "Road name");
                                    return;
                                  } else if (addressProvider
                                          .countryController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(
                                        context, "Country name");
                                    return;
                                  } else if (addressProvider
                                          .stateController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(
                                        context, "State name");
                                    return;
                                  } else if (addressProvider
                                      .alternateMobileController.text
                                      .trim()
                                      .isNotEmpty) {
                                    if (addressProvider
                                            .alternateMobileController
                                            .text
                                            .length <
                                        10)
                                      addressProvider.showAlert(
                                          context, "Alternate mobile number");
                                    return;
                                  } else if (addressProvider.cityController.text
                                          .trim() ==
                                      "") {
                                    addressProvider.showAlert(
                                        context, "City name");
                                    return;
                                  } else if (addressProvider
                                              .pinCodeController.text
                                              .trim() ==
                                          "" ||
                                      addressProvider
                                              .pinCodeController.text.length <
                                          6) {
                                    addressProvider.showAlert(
                                        context, "Pincode");
                                    return;
                                  } else if (selectedOption == "") print(data);

                                  addressProvider.addAddress(context, data);
                                } catch (vat) {
                                  print(vat.toString());
                                }
                                //print(data);

                                // Routes.navigateToPreviousScreen(context);
                              })),
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
