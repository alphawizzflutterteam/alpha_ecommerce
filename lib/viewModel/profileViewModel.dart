import 'dart:ffi';
import 'dart:io';
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
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = ProfileRepository();
  late PrivacyPolicyModel privacyPolicyData;

  List<DatumTrasaction> transactionDatta = [];
  List<DatumRefund> refundData = [];
  List<WalletTransactioList> walletHistory = [];
  List<ReferralData> referralList = [];
  List<SubscriptionData> subscriptionList = [];
  File? selecteddUserImage;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> pickFile(BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      selecteddUserImage = File(result.files.single.path!);
      var res = await _myRepo.multipartRequest(
          AppUrl.updateImage, selecteddUserImage!, MediaType('image', 'jpeg'));
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

  Future<void> uploadFile(BuildContext context) async {
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

  Future<void> updateProfile(BuildContext context, dynamic data) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

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

//Funcation to fetch All Privacy Policy Data
  Future<void> getPrivacyPolicyData() async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
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

  Future<void> getTransactionHistoryData() async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
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

  Future<void> getRefundHistoryData() async {
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

  Future<void> getWalletHistory() async {
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

//Function to fetch referral data
  Future<void> getReferralData() async {
    setLoading(true);
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

//Function to fetch subscription data
  Future<void> getSubscriptionData() async {
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
