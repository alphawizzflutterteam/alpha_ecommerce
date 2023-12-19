import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/orderRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/order/model/orderDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/ordersModel.dart';
import 'package:flutter/material.dart';

class OrderViewModel with ChangeNotifier {
  List<OrdersList> orderList = [];
  late DetailsData detail;
  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = OrderRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getOrderList(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo.orderListRequest(AppUrl.orderList, token).then((value) {
      orderList = value.data!;
      notifyListeners();

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
    });
  }

  Future<void> getOrderDetail(BuildContext context, String order_id) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    await _myRepo
        .orderDetailRequest(AppUrl.orderDetail, token, order_id)
        .then((value) {
      detail = value.data!;
      print("detail ${detail.products[0].price}");

      setLoading(false);
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      print(stackTrace.toString());
    });
  }

  Future<void> postOrderReturnRequest(
      {required String order_id,
      required String reason,
      required String amount}) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    await _myRepo.orderReturnRequest(
        api: AppUrl.orderReturn,
        bearerToken: token,
        order_id: order_id,
        amount: amount,
        refund_reason: reason);
  }
}
