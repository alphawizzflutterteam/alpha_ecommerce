import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/vendorCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/vendorViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class Vendor extends StatefulWidget {
  const Vendor({Key? key}) : super(key: key);

  @override
  State<Vendor> createState() => _VendorState();
}

class _VendorState extends State<Vendor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late VendorViewModel vendorProvider;

  @override
  void initState() {
    super.initState();
    vendorProvider = Provider.of<VendorViewModel>(context, listen: false);
    vendorProvider.getVendorListItem(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    vendorProvider = Provider.of<VendorViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        RefreshIndicator(
          color: colors.buttonColor,
          backgroundColor: Colors.white,
          displacement: 40.0,
          strokeWidth: 2.0,
          semanticsLabel: 'Pull to refresh',
          semanticsValue: 'Refresh',
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
            vendorProvider.getVendorListItem(
              context,
            );
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            extendBody: true,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.white,
            body: Column(
              children: [
                Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : colors.buttonColor,
                  child: const Stack(
                    children: [
                      ProfileHeader(),
                      DashboardHeader(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: Colors.transparent),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Vendor List",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textColor
                                  : Colors.black,
                              fontSize: Platform.isAndroid ? size_16 : size_18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 5),
                      vendorProvider.isLoading
                          ? appLoader()
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * .65,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: vendorProvider.vendorModel.length,
                                itemBuilder: (context, i) {
                                  var model = vendorProvider.vendorModel[i];
                                  return vendorCard(context, model);
                                },
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
