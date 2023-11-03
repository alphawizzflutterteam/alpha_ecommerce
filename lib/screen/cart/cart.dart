import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:alpha_ecommerce_18oct/screen/cart/savedItems.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';
import '../widget_common/common_radioButton.dart';
import 'cartList.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedOption = 'Alpha Delivery';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                children: const [
                  ProfileHeader(),
                  DashboardHeader(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Cart List",
                          style: TextStyle(
                              color: colors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (int i = 0; i < 4; i++) CartListWidget(i: i),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Delivery type",
                              style: TextStyle(
                                  color: colors.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: colors.greyText),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CommonRadioTile(
                                    options: selectedOption,
                                    name: 'Normal Delivery',
                                    onChanged: handleOptionChange,
                                  ),
                                  CommonRadioTile(
                                    options: selectedOption,
                                    name: 'Alpha Delivery',
                                    onChanged: handleOptionChange,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0x14E9E9E9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "Price Detail",
                                style: TextStyle(
                                    color: colors.textColor, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "MRP (4 items)",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    "\$480.00",
                                    style: TextStyle(
                                        color: colors.textColor, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Delivery free",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    "\$20.00",
                                    style: TextStyle(
                                        color: colors.textColor, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Discount",
                                    style: TextStyle(
                                        color: colors.greyText, fontSize: 12),
                                  ),
                                  Text(
                                    "\$80.00",
                                    style: TextStyle(
                                        color: colors.textColor, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 5,
                              color: colors.greyText,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        color: colors.textColor, fontSize: 14),
                                  ),
                                  Text(
                                    "\$600.00",
                                    style: TextStyle(
                                        color: colors.buttonColor,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Offer & Benefits",
                              style: TextStyle(
                                  color: colors.textColor, fontSize: 14),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.local_offer_outlined),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Routes.navigateToOffersScreen(context);
                                  },
                                  child: const Text(
                                    "View Offer",
                                    style: TextStyle(
                                        color: colors.textColor, fontSize: 14),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextField(
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    hintText: 'Voucher Number',
                                    hintStyle:
                                        const TextStyle(color: colors.greyText),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: colors.textFieldColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: colors.textFieldColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                height: 40,
                                width: 110,
                                child: CommonButton(
                                    text: "APPLY",
                                    fontSize: 14,
                                    onClick: () {})),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          "Saved Items",
                          style:
                              TextStyle(color: colors.textColor, fontSize: 14),
                        ),
                      ),
                      for (int i = 0; i < 2; i++) SavedItemsWidget(i: i)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  color: colors.textFieldBG,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: InkWell(
                            onTap: () {
                              Routes.navigateToManageAddressScreen(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Add Address",
                                      style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded)
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: colors.textColor,
                          height: 1,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "\$480.00",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: colors.textColor),
                              ),
                              SizedBox(
                                  height: 40,
                                  width: 150,
                                  child: CommonButton(
                                    text: "PLACE ORDER",
                                    fontSize: 14,
                                    onClick: () {
                                      Routes.navigateToPaymentScreen(context);
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void handleOptionChange(String value) {
    setState(() {
      selectedOption = value;
    });
  }
}
