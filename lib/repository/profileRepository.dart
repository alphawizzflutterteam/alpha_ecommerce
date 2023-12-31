import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/privacyPolicyModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/referralModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/subscriptionModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/model/transactionHistoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/model/walletModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/refund/model/refundHistoryModel.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  Future<SuccessModel> updateProfileRequest(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.put(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return successModelFromJson(res.body);
  }

  Future<PrivacyPolicyModel> getPrivacyPolicyDataRequest(
      {required String api}) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url);
    print(res.body);
    var ans = await jsonDecode(res.body);
    return PrivacyPolicyModel.fromJson(ans);
  }

  Future<TransactionHistoryModel> getTransactionHistoryDataRequest(
      {required String api, required String bearerToken}) async {
    final url = Uri.parse(api);
    print(api);

    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(res.body);
    var ans = await jsonDecode(res.body);
    return TransactionHistoryModel.fromJson(ans);
  }

  Future<RefundModel> getRefundHistoryDataRequest(
      {required String api, required String bearerToken}) async {
    final url = Uri.parse(api);
    print(api);

    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(res.body);
    var ans = await jsonDecode(res.body);
    return RefundModel.fromJson(ans);
  }

  Future<WalletHistory> getWalletHistoryDataRequest(
      {required String api, required String bearerToken}) async {
    final url = Uri.parse(api);
    print(api);

    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(res.body);
    var ans = await jsonDecode(res.body);
    return WalletHistory.fromJson(ans);
  }

  Future<ReferralModel> getReferralDataRequest(
      {required String api, required String bearerToken}) async {
    final url = Uri.parse(api);
    print(api);

    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(res.body);
    var ans = await jsonDecode(res.body);
    return ReferralModel.fromJson(ans);
  }

  Future<SubscriptionModel> getSubscriptionDataRequest(
      {required String api, required String bearerToken}) async {
    final url = Uri.parse(api);
    print(api);

    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(res.body);
    var ans = await jsonDecode(res.body);
    return SubscriptionModel.fromJson(ans);
  }

  Future<SuccessModel2> addToWallet(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.post(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModel2FromJson(res.body);
  }
}
