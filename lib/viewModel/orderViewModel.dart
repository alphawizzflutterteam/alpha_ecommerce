import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/orderRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/orderDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/ordersModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderViewModel with ChangeNotifier {
  List<OrdersList> orderList = [];
  late DetailsData detail;
  List<ProductList> RecommendedProducts = [];
  bool isLoading = false;
  Filters filters = Filters();
  var status = "";
  TextEditingController searchText = TextEditingController();
  var categorie = "";

  bool get loading => isLoading;
  final _myRepo = OrderRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getOrderList(
    BuildContext context,
  ) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .orderListRequest(
              AppUrl.orderList +
                  "?status=" +
                  status +
                  "&categorie=" +
                  categorie +
                  "&search_text=" +
                  searchText.text,
              token)
          .then((value) {
        orderList = value.data!;
        filters = value.filters!;
        setLoading(false);

        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        notifyListeners();
        print(stackTrace.toString() + "ORder Error");
      });
    }
  }

  Future<void> getOrderDetail(BuildContext context, String order_id) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);
    print(order_id + "ID");
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .orderDetailRequest(AppUrl.orderDetail, token, order_id)
          .then((value) {
        detail = value.data!;
        RecommendedProducts = value.recommendedProducts;
        // print("detail ${detail.shippingAddress!.address!}");

        setLoading(false);
        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(stackTrace.toString() + "API ERRORR ORDER DETAIL");
      });
    }
  }

  Future<void> postOrderReturnRequest(
      {required String order_id,
      required String reason,
      required String amount,
      required BuildContext context}) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .orderReturnRequest(
              api: AppUrl.orderReturn,
              bearerToken: token,
              order_id: order_id,
              amount: amount,
              refund_reason: reason)
          .then((value) {
        Utils.showFlushBarWithMessage("", value.message, context);
        getOrderList(context);
      });
    }
  }

  Future<void> getOrderCancelRequest(
      {required String order_id,
      required String reason,
      required BuildContext context}) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .orderCancelRequest(
              api: AppUrl.orderCancel +
                  "?order_id=" +
                  order_id +
                  "&remarks=" +
                  reason,
              bearerToken: token,
              order_id: order_id,
              cancel_reason: reason)
          .then((value) {
        if (value.status) {
          Navigator.pop(context);
          Routes.navigateToOrderCancelledScreen(context, order_id);
        } else {
          Navigator.pop(context);
        }
        Utils.showFlushBarWithMessage("", value.message, context);
      });
    }
  }

  Future<bool> cancelOrder(
      {required String order_id,
      required String reason,
      required BuildContext context}) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;

    _myRepo
        .cancelOrder(
            AppUrl.orderCancel + "?order_id=" + order_id + "&remarks=" + reason,
            token)
        .then((value) {
      setLoading(false);
      Navigator.pop(context);
      Navigator.pop(context);
      Utils.showFlushBarWithMessage("Alert", value.message, context);
      getOrderList(context);

      print(value.message);

      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      Utils.showFlushBarWithMessage("Alert", error.toString(), context);
      return false;
    });
    return false;
  }

//Funcation to submit order review
  Future<void> postOrderReviewRequest(
      {required String order_id,
      required String comment,
      required String rating,
      required String product_id,
      required BuildContext context}) async {
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .orderReviewRequest(
              api: AppUrl.writeReview,
              bearerToken: token,
              order_id: order_id,
              product_id: product_id,
              comment: comment,
              rating: rating)
          .then((value) {
        Utils.showFlushBarWithMessage("", value.message, context);
      });
    }
  }
}
