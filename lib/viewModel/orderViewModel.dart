import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/orderRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/order/model/ordersModel.dart';
import 'package:flutter/material.dart';

class OrderViewModel with ChangeNotifier {
  List<OrdersList> orderList = [];
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
}
