import 'dart:convert';

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
}
