import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../model/CartList.dart';
import '../../widgets/commonBackground.dart';
import '../../widgets/common_header.dart';
import '../../widgets/toast_message.dart';
import '../profile/common_header.dart';

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
                      for (int i = 0; i < 4; i++)
                        InkWell(
                          onTap: () {
                            Routes.navigateToProductDetailPageScreen(context);
                          },
                          child: Container(
                            height: cartList[i].productCount > 0 ? 190 : 0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0x14E9E9E9), width: 2)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      cartList[i].productImage,
                                      width: 110,
                                      height: 140,
                                    ),
                                    const SizedBox(width: 30),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartList[i].productName,
                                          style: const TextStyle(
                                              color: colors.textColor,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              cartList[i].productPrice,
                                              style: const TextStyle(
                                                  color: colors.buttonColor,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                cartList[i].productDiscount,
                                                style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: colors.greyText,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cartList[i].productWeight,
                                          style: const TextStyle(
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            buildCustomButton("-", () {
                                              if (cartList[i].productCount >
                                                  0) {
                                                setState(() {
                                                  cartList[i].productCount--;
                                                });
                                              }
                                            }),
                                            Container(
                                              height: 25,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        colors.textFieldColor),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  cartList[i]
                                                      .productCount
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: colors.textColor,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            buildCustomButton("+", () {
                                              setState(() {
                                                cartList[i].productCount++;
                                              });
                                            }),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: const Color(0x14E9E9E9),
                                              width: 3)),
                                      child: const Text(
                                        "Save for later",
                                        style: TextStyle(
                                            color: colors.textColor, fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: const Color(0x14E9E9E9),
                                              width: 3)),
                                      child: InkWell(
                                        onTap: () {
                                          showToastMessage(
                                              "Item remove from cart");
                                        },
                                        child: const Text(
                                          "Remove from cart",
                                          style: TextStyle(
                                              color: colors.textColor,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                  unselectedWidgetColor:
                                      colors.greyText),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: const Text(
                                        'Normal Delivery',
                                        style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 14,
                                        ),
                                        softWrap: false, // Add this line
                                      ),
                                      activeColor: colors.buttonColor,
                                      value: 'Normal Delivery',
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value.toString();
                                        });
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: const Text(
                                        'Alpha Delivery',
                                        style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 14,
                                        ),
                                        softWrap: false, // Add this line
                                      ),
                                      value: 'Alpha Delivery',
                                      activeColor: colors.buttonColor,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value.toString();
                                        });
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                    ),
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
                              style:
                                  TextStyle(color: colors.textColor, fontSize: 14),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.local_offer_outlined),
                                SizedBox(width: 10),
                                Text(
                                  "View Offer",
                                  style: TextStyle(
                                      color: colors.textColor, fontSize: 14),
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
                                    hintStyle: const TextStyle(
                                        color: colors.greyText),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:  BorderSide(
                                        color: colors.textFieldColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:  BorderSide(
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: colors.buttonColor,
                                  onPrimary: colors.textColor,
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  // Add your button action here
                                },
                                child: const Text('APPLY'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          "Saved Items",
                          style: TextStyle(color: colors.textColor, fontSize: 14),
                        ),
                      ),
                      for (int i = 0; i < 2; i++)
                        InkWell(
                          onTap: () {
                            Routes.navigateToProductDetailPageScreen(context);
                          },
                          child: Container(
                            height: 190,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0x14E9E9E9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      cartList[i].productImage,
                                      width: 110,
                                      height: 140,
                                    ),
                                    const SizedBox(width: 30),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartList[i].productName,
                                          style: const TextStyle(
                                              color: colors.textColor,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              cartList[i].productPrice,
                                              style: const TextStyle(
                                                  color: colors.buttonColor,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                cartList[i].productDiscount,
                                                style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: colors.greyText,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cartList[i].productWeight,
                                          style: const TextStyle(
                                              color: colors.greyText,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            buildCustomButton("-", () {
                                              if (cartList[i].productCount >
                                                  0) {
                                                setState(() {
                                                  cartList[i].productCount--;
                                                });
                                              }
                                            }),
                                            Container(
                                              height: 25,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        colors.textFieldColor),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  cartList[i]
                                                      .productCount
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: colors.textColor,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            buildCustomButton("+", () {
                                              setState(() {
                                                cartList[i].productCount++;
                                              });
                                            }),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: const Color(0x14E9E9E9),
                                              width: 3)),
                                      child: const Text(
                                        "Remove from Saved Items",
                                        style: TextStyle(
                                            color: colors.textColor, fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
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
                                          color: colors.textColor, fontSize: 16),
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
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: colors.buttonColor,
                                    onPrimary: colors.textColor,
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    Routes.navigateToPaymentScreen(context);
                                  },
                                  child: const Text('PLACE ORDER'),
                                ),
                              ),
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

  Widget buildCustomButton(String label, void Function() onPressed) {
    return Container(
      height: 25,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(color: colors.textFieldColor),
        borderRadius: BorderRadius.only(
          topLeft: label == "-" ? const Radius.circular(5) : Radius.zero,
          bottomLeft: label == "-" ? const Radius.circular(5) : Radius.zero,
          topRight: label == "+" ? const Radius.circular(5) : Radius.zero,
          bottomRight: label == "+" ? const Radius.circular(5) : Radius.zero,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color(0x14E9E9E9),
          onPrimary: Colors.white,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
