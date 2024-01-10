import 'dart:async';

import 'package:alpha_ecommerce_18oct/view/noInternet/noInternetScreen.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:provider/provider.dart';
import 'common_bottom.dart';

class Dashboard extends StatefulWidget {
  final int index;
  const Dashboard({Key? key, required this.index}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    // optional, false if you cont want continous lookup
    lookUpDuration: const Duration(seconds: 10),
    // optional, to override default lookup duration
    lookUpUrl: 'example.com', // optional, to override default lookup url
  );

  bool? _isInternetAvailableOnCall;

  bool _isInternetAvailableStreamStatus = true;

  StreamSubscription<bool>? _networkConnectionStream;

  late HomeViewModel homeProvider;
  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    _flutterNetworkConnectivity.getInternetAvailabilityStream().listen((event) {
      _isInternetAvailableStreamStatus = event;
      //  setState(() {
      print(_isInternetAvailableStreamStatus.toString() + "Avaiilable");
      //  });
    });
    init();
    checkInternetAvailability();
  }

  @override
  void dispose() {
    // _networkConnectionStream?.cancel();
    // _flutterNetworkConnectivity.unregisterAvailabilityListener();

    super.dispose();
  }

  void init() async {
    await _flutterNetworkConnectivity.registerAvailabilityListener();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkInternetAvailability() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      _isInternetAvailableOnCall =
          await _flutterNetworkConnectivity.isInternetConnectionAvailable();
      if (_isInternetAvailableOnCall!) {}
    } on PlatformException {
      _isInternetAvailableOnCall = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    //  setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);

    return !_isInternetAvailableStreamStatus
        ? NoInternetScreen()
        : BottomNavPage(
            index: widget.index,
          );
  }
}
