import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/home/models/successModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/orderDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/ordersModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/returnOrderModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class OrderRepository {
  Future<OrdersModel> orderListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);
    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(api);
    print(res.body);
    var asn = await json.decode(res.body);

    return OrdersModel.fromJson(asn);
  }

  Future<OrderDetailsModel> orderDetailRequest(
      String api, String bearerToken, String order_id) async {
    final url = Uri.parse(api).replace(queryParameters: {
      'status': '',
      'categories': '',
      'order_id': order_id,
    });

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(api);
    print(order_id);
    var asn = await json.decode(res.body);
    return OrderDetailsModel.fromJson(asn);
  }

  Future<ReturnOrderModel> orderDetailReturnRequest(
      String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(api);

    print(res.body);
    return returnOrderModelFromJson(res.body);
  }

//Function for order return request
  Future<SuccessModel> orderReturnRequest(
      {required String api,
      required String bearerToken,
      required String order_id,
      required String amount,
      required String refund_reason}) async {
    print(refund_reason + " " + order_id + " " + amount);
    final url = Uri.parse(api).replace(queryParameters: {
      'order_details_id': '',
      'amount': amount,
      'order_id': order_id,
      'refund_reason': refund_reason,
    });
    final http.Response res;
    res = await http.post(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(api);
    print(res.body);
    var asn = await json.decode(res.body);

    return SuccessModel.fromJson(asn);
  }

//Function for order canccel request
  Future<SuccessModel2> orderCancelRequest(
      {required String api,
      required String bearerToken,
      required String order_id,
      required String cancel_reason}) async {
    print(cancel_reason + " " + order_id);
    final url = Uri.parse(api);
    print(api + " ");

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(api);
    print(res.body);
    var asn = await json.decode(res.body);

    return SuccessModel2.fromJson(asn);
  }

  Future<SuccessModel2> cancelOrder(
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

//Function for order review
  Future<SuccessModel> orderReviewRequest({
    required String api,
    required String bearerToken,
    required String order_id,
    required String product_id,
    required String comment,
    required String rating,
  }) async {
    Map para = {
      'order_id': order_id,
      'product_id': product_id,
      'rating': rating,
      'comment': comment,
    };
    final url = Uri.parse(api);
    final http.Response res;
    res = await http.post(url, body: para, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(api);

    print(res.body);
    var ans = jsonDecode(res.body);

    return SuccessModel.fromJson(ans);
  }

  Future<SuccessModel> deleteReviewRequest({
    required String api,
    required String bearerToken,
    required String order_id,
  }) async {
    Map para = {
      'id': order_id,
    };
    final url = Uri.parse(api);
    final http.Response res;
    res = await http.post(url, body: para, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(api);

    print(res.body);
    var ans = jsonDecode(res.body);

    return SuccessModel.fromJson(ans);
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

  Future<Map<String, dynamic>> multipartRequestReview(
      String api, File userImage, MediaType mediaType,
      {required String order_id,
      required String product_id,
      required String rating,
      required String comment}) async {
    final url = Uri.parse(api);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    print(
        "========================================================================================================");
    print(
        "-------------------------------------------- URL --------------------------------------------");
    print("$url");
    print(
        "-------------------------------------------- PARAMETERS --------------------------------------------");
    print("${userImage.path.split('/').last}");

    final length = await userImage.length();

    final request = http.MultipartRequest(
      "POST",
      url,
    );
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }); // request.headers["apipassword"] = APIs.apipassword;
    // request.headers["Content-type"] = "multipart/form-data";
    request.fields["product_id"] = product_id.toString();
    request.fields["comment"] = comment.toString();
    request.fields["rating"] = rating.toString();
    request.fields["order_id"] = order_id.toString();

    request.files.add(http.MultipartFile(
        'fileUpload[]', userImage.readAsBytes().asStream(), length,
        filename: userImage.path.split('/').last, contentType: mediaType));

    final streamRes = await request.send();
    final res = await http.Response.fromStream(streamRes);
    print(res.body);

    final Map<String, dynamic> json = await jsonDecode(res.body);

    return json;
  }
}
