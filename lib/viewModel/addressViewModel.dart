import 'package:alpha_ecommerce_18oct/repository/addressRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/addressModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/coupon/model/couponListModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddressViewModel with ChangeNotifier {
  List<AddressList> addressList = [];
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = AddressRepository();
  var latitude = "";
  var longitude = "";
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

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setText() {
    var name = SharedPref.shared.pref!.getString(PrefKeys.name)!;
    var mobile = SharedPref.shared.pref!.getString(PrefKeys.mobile)!;

    nameController.text = name;
    mobileController.text = mobile;
  }

  Future<void> getAddressList(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    await _myRepo.addressList(AppUrl.addressList, token).then((value) {
      addressList = value.data;
      notifyListeners();

      SharedPref.shared.pref
          ?.setString(PrefKeys.billingAddressID, addressList[0].id.toString());
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
    });
  }

  Future<void> updateAddress(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    await _myRepo
        .updateAddress(AppUrl.updateAddressList, token, data)
        .then((value) {
      Utils.showFlushBarWithMessage("Alert", value.message, context);
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
    });
  }

  void showAlert(BuildContext context, String msg) {
    Utils.showFlushBarWithMessage("Alert", "Invalid $msg", context);
  }

  Future<void> addAddress(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    await _myRepo
        .addAddddress(AppUrl.addAddressList, token, data)
        .then((value) async {
      Utils.showFlushBarWithMessage("Alert", value.message, context);
      notifyListeners();

      setLoading(false);
      Future.delayed(Duration(seconds: 2), () {
        Routes.navigateToPreviousScreen(context);
        Routes.navigateToPreviousScreen(context);
      });
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      print(stackTrace.toString());
    });
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
