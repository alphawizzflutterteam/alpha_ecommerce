import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductRepository with ChangeNotifier {
  Future<ProductDetailModel> getProductDetails(
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

    var asn = await json.decode(res.body);

    return ProductDetailModel.fromJson(asn);
  }

  Future<SuccessModel3> addToCart(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.post(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModel3FromJson(res.body);
  }

  Future<SuccessModel> removeFromCart(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.delete(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }

  Future<SuccessModel> removeFromWishlist(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.delete(url, body: data, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }

  Future<SuccessModel> addToWishlist(
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
}
