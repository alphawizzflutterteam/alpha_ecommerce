import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/profileModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/textfield_validation.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedGender = 'Male'; // Default selected gender
  late ProfileModel user;
  // List of gender options
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  void assignTextFields(Datum user) {
    profileProvider.nameController.text = user.fName;
    profileProvider.emailController.text = user.email;
    profileProvider.mobileController.text = user.phone;
    // genderController.text = user.gender;
    profileProvider.countryController.text = user.country;
    profileProvider.stateController.text = user.state;
    profileProvider.cityController.text = user.city;
    profileProvider.pinCodeController.text = user.zip;
    if (user.gender.toLowerCase() == "male") {
      selectedGender = 'Male';
    } else if (user.gender.toLowerCase() == "female") {
      selectedGender = 'Female';
    } else {
      selectedGender = 'Other';
    }

    profileProvider.getCountries(
        context, profileProvider.stateController.text, true);
  }

  @override
  void initState() {
    super.initState();
    profileProvider = Provider.of<ProfileViewModel>(context, listen: false);

    var model =
        jsonDecode(SharedPref.shared.pref!.getString(PrefKeys.userDetails)!);

    user = ProfileModel.fromJson(model);

    assignTextFields(user.data[0]);
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          profileProvider.selecteddUserImage = File(pickedFile.path);
          profileProvider.uploadFile(context);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Theme.of(context).brightness != Brightness.dark
              ? Colors.white
              : colors.overlayBG,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Theme.of(context).brightness != Brightness.dark
                      ? colors.darkBG
                      : Colors.white,
                ),
                title: Text(
                  'Choose from Gallery',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).brightness != Brightness.dark
                            ? colors.darkBG
                            : Colors.white,
                      ),
                ),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).brightness != Brightness.dark
                      ? colors.darkBG
                      : Colors.white,
                ),
                title: Text(
                  'Take a Picture',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).brightness != Brightness.dark
                            ? colors.darkBG
                            : Colors.white,
                      ),
                ),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
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
                    InternalPageHeader(text: "Edit Profile"),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: GestureDetector(
                    // highlightColor: Colors.transparent,
                    // splashColor: Colors.transparent,
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            Center(
                              child: Container(
                                width: 100.0, // Set your desired width
                                height: 100.0, // Set your desired height
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: user.data.first.image,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        ClipOval(
                                      child: Image.asset(
                                        Images.defaultProfile,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: size_150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    //   profileProvider.pickFile(context);
                                    _showImagePickerOptions(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                      ),
                                      Text("Edit Image")
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(height: size_10),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\d+')),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z\s]')),
                              LengthLimitingTextInputFormatter(50),
//
                            ],
                            controller: profileProvider.nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textFieldBG
                                  : Colors.white,
                              labelText: translation(context).fullname,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.labelColor
                                        : colors.textFieldBG,
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
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            enabled: profileProvider.emailController.text == ""
                                ? true
                                : false,
                            keyboardType: TextInputType.emailAddress,
                            controller: profileProvider.emailController,

                            validator: validateEmail,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'[a-zA-Z0-9@.]')), // Allow only alphanumeric characters
                              LengthLimitingTextInputFormatter(50),

                              /// You can add additional formatters if needed
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textFieldBG
                                  : Colors.white,
                              labelText: translation(context).email,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.labelColor
                                        : colors.textFieldBG,
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
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? colors.textFieldBG
                                : Colors
                                    .white, // Change this color to your desired background color
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            keyboardType:
                                TextInputType.numberWithOptions(signed: true),
                            maxLength: 10,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                            ],
                            controller: profileProvider.mobileController,
                            enabled: profileProvider.mobileController.text == ""
                                ? true
                                : false,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                                labelText: "Phone",
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.labelColor
                                          : colors.textFieldBG,
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
                                counterText: ''),
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: DropdownButton<String>(
                              underline: Container(),
                              isExpanded: true,
                              value: selectedGender,
                              dropdownColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.darkBG
                                  : Colors.white,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                });
                              },
                              items: genderOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.textColor
                                                  : Colors.black),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: DropdownButton<String>(
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.darkBG
                                  : Colors.white,
                              value: profileProvider.selectedCountry,
                              onChanged: (value) {
                                setState(() {
                                  profileProvider.selectedCountry = value!;
                                  profileProvider.countryController.text =
                                      value;
                                  for (int i = 0;
                                      i < profileProvider.countryList.length;
                                      i++) {
                                    if (profileProvider.countryList[i].name ==
                                        profileProvider.selectedCountry) {
                                      profileProvider.getStatesList(
                                          context,
                                          profileProvider.countryList[i].id
                                              .toString());
                                    }
                                  }
                                });
                              },
                              items: profileProvider.countryList
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
                                                      ? colors.textColor
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: DropdownButton<String>(
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.darkBG
                                  : Colors.white,
                              value: profileProvider.selectedState,
                              onChanged: (value) {
                                setState(() {
                                  profileProvider.selectedState = value!;
                                  profileProvider.stateController.text = value;
                                  for (int i = 0;
                                      i < profileProvider.stateList.length;
                                      i++) {
                                    if (profileProvider.stateList[i].name ==
                                        profileProvider.selectedState) {
                                      profileProvider.getCity(
                                          context,
                                          profileProvider.stateList[i].id
                                              .toString());
                                    }
                                  }
                                });
                              },
                              items: profileProvider.stateList
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
                                                      ? colors.textColor
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12),
                            child: DropdownButton<String>(
                              underline: Container(),
                              isExpanded: true,
                              dropdownColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.darkBG
                                  : Colors.white,
                              value: profileProvider.selectedCity,
                              onChanged: (value) {
                                setState(() {
                                  profileProvider.selectedCity = value!;
                                  profileProvider.cityController.text = value;
                                });
                              },
                              items: profileProvider.cityList
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
                            // Change this color to your desired background color
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            keyboardType:
                                TextInputType.numberWithOptions(signed: true),
                            maxLength: 6,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                            ],
                            controller: profileProvider.pinCodeController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textFieldBG
                                  : Colors.white,
                              labelText: 'Pincode',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.labelColor
                                        : colors.textFieldBG,
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? colors.textFieldBG
                      : Color.fromARGB(255, 245, 245, 245),
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
                              fontSize: Platform.isAndroid ? size_14 : size_14,
                              colorsText: Colors.white,
                              onClick: () {
                                final bool emailValid =
                                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                            .hasMatch(profileProvider
                                                .emailController.text) &&
                                        !profileProvider.emailController.text
                                            .startsWith('.');
                                if (emailValid) {
                                  Map data = {
                                    "f_name":
                                        profileProvider.nameController.text,
                                    "phone":
                                        profileProvider.mobileController.text,
                                    "password": "",
                                    "gender": selectedGender,
                                    "country":
                                        profileProvider.countryController.text,
                                    "state":
                                        profileProvider.stateController.text,
                                    "city": profileProvider.cityController.text,
                                    "pin_code":
                                        profileProvider.pinCodeController.text
                                  };
                                  print(data);
                                  profileProvider.updateProfile(context, data);
                                } else {
                                  Utils.showFlushBarWithMessage(
                                      "Alert", "Invalid Email", context);
                                }
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
