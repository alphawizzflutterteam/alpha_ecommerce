import 'dart:async';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_button.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:provider/provider.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/no_internet.png"),
            Text("No Internet connection found"),
            Text("Check your connection"),
            // Center(
            //     child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 20,
            //           vertical: 15,
            //         ),
            //         child: SizedBox(
            //             height: 50,
            //             width: size_150,
            //             child: CommonButton(
            //                 text: "TRY AGAIN",
            //                 fontSize: Platform.isAndroid ? size_14 : size_14,
            //                 onClick: () {
            //                   _checkInternetAvailability();
            //                 }))))
          ],
        ),
      ),
    );
  }
}
