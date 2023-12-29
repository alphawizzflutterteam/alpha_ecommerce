import 'dart:convert';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_button.dart';
import '../../widget_common/common_header.dart';
import '../../widget_common/common_textfield.dart';
import '../common_header.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late ProfileViewModel profileProvider;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedGender = 'Male'; // Default selected gender

  // List of gender options
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  void assignTextFields(Datum user) {
    nameController.text = user.fName;
    emailController.text = user.email;
    mobileController.text = user.phone;
    // genderController.text = user.;
    countryController.text = user.country;
    stateController.text = user.state;
    cityController.text = user.city;
    pinCodeController.text = user.zip;
  }

  @override
  void initState() {
    super.initState();
    profileProvider = Provider.of<ProfileViewModel>(context, listen: false);

    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    ProfileModel user = ProfileModel.fromJson(model);

    assignTextFields(user.data[0]);
  }

  @override
  Widget build(BuildContext context) {
    profileProvider = Provider.of<ProfileViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                children: const [
                  ProfileHeader(),
                  InternalPageHeader(text: "Edit Profile"),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 130,
                          height: 130,
                          child: ClipOval(
                            child: Image.asset(
                              Images.human,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size_10),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          color: colors.textFieldBG,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: nameController,
                          decoration: commonInputDecoration(
                            labelText: 'Full Name',
                          ),
                          style: const TextStyle(color: colors.textColor),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: commonInputDecoration(
                            labelText: 'Email',
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
                          controller: mobileController,
                          decoration: commonInputDecoration(
                            labelText: 'Phone',
                          ),
                          style: const TextStyle(color: colors.textColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: colors.textFieldBG, //
                          border: Border.all(
                            // Set the border color and width
                            color: colors
                                .white10, // Replace with your desired border color
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
                            value: selectedGender,
                            dropdownColor: colors.darkBG,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue!;
                              });
                            },
                            items: genderOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: colors.textColor),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
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
                          controller: countryController,
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
                          controller: stateController,
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
                          controller: cityController,
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
                          color: colors
                              .textFieldBG, // Change this color to your desired background color
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: pinCodeController,
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
                      child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: CommonButton(
                              text: "SAVE CHANGES",
                              fontSize: 14,
                              onClick: () {
                                Map data = {
                                  "f_name": nameController.text,
                                  "phone": mobileController.text,
                                  "image": "",
                                  "password": "",
                                  "gender": selectedGender,
                                  "country": countryController.text,
                                  "state": stateController.text,
                                  "city": cityController.text,
                                  "pin_code": pinCodeController.text
                                };
                                print(data);
                                profileProvider.updateProfile(context, data);
                              })),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        profileProvider.isLoading
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  child: appLoader(),
                ))
            : Container(),
      ],
    );
  }
}
