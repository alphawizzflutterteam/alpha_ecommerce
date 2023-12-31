import 'dart:convert';

import 'package:alpha_ecommerce_18oct/view/home/models/bannersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/cartHomeNew.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/filtersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<BrandsModel> brandsListApi(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return brandsModelFromJson(res.body);
  }

  Future<SpecialOffersModel> specialOffersListApi(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return specialOffersModelFromJson(res.body);
  }

  Future<BannersModel> bannersListApi(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return bannersModelFromJson(res.body);
  }

  Future<DailyDealsModel> dailyDealsListApi(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return dailyDealsModelFromJson(res.body);
  }

  Future<ProductsModel> productsListApi(String api) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(
      url,
    );

    return productsModelFromJson(res.body);
  }

  Future<CategoriesModel> categoryListRequest(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );
    var asn = await json.decode(res.body);

    return CategoriesModel.fromJson(asn);
  }

  Future<WishlistModel> wishlistRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return wishlistModelFromJson(res.body);
  }

  Future<HomeCartModel> cartListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return homeCartModelFromJson(res.body);
  }

  Future<FiltersModel> filterListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);
    var asn = await json.decode(res.body);

    return FiltersModel.fromJson(asn);
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

  Future<SuccessModel> addToCart(
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
}
