import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/models/privacyPolicyModel.dart';
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
}
