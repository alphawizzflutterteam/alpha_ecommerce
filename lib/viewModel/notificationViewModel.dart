import 'package:alpha_ecommerce_18oct/repository/couponRepository.dart';
import 'package:alpha_ecommerce_18oct/repository/vendorRepository.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/notification/model/notificationModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/networkViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationViewModel with ChangeNotifier {
  List<DatumNot> notificationList = [];

  bool isLoading = false;
  bool get loading => isLoading;
  final _myRepo = VendorRepository();

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getNotificationlist(BuildContext context) async {
    setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .notificationListRequest(AppUrl.notifications, token)
          .then((value) {
        notificationList = value.data;

        setLoading(false);

        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
      });
    }
  }

  Future<void> markRead(BuildContext context, String id, String forall) async {
    //setLoading(true);
    var token = SharedPref.shared.pref!.getString(PrefKeys.jwtToken)!;
    print(token);

    NetworkViewModel networkProvider =
        Provider.of<NetworkViewModel>(context, listen: false);

    var isInternetAvailable = await networkProvider.checkInternetAvailability();
    if (!isInternetAvailable) {
      setLoading(false);

      Utils.showFlushBarWithMessage("", "No Internet Connection", context);
    } else {
      await _myRepo
          .markNotificationAsRead(
              AppUrl.notificationsRead + id + "&all=" + forall, token)
          .then((value) {
        getNotificationlist(context);
        HomeViewModel homeProvider =
            Provider.of<HomeViewModel>(context, listen: false);
        homeProvider.getProfileAPI("", context);
        // setLoading(false);

        notifyListeners();
      }).onError((error, stackTrace) {
        setLoading(false);
        print(error.toString());
      });
    }
  }
}
