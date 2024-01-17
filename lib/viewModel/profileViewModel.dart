import 'dart:ffi';
import 'dart:io';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/cityModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/countryModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/stateModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/customerSupportModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/supportChatModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:http_parser/http_parser.dart';

import 'package:alpha_ecommerce_18oct/repository/profileRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/privacyPolicyModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/referralModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/subscriptionModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/model/transactionHistoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/model/walletModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/refund/model/refundHistoryModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileViewModel with ChangeNotifier {
  List<CountryList> countryList = [];
  bool isLoading = false;
  List<StateData> stateList = [];
  List<CityData> cityList = [];
  String selectedCountry = "India";
  String selectedState = "Select a state";
  String selectedCity = "Select a city";
  bool get loading => isLoading;
  final _myRepo = ProfileRepository();
  late PrivacyPolicyModel privacyPolicyData;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  List<DatumTrasaction> transactionDatta = [];
  List<DatumRefund> refundData = [];
  List<WalletTransactioList> walletHistory = [];
  List<ReferralData> referralList = [];
  List<SubscriptionData> subscriptionList = [];
  File? selecteddUserImage;
  List<SupportData> queries = [];
  List<ChatData> supportChats = [];

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> pickFile(BuildContext context) async {
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        selecteddUserImage = File(result.files.single.path!);
        var res = await _myRepo.multipartRequest(AppUrl.updateImage,
            selecteddUserImage!, MediaType('image', 'jpeg'));
        print(res["status"]);
        if (res['status'] == true) {
          HomeViewModel homeProvider =
              Provider.of<HomeViewModel>(context, listen: false);

          Routes.navigateToPreviousScreen(context);
          await homeProvider.getProfileAPI({}, context);
        }
      } else {
        Utils.showFlushBarWithMessage("", "Something went wrong", context);
      }
    }
  }

  Future<void> uploadFile(BuildContext context) async {
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      var res = await _myRepo.multipartRequest(
          AppUrl.updateImage, selecteddUserImage!, MediaType('image', 'jpeg'));
      print(res["status"]);
      if (res['status'] == true) {
        HomeViewModel homeProvider =
            Provider.of<HomeViewModel>(context, listen: false);
        await homeProvider.getProfileAPI({}, context);
        Routes.navigateToPreviousScreen(context);
      }
    }
  }

  Future<void> updateProfile(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .updateProfileRequest(AppUrl.updateProfile, token, data)
          .then((value) {
        setLoading(false);

        HomeViewModel homeProvider =
            Provider.of<HomeViewModel>(context, listen: false);
        try {
          var phone = SharedPref.shared.pref!.getString(PrefKeys.mobile);

          Map data2 = {'phone': phone};
          homeProvider.getProfileAPI(data2, context);
        } catch (stacktrace) {}
        Routes.navigateToPreviousScreen(context);

        Utils.showFlushBarWithMessage("Alert", value.message, context);
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

//Funcation to fetch All Privacy Policy Data
  Future<void> getPrivacyPolicyData(BuildContext context) async {
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
          .getPrivacyPolicyDataRequest(api: AppUrl.privacyPolicyData)
          .then((value) {
        privacyPolicyData = value;
        print(privacyPolicyData.data!.privacyPolicy.toString() +
            'Privacy poolicyy');
        setLoading(false);
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

  Future<void> getTransactionHistoryData(BuildContext context) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .getTransactionHistoryDataRequest(
              api: AppUrl.transactionHistory, bearerToken: token)
          .then((value) {
        transactionDatta = value.data;
        print("Transacttiion Data");
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

  Future<void> getRefundHistoryData(BuildContext context) async {
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
      await _myRepo
          .getRefundHistoryDataRequest(
              api: AppUrl.refundHistory, bearerToken: token)
          .then((value) {
        refundData = value.data;
        print("Transacttiion Data");
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

  Future<void> getWalletHistory(BuildContext context) async {
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
      await _myRepo
          .getWalletHistoryDataRequest(
              api: AppUrl.walletHistory, bearerToken: token)
          .then((value) {
        walletHistory = value.walletTransactioList;
        print("walllet Data");
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

//Function to fetch referral data
  Future<void> getReferralData(BuildContext context) async {
    setLoading(true);

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
      await _myRepo
          .getReferralDataRequest(api: AppUrl.referral, bearerToken: token)
          .then((value) {
        referralList = value.data;
        print(referralList.length);
        setLoading(false);
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
      });
    }
  }

//Function to fetch subscription data
  Future<void> getSubscriptionData(BuildContext context) async {
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      setLoading(true);
      var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
      await _myRepo
          .getSubscriptionDataRequest(
              api: AppUrl.subscription, bearerToken: token)
          .then((value) {
        subscriptionList = value.data;
        print(subscriptionList.length);
        setLoading(false);
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
        print(stackTrace.toString());
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

//Function to get Support Query Data
  Future<void> getSupportQuerys() async {
    isLoading = true;
    var token = SharedPref.shared.pref?.getString(PrefKeys.jwtToken);
    print(token);
    queries.clear();
    await _myRepo
        .supportQueryListGetRequest(
            api: AppUrl.supportTickets, token: token.toString())
        .then((value) {
      queries = value.data;
      print(queries.length);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Function to get Support Query Chat Data
  Future<void> getSupportQueryChats(
      {required String TicketId, required BuildContext ctx}) async {
    // isLoading = true;
    var token = SharedPref.shared.pref?.getString(PrefKeys.jwtToken);
    print(token);
    print(TicketId);
    await _myRepo
        .supportChatGetRequest(
            api: "${AppUrl.supportQuries}$TicketId", token: token.toString())
        .then((value) {
      if (value.status == true) {
        supportChats = value.data;
        print(supportChats.length);
        setLoading(false);
      } else {
        Utils.showFlushBarWithMessage("", "Something went wrong!", ctx);
      }
    }).onError((error, stackTrace) => setLoading(false));
  }
}
