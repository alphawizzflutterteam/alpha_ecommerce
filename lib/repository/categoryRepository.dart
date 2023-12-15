import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<CategoriesModel> categoryListRequest(
      String api, String bearerToken) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    var asn = await json.decode(res.body);

    return CategoriesModel.fromJson(asn);
  }
}
