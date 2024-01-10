import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';

class NetworkViewModel with ChangeNotifier {
  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    // optional, false if you cont want continous lookup
    lookUpDuration: const Duration(seconds: 10),
    // optional, to override default lookup duration
    lookUpUrl: 'example.com', // optional, to override default lookup url
  );

  Future<bool> checkInternetAvailability() async {
    try {
      bool _isInternetAvailableOnCall =
          await _flutterNetworkConnectivity.isInternetConnectionAvailable();
      if (_isInternetAvailableOnCall) {
        return true;
      } else {}
    } on PlatformException {
      // _isInternetAvailableOnCall = null;
    }

    return false;
  }
}
