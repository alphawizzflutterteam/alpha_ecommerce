import 'package:alpha_ecommerce_18oct/model/cartList.dart';
import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/cart/cards/cartCard.dart';
import 'package:alpha_ecommerce_18oct/view/cart/cards/savedItemCard.dart';
import 'package:alpha_ecommerce_18oct/view/cart/savedItems.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/cartCard.dart.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/wishlistCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/addressViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';
import '../widget_common/common_radioButton.dart';
import 'cartListCard.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late CartViewModel cartProvider;
  late AddressViewModel addressProvider;
  bool apiHitted = false;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartViewModel>(context, listen: false);
    addressProvider = Provider.of<AddressViewModel>(context, listen: false);
    if (cartProvider.selectedOption == "Normal Delivery") {
      cartProvider.getCartListItem(context, "", "0", "", "");
    } else {
      cartProvider.getCartListItem(context, "", "1", "", "");
    }

    handleOptionChange(cartProvider.selectedOption);
    //cartProvider.getSavedListItem(context);
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartViewModel>(context);
    addressProvider = Provider.of<AddressViewModel>(context);
    if (addressProvider.addressList.isEmpty && !apiHitted) {
      addressProvider.getAddressList(context);
      apiHitted = true;
    }
    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
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
              cartProvider.isLoading
                  ? appLoader()
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Cart List",
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.textColor
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            cartProvider.cartModel.isEmpty
                                ? Center(
                                    child: Text(
                                      "Nothing in cart list...",
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.textColor
                                              : colors.greyText,
                                          fontSize: size_16),
                                    ),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: cartCardRow(
                                              context,
                                              cartProvider.cartModel,
                                              cartProvider),
                                        ),
                                      ),
                                    ),
                                  ),
                            cartProvider.cartModel.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Text(
                                          "Delivery type",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.textColor
                                                  : Colors.black,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: RadioListTile(
                                                    title: Text(
                                                      'Normal Delivery',
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                    ),
                                                    activeColor:
                                                        colors.buttonColor,
                                                    groupValue: cartProvider
                                                        .selectedOption,
                                                    onChanged: (value) {
                                                      handleOptionChange(
                                                          "Normal Delivery");
                                                    },
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 0),
                                                    value: 'Normal Delivery',
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: RadioListTile(
                                                    title: Text(
                                                      'Alpha Delivery',
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                      softWrap: false,
                                                    ),
                                                    activeColor:
                                                        colors.buttonColor,
                                                    groupValue: cartProvider
                                                        .selectedOption,
                                                    onChanged: (value) {
                                                      handleOptionChange(
                                                          "Alpha Delivery");
                                                    },
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 0),
                                                    value: 'Alpha Delivery',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            cartProvider.cartModel.isEmpty
                                ? Container()
                                : Container(
                                    height: MediaQuery.of(context).size.height *
                                        .25,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color(0x14E9E9E9)
                                          : Color(0xFFE3E1EC),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Text(
                                            "Price Detail",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? colors.textColor
                                                    : Colors.black,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              int.parse(cartProvider.model.data
                                                          .totalItems) <
                                                      2
                                                  ? Text(
                                                      "MRP (${cartProvider.model.data.totalItems} item)",
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? colors.textColor
                                                              : Colors.black,
                                                          fontSize: 12),
                                                    )
                                                  : Text(
                                                      "MRP (${cartProvider.model.data.totalItems} items)",
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? colors.textColor
                                                              : Colors.black,
                                                          fontSize: 12),
                                                    ),
                                              Text(
                                                cartProvider.model.data.mrp,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Delivery fee",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.greyText
                                                        : Colors.black54,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                cartProvider
                                                    .model.data.deliveryCharge,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tax",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.greyText
                                                        : Colors.black54,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                cartProvider.model.data.tax,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Discount",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.greyText
                                                        : Colors.black54,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                "- " +
                                                    cartProvider
                                                        .model.data.discount,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 5,
                                          color: colors.greyText,
                                          thickness: 1,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total Amount",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                cartProvider.model.data.total,
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
                            cartProvider.cartModel.isEmpty
                                ? Container()
                                : Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Offer & Benefits",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.textColor
                                                  : Colors.black,
                                              fontSize: 14),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images.cartOffer,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.textColor
                                                  : Colors.black,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {
                                                Routes.navigateToCouponScreen(
                                                    context);
                                              },
                                              child: Text(
                                                "View Offer",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                            cartProvider.cartModel.isEmpty
                                ? Container()
                                : Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: TextField(
                                              controller:
                                                  cartProvider.couponController,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black),
                                              cursorColor: Colors.white,
                                              textAlign: TextAlign.start,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                hintText: 'Voucher Number',
                                                hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? colors.greyText
                                                      : Colors.black45,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: colors.boxBorder,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color:
                                                        colors.textFieldColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                onClick: () {
                                                  cartProvider.applyCoupon(
                                                      cartProvider
                                                          .couponController
                                                          .text,
                                                      context);
                                                })),
                                      ],
                                    ),
                                  ),
                            cartProvider.savedModel.isEmpty
                                ? SizedBox(
                                    height: size_200 * 1.35,
                                  )
                                : Container(),
                            cartProvider.savedModel.isNotEmpty
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      "Saved Items",
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.textColor
                                              : Colors.black,
                                          fontSize: 14),
                                    ),
                                  )
                                : Container(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: savedCardsRow(
                                          context,
                                          cartProvider.savedModel,
                                          cartProvider)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              cartProvider.isLoading
                  ? Container()
                  : cartProvider.cartModel.isEmpty
                      ? Container()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .125,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? colors.textFieldBG
                                    : Colors.white,
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            addressProvider.addressList.isEmpty
                                                ? const Icon(
                                                    Icons.location_on,
                                                    color: Colors.red,
                                                  )
                                                : Icon(
                                                    Icons.pin_drop,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black,
                                                  ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            addressProvider.addressList.isEmpty
                                                ? InkWell(
                                                    onTap: () {
                                                      Routes
                                                          .navigateToManageAddressScreen(
                                                              context);
                                                    },
                                                    child: Text(
                                                      "Add Address",
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? colors.textColor
                                                              : Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.63,
                                                    child: Text(
                                                      addressProvider
                                                          .selectedAddress,
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? colors.textColor
                                                              : Colors.black,
                                                          fontSize: size_12),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                            cartProvider.cartModel.isEmpty
                                                ? Container()
                                                : addressProvider
                                                        .addressList.isEmpty
                                                    ? const Icon(Icons
                                                        .arrow_forward_ios_rounded)
                                                    : InkWell(
                                                        onTap: () {
                                                          Routes
                                                              .navigateToAddressListScreen(
                                                                  context,
                                                                  true);
                                                        },
                                                        child: const SizedBox(
                                                          child: Text(
                                                            "(Change)",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 15),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  cartProvider.cartModel.isEmpty
                                      ? Container()
                                      : Divider(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.textColor
                                              : Colors.black,
                                          height: 1,
                                        ),
                                  cartProvider.cartModel.isEmpty
                                      ? Container()
                                      : Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cartProvider.model.data.total,
                                                style: TextStyle(
                                                  fontSize: size_20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? colors.textColor
                                                      : Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .35,
                                                  child: CommonButton(
                                                    text: "PLACE ORDER",
                                                    fontSize: 12,
                                                    onClick: () async {
                                                      var billingId = SharedPref
                                                              .shared.pref!
                                                              .getString(PrefKeys
                                                                  .billingAddressID) ??
                                                          addressProvider
                                                              .addressList[0].id
                                                              .toString();
                                                      var paymentMethod =
                                                          "cash_on_delivery";
                                                      String couponCode =
                                                          cartProvider
                                                              .couponController
                                                              .text;
                                                      String data =
                                                          "billing_address_id=$billingId&payment_method=$paymentMethod&transaction_id=${cartProvider.generateRandomTransactionID()}&is_wallet_used=0&wallet_amount=0&order_note=This is a order note.&coupan_code=$couponCode&coupan_amount";

                                                      var res = await cartProvider
                                                          .checkDeliveryStatus(
                                                              context,
                                                              billingId
                                                                  .toString());

                                                      print(res.toString() +
                                                          "CHECK AVAILABILITY");

                                                      if (res) {
                                                        Routes
                                                            .navigateToPaymentScreen(
                                                                context,
                                                                data,
                                                                billingId,
                                                                couponCode,
                                                                true,
                                                                "order");
                                                      } else {
                                                        Utils.showFlushBarWithMessage(
                                                            "",
                                                            "Delivery not available on this pincode.",
                                                            context);
                                                      }
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
      cartProvider.selectedOption = value;
      if (value == "Alpha Delivery") {
        print(value);
        cartProvider.getCartListItem(
            context, cartProvider.couponController.text, "1", "0", "");
      } else {
        cartProvider.getCartListItem(
            context, cartProvider.couponController.text, "0", "0", "");
      }
    });
  }
}
