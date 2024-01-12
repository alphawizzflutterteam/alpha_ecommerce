import 'package:alpha_ecommerce_18oct/repository/addressRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/addressModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/cityModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/countryModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/stateModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/coupon/model/couponListModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddressViewModel with ChangeNotifier {
  List<AddressList> addressList = [];
  List<CountryList> countryList = [];
  bool isLoading = false;
  List<StateData> stateList = [];
  List<CityData> cityList = [];
  String selectedCountry = "India";
  String selectedState = "Select a state";
  String selectedCity = "Select a city";

  bool get loading => isLoading;
  final _myRepo = AddressRepository();
  var latitude = "";
  var longitude = "";
  var id = "";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController alternateMobileController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController roadController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  var selectedId = 0;
  var selectedAddress = "";

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setselected(int value, AddressList model, bool isComingForSelection,
      BuildContext context) {
    selectedId = value;
    print("here");
    selectedAddress = "${model.address}, ${model.address1}";
    SharedPref.shared.pref
        ?.setString(PrefKeys.billingAddressID, model.id.toString());
    SharedPref.shared.pref?.setString(
        PrefKeys.billingAddress, "${model.address}, ${model.address1}");

    print(SharedPref.shared.pref!.getString(PrefKeys.billingAddress));
    notifyListeners();
    if (isComingForSelection) {
      Routes.navigateToPreviousScreen(context);
    }
  }

  void setText() {
    var name = SharedPref.shared.pref!.getString(PrefKeys.name)!;
    var mobile = SharedPref.shared.pref!.getString(PrefKeys.mobile)!;

    nameController.text = name;
    mobileController.text = mobile;
  }

  void clearTextt() {
    mobileController.text = "";
    alternateMobileController.text = "";
    houseController.text = "";
    roadController.text = "";
    countryController.text = "";
    stateController.text = "";
    cityController.text = "";
    pinCodeController.text = "";
    latitude = "";
    longitude = "";
  }

  Future<void> getAddressList(BuildContext context) async {
    // setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      // setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo.addressList(AppUrl.addressList, token).then((value) {
        addressList = value.data;
        notifyListeners();

        var id = SharedPref.shared.pref?.getString(PrefKeys.billingAddressID);

        if (id == "0" || id == "") {
          try {
            setselected(0, addressList[0], false, context);

            SharedPref.shared.pref?.setString(
                PrefKeys.billingAddressID, addressList[0].id.toString());
            selectedAddress =
                "${addressList[0].address}, ${addressList[0].address1}";

            notifyListeners();
          } catch (stacktrace) {}
        } else {
          for (int i = 0; i < addressList.length; i++) {
            if (addressList[i].id.toString() == id) {
              SharedPref.shared.pref?.setString(
                  PrefKeys.billingAddressID, addressList[i].id.toString());
              SharedPref.shared.pref?.setString(PrefKeys.billingAddress,
                  "${addressList[i].address}, ${addressList[i].address1}");
              selectedAddress =
                  "${addressList[i].address}, ${addressList[i].address1}";
              notifyListeners();

              print(SharedPref.shared.pref!.getString(PrefKeys.billingAddress));
            }
          }
        }

        // setLoading(false);
      }).onError((error, stackTrace) {
        // setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

  Future<void> updateAddress(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .updateAddress(AppUrl.updateAddressList, token, data)
          .then((value) {
        notifyListeners();
        getAddressList(context);
        Routes.navigateToPreviousScreen(context);
        Utils.showFlushBarWithMessage("Alert", value.message, context);

        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

  Future<void> deleteAddress(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .deleteAddress(
        AppUrl.deleteAddress + data,
        token,
      )
          .then((value) {
        Utils.showFlushBarWithMessage("Alert", value.message, context);

        setLoading(false);
        getAddressList(context);
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

  void showAlert(BuildContext context, String msg) {
    Utils.showFlushBarWithMessage("Alert", "Invalid $msg", context);
  }

  Future<void> addAddress(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .addAddddress(AppUrl.addAddressList, token, data)
          .then((value) async {
        Utils.showFlushBarWithMessage("Alert", value.message, context);

        getAddressList(context);
        clearTextt();
        setLoading(false);
        Future.delayed(Duration(seconds: 2), () {
          Routes.navigateToPreviousScreen(context);
          // Routes.navigateToPreviousScreen(context);
        });
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
        Utils.showFlushBarWithMessage(
            "Alert", "Something went wrong.", context);
      });
    }
  }

  Future<void> getCountries(
      BuildContext context, String data, bool forEditing) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      print(countryController.text + "Country name");
      await _myRepo.countryList(AppUrl.countries).then((value) async {
        countryList = value.data;
        if (countryList.isNotEmpty) {
          for (int i = 0; i < countryList.length; i++) {
            if (countryList[i].name == countryController.text) {
              print(countryList[i].id.toString() + "Countryid");

              selectedCountry = countryList[i].name;
              countryController.text = selectedCountry;
              getStates(
                context,
                countryList[i].id.toString(),
              );
            }
          }

          if (!forEditing) {
            //  selectedState = "";
            getStatesList(
              context,
              "101",
            );
          }
        } else {
          countryController.text = "";
          selectedCountry = "Select a Country";
        }
        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);

        print(stackTrace.toString());
        Utils.showFlushBarWithMessage(
            "Alert", "Something went wrong.", context);
      });
    }
  }

  Future<void> getStatesList(
    BuildContext context,
    String data,
  ) async {
    setLoading(true);

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo.stateList(AppUrl.states + data).then((value) async {
        stateList = value.data;
        if (stateList.isNotEmpty) {
          selectedState = stateList[0].name!;
          stateController.text = selectedState;
          getCity(context, stateList[0].id.toString());
        } else {
          selectedCity = "Select a city";
          selectedState = "Select a state";
          stateController.text = "";
          cityList.clear();
          cityController.text = "";
        }

        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);

        print(stackTrace.toString());
        Utils.showFlushBarWithMessage(
            "Alert", "Something went wrong.", context);
      });
    }
  }

  Future<void> getStates(
    BuildContext context,
    String data,
  ) async {
    setLoading(true);

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo.stateList(AppUrl.states + data).then((value) async {
        stateList = value.data;
        if (stateList.isNotEmpty) {
          print(stateController.text + "state name");

          for (int i = 0; i < stateList.length; i++) {
            if (stateList[i].name.toString() == stateController.text) {
              selectedState = stateList[i].name!;
              stateController.text = selectedState;
              getCity(context, stateList[i].id.toString());
            }
          }
        } else {
          selectedCity = "Select a city";
          selectedState = "Select a state";
          stateController.text = "";
          cityList.clear();
          cityController.text = "";
        }

        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);

        print(stackTrace.toString());
        Utils.showFlushBarWithMessage(
            "Alert", "Something went wrong.", context);
      });
    }
  }

  Future<void> getCity(BuildContext context, String data) async {
    setLoading(true);
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo.cityList(AppUrl.city + data).then((value) async {
        cityList = value.data;
        if (cityList.isNotEmpty) {
          selectedCity = cityList[0].name!;
          //  cityController.text = selectedCity;
          for (int i = 0; i < cityList.length; i++) {
            if (cityList[i].name.toString() == cityController.text) {
              selectedCity = cityList[i].name!;
              cityController.text = selectedCity;
            }
          }
        } else {
          selectedCity = "Select a City";
          cityController.text = "";
        }

        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);

        print(stackTrace.toString());
        Utils.showFlushBarWithMessage(
            "Alert", "Something went wrong.", context);
      });
    }
  }

  Future<void> getCurrentLoc(BuildContext context) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print("checking permission here $permission");
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var loc = Provider.of<LocationProvider>(context, listen: false);

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    List<Placemark> placemark = await placemarkFromCoordinates(
        double.parse(latitude), double.parse(longitude),
        localeIdentifier: "en");

    //pinController.text = placemark[0].postalCode!;

    pinCodeController.text = placemark[0].postalCode!;
    roadController.text =
        placemark[0].subAdministrativeArea! + ", " + placemark[0].subLocality!;
    cityController.text = placemark[0].locality!;
    countryController.text = placemark[0].country!;
    houseController.text = placemark[0].name!;
    // Mapping of Indian state abbreviations to full names
    Map<String, String> stateAbbreviationMap = {
      'AP': 'Andhra Pradesh',
      'AR': 'Arunachal Pradesh',
      'AS': 'Assam',
      'BR': 'Bihar',
      'CT': 'Chhattisgarh',
      'GA': 'Goa',
      'GJ': 'Gujarat',
      'HR': 'Haryana',
      'HP': 'Himachal Pradesh',
      'JH': 'Jharkhand',
      'KA': 'Karnataka',
      'KL': 'Kerala',
      'MP': 'Madhya Pradesh',
      'MH': 'Maharashtra',
      'MN': 'Manipur',
      'ML': 'Meghalaya',
      'MZ': 'Mizoram',
      'NL': 'Nagaland',
      'OR': 'Odisha',
      'PB': 'Punjab',
      'RJ': 'Rajasthan',
      'SK': 'Sikkim',
      'TN': 'Tamil Nadu',
      'TG': 'Telangana',
      'TR': 'Tripura',
      'UP': 'Uttar Pradesh',
      'UK': 'Uttarakhand',
      'WB': 'West Bengal',
      'AN': 'Andaman and Nicobar Islands',
      'CH': 'Chandigarh',
      'DN': 'Dadra and Nagar Haveli and Daman and Diu',
      'DL': 'Delhi',
      'JK': 'Jammu and Kashmir',
      'LA': 'Lakshadweep',
      'LD': 'Ladakh',
      'PY': 'Puducherry',
    };

    stateController.text =
        stateAbbreviationMap[placemark[0].administrativeArea] ?? '';

    print(
        "${placemark[0].street}, ${placemark[0].subLocality}, ${placemark[0].locality}");

    // pinController.text = placemark[0].postalCode!;
    // currentAddress.text =
    //     "${placemark[0].street}, ${placemark[0].subLocality}, ${placemark[0].locality}";
    latitude = (position.latitude.toString());
    longitude = position.longitude.toString();
    loc.lng = position.longitude.toString();
    loc.lat = position.latitude.toString();
  }
}

class LocationProvider extends ChangeNotifier {
  var lat;
  var lng;
  void onChange(value) {
    lat = value;
    lng = value;
    notifyListeners();
  }
}
