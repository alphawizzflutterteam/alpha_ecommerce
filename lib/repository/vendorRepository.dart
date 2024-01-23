import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/notification/model/notificationModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:http/http.dart' as http;

class VendorRepository {
  Future<VendorModel> vendorListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return vendorModelFromJson(res.body);
  }

  Future<NotificationModel> notificationListRequest(
      String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return notificationModelFromJson(res.body);
  }

  Future<CategoriesModel> vendorCategoriesRequest(
      String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    var asn = await json.decode(res.body);

    return CategoriesModel.fromJson(asn);
  }

  Future<SuccessModel2> followvendor(
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

  Future<SuccessModel2> markNotificationAsRead(
    String api,
    String bearerToken,
  ) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModel2FromJson(res.body);
  }
}
