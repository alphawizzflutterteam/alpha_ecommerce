import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:http/http.dart' as http;

class CartRepository {
  Future<CartModel> cartListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return cartModelFromJson(res.body);
  }

  Future<WishlistModel> savedListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return wishlistModelFromJson(res.body);
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

  Future<SuccessModel> checkDeliveryStatus(
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

    return successModelFromJson(res.body);
  }

  Future<SuccessModel> addToSaveLater(
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

  Future<SuccessModel> removeFromSaveLater(
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

  Future<SuccessModel> updateCart(
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

  Future<SuccessModel> applyCoupon(
      String api, String bearerToken, dynamic data) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }

  Future<SuccessModel> placeOrder(String api, String bearerToken) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(res.body);

    return successModelFromJson(res.body);
  }
}
