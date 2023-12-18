import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/viewModel/addressViewModel.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  InternalPageHeader(
                    text: "Address",
                  )
                ],
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_disabled_outlined,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text('Use my location',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                                      title: const Text(
                                        'Home',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
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
                                      title: const Text(
                                        'Office',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
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
                                      title: const Text(
                                        'Other',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
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
                      //       style: TextStyle(
                      //         fontSize: 16,
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
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.nameController,
                          decoration: commonInputDecoration(
                            labelText: 'Name',
                          ),
                          style: const TextStyle(color: colors.textColor),
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
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: addressProvider.mobileController,
                          decoration: commonInputDecoration(
                            labelText: 'Mobile Number',
                          ),
                          style: const TextStyle(color: colors.textColor),
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
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          controller: addressProvider.alternateMobileController,
                          decoration: commonInputDecoration(
                            labelText: 'Alternate Mobile Number',
                          ),
                          style: const TextStyle(color: colors.greyText),
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
                          decoration: commonInputDecoration(
                            labelText: 'House no, Building Name',
                          ),
                          style: const TextStyle(color: colors.textColor),
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
                          decoration: commonInputDecoration(
                            labelText: 'Road name, Area Colony',
                          ),
                          style: const TextStyle(color: colors.textColor),
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
                          decoration: commonInputDecoration(
                            labelText: 'Country',
                          ),
                          style: const TextStyle(color: colors.textColor),
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
                          decoration: commonInputDecoration(
                            labelText: 'State',
                          ),
                          style: const TextStyle(color: colors.textColor),
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
                          decoration: commonInputDecoration(
                            labelText: 'City',
                          ),
                          style: const TextStyle(color: colors.textColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors.textFieldBG,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: addressProvider.pinCodeController,
                          decoration: commonInputDecoration(
                            labelText: 'Pincode',
                          ),
                          style: const TextStyle(color: colors.textColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Map data = {
                    "contact_person_name": addressProvider.nameController.text,
                    "phone": addressProvider.mobileController.text,
                    "alt_phone": addressProvider.alternateMobileController.text,
                    "address": addressProvider.houseController.text,
                    "address1": addressProvider.roadController.text,
                    "country": addressProvider.countryController.text,
                    "state": addressProvider.stateController.text,
                    "city": addressProvider.cityController.text,
                    "zip": addressProvider.pinCodeController.text,
                    "latitude": addressProvider.latitude.toString(),
                    "longitude": addressProvider.longitude.toString(),
                    "address_type": selectedOption,
                    "is_billing": "1"
                  };
                  print(data);
                  addressProvider.addAddress(context, data);
                },
                child: Align(
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
                        child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CommonButton(
                                text: "SAVE ADDRESS",
                                fontSize: 14,
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
                                      "country": addressProvider
                                          .countryController.text,
                                      "state":
                                          addressProvider.stateController.text,
                                      "city":
                                          addressProvider.cityController.text,
                                      "zip": addressProvider
                                          .pinCodeController.text,
                                      "latitude": addressProvider.latitude
                                                  .toString() ==
                                              ""
                                          ? "0.0"
                                          : addressProvider.latitude.toString(),
                                      "longitude": addressProvider.longitude
                                                  .toString() ==
                                              ""
                                          ? "0.0"
                                          : addressProvider.longitude
                                              .toString(),
                                      "address_type": selectedOption,
                                      "is_billing": "1"
                                    };
                                    if (addressProvider.nameController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "Name");
                                      return;
                                    } else if (addressProvider
                                            .mobileController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "Mobile Number");
                                      return;
                                    } else if (addressProvider
                                            .houseController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "House number");
                                      return;
                                    } else if (addressProvider
                                            .roadController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "Road name");
                                      return;
                                    } else if (addressProvider
                                            .countryController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "Country name");
                                      return;
                                    } else if (addressProvider
                                            .stateController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "State name");
                                      return;
                                    } else if (addressProvider
                                            .cityController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "City name");
                                      return;
                                    } else if (addressProvider
                                            .pinCodeController.text ==
                                        "") {
                                      addressProvider.showAlert(
                                          context, "Pincode");
                                      return;
                                    }
                                    print(data);

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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
