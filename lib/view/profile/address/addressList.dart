import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/card/addressCard.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/viewModel/addressViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AddressViewModel addressProvider;
  @override
  void initState() {
    super.initState();
    addressProvider = Provider.of<AddressViewModel>(context, listen: false);
    addressProvider.getAddressList(context);
    addressProvider.setText();
  }

  @override
  Widget build(BuildContext context) {
    addressProvider = Provider.of<AddressViewModel>(context);

    return Stack(children: [
      const LightBackGround(),
      Scaffold(
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const ProfileHeader(),
                    const InternalPageHeader(
                      text: "Address",
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Routes.navigateToManageAddressScreen(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: colors.buttonColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 5),
                          Text('Add new Address',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: addressCardsRow(
                                  context,
                                  addressProvider.addressList,
                                  addressProvider)),
                        ))),
              ],
            ),
          ))
    ]);
  }

  void actionPopUpItemSelected(String value, int index) {
    // _scaffoldkey.currentState.hideCurrentSnackBar();
    String message;
    if (value == 'edit') {
      Routes.navigateToEditAddressScreen(
          context, addressProvider.addressList[index]);
      message = 'You selected edit for $index';
    } else if (value == 'delete') {
      message = 'You selected delete for $index';
    } else {
      message = 'Not implemented';
    }
    // final snackBar = SnackBar(content: Text(message));
    // _scaffoldkey.currentState.showSnackBar(snackBar);
  }
}
