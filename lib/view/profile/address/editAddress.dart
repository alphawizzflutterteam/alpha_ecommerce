import 'package:alpha_ecommerce_18oct/view/profile/address/model/addressModel.dart';
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

class EditAddress extends StatefulWidget {
  final AddressList addressList;
  const EditAddress({Key? key, required this.addressList}) : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  String selectedOption = 'Home';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AddressViewModel addressProvider;
  @override
  void initState() {
    super.initState();
    addressProvider = Provider.of<AddressViewModel>(context, listen: false);
    addressProvider.nameController.text = widget.addressList.contactPersonName;
    addressProvider.id = widget.addressList.id.toString();
    addressProvider.mobileController.text = widget.addressList.phone;
    addressProvider.alternateMobileController.text =
        widget.addressList.altPhone;
    addressProvider.houseController.text = widget.addressList.address;
    addressProvider.roadController.text = widget.addressList.address1;
    addressProvider.countryController.text = widget.addressList.country;
    addressProvider.stateController.text = widget.addressList.state;
    addressProvider.cityController.text = widget.addressList.city;
    addressProvider.pinCodeController.text = widget.addressList.zip;
    selectedOption = widget.addressList.addressType.toLowerCase();
    addressProvider.latitude = widget.addressList.latitude.toString();
    addressProvider.longitude = widget.addressList.longitude.toString();
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
                      text: "Edit Address",
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Select Delivery type",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
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
                                        style: TextStyle(
                                          color: Theme.of(context).brightness !=
                                                  Brightness.dark
                                              ? colors.textFieldBG
                                              : Colors.white,
                                          fontSize: 14,
                                        ),
                                        softWrap: false, // Add this line
                                      ),
                                      value: 'home',
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
                                        style: TextStyle(
                                          color: Theme.of(context).brightness !=
                                                  Brightness.dark
                                              ? colors.textFieldBG
                                              : Colors.white,
                                          fontSize: 14,
                                        ),
                                        softWrap: false, // Add this line
                                      ),
                                      activeColor: colors.buttonColor,
                                      value: 'office',
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
                                        style: TextStyle(
                                          color: Theme.of(context).brightness !=
                                                  Brightness.dark
                                              ? colors.textFieldBG
                                              : Colors.white,
                                          fontSize: 14,
                                        ),
                                        softWrap: false, // Add this line
                                      ),
                                      value: 'other',
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        decoration: BoxDecoration(
                          // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.nameController,
                          keyboardType: TextInputType.text,
                          maxLength: 50,

                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\d+')),
                            FilteringTextInputFormatter.allow(RegExp(
                                r'[a-zA-Z]')), // Allow only alphanumeric characters
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Name',
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
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Alternate Mobile Number',
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

                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'House no, Building Name',
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.roadController,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Road name, Area Colony',
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.countryController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\d+')),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Country',
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.stateController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\d+')),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'State',
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.cityController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\d+')),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'City',
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
                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            labelText: 'Pincode',
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
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {},
                child: Align(
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
                                fontSize: 14,
                                onClick: () async {
                                  Map data = {
                                    'id': addressProvider.id,
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
                                    "latitude":
                                        addressProvider.latitude.toString(),
                                    "longitude":
                                        addressProvider.longitude.toString(),
                                    "address_type": selectedOption,
                                    "is_billing": "1"
                                  };
                                  await addressProvider.updateAddress(
                                      context, data);
                                })),
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
