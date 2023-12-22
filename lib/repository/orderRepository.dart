import 'dart:convert';
import 'dart:developer';

import 'package:alpha_ecommerce_18oct/view/order/model/orderDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/ordersModel.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  Future<OrdersModel> orderListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);
    print(bearerToken);
    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    print(api);

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

//Function for order return request
  Future<void> orderReturnRequest(
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
  }

//Function for order canccel request
  Future<void> orderCancelRequest(
      {required String api,
      required String bearerToken,
      required String order_id,
      required String cancel_reason}) async {
    print(cancel_reason + " " + order_id);
    final url = Uri.parse(api).replace(queryParameters: {
      'order_id': order_id,
      'remarks': cancel_reason,
    });
    final http.Response res;
    res = await http.post(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(api);
    print(res.body);
  }

//Function for order review
  Future<void> orderReviewRequest({
    required String api,
    required String bearerToken,
    required String order_id,
    required String product_id,
    required String comment,
    required String rating,
  }) async {
    final url = Uri.parse(api).replace(queryParameters: {
      'order_id': order_id,
      'product_id': product_id,
      'rating': rating,
      'comment': comment,
    });
    final http.Response res;
    res = await http.post(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });
    print(api);
    print(res.body);
  }
}
