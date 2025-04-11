import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/addressModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/cityModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/countryModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/stateModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressRepository with ChangeNotifier {
  Future<AddressModel> addressList(
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

    return addressModelFromJson(res.body);
  }

  Future<StateModel> stateList(
    String api,
  ) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(
      url,
    );

    print(res.body);
    var asn = await json.decode(res.body);

    return StateModel.fromJson(asn);
  }

  Future<CityModel> cityList(
    String api,
  ) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(
      url,
    );

    print(res.body);
    var asn = await json.decode(res.body);

    return CityModel.fromJson(asn);
  }

  Future<CountryModel> countryList(
    String api,
  ) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(
      url,
    );

    print(res.body);

    return countryModelFromJson(res.body);
  }

  Future<SuccessModel> addAddddress(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.post(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }

  Future<SuccessModel> updateAddress(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.put(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }

  Future<SuccessModel> deleteAddress(
    String api,
    String bearerToken,
  ) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.delete(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }
}
