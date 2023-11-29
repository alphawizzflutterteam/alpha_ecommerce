import 'package:alpha_ecommerce_18oct/model/cartList.dart';
import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
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

  String selectedOption = 'Normal Delivery';

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartViewModel>(context, listen: false);
    addressProvider = Provider.of<AddressViewModel>(context, listen: false);
    cartProvider.getCartListItem(context);
    addressProvider.getAddressList(context);

    cartProvider.getSavedListItem(context);
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: cartProvider.isLoading
              ? appLoader()
              : Column(
                  children: [
                    const Stack(
                      children: [
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            cartProvider.cartModel.isEmpty
                                ? const Center(
                                    child: Text(
                                      "Nothing in cart list...",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size_16),
                                    ),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: cartCardRow(
                                                  context,
                                                  cartProvider.cartModel,
                                                  cartProvider))),
                                    )),
                            cartProvider.cartModel.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 20),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                            cartProvider.cartModel.isEmpty
                                ? Container()
                                : Container(
                                    height: 150,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0x14E9E9E9),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Text(
                                            "Price Detail",
                                            style: TextStyle(
                                                color: colors.textColor,
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
                                                      style: const TextStyle(
                                                          color:
                                                              colors.greyText,
                                                          fontSize: 12),
                                                    )
                                                  : Text(
                                                      "MRP (${cartProvider.model.data.totalItems} items)",
                                                      style: const TextStyle(
                                                          color:
                                                              colors.greyText,
                                                          fontSize: 12),
                                                    ),
                                              Text(
                                                cartProvider.model.data.total,
                                                style: const TextStyle(
                                                    color: colors.textColor,
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
                                                    color: colors.greyText,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                cartProvider
                                                    .model.data.deliveryCharge,
                                                style: TextStyle(
                                                    color: colors.textColor,
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
                                                    color: colors.greyText,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                cartProvider
                                                    .model.data.discount,
                                                style: TextStyle(
                                                    color: colors.textColor,
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
                                                    color: colors.textColor,
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
                                        const Text(
                                          "Offer & Benefits",
                                          style: TextStyle(
                                              color: colors.textColor,
                                              fontSize: 14),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              Images.cartOffer,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              onTap: () {
                                                Routes.navigateToCouponScreen(
                                                    context);
                                              },
                                              child: const Text(
                                                "View Offer",
                                                style: TextStyle(
                                                    color: colors.textColor,
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
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              cursorColor: Colors.white,
                                              textAlign: TextAlign.start,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                hintText: 'Voucher Number',
                                                hintStyle: const TextStyle(
                                                    color: colors.white10),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color:
                                                        colors.textFieldColor,
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
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: const Text(
                                "Saved Items",
                                style: TextStyle(
                                    color: colors.textColor, fontSize: 14),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Container(
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: savedCardsRow(
                                              context,
                                              cartProvider.savedModel,
                                              cartProvider)),
                                    ))),
                            // SizedBox(
                            //   height: 210 * 2.toDouble(),
                            //   child: ListView.builder(
                            //     padding: EdgeInsets.zero,
                            //     shrinkWrap: true,
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     itemCount: 2,
                            //     itemBuilder: (context, i) {
                            //       return SavedItemsWidget(i: i);
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    cartProvider.cartModel.isEmpty
                        ? Container()
                        : Align(
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              addressProvider
                                                      .addressList.isEmpty
                                                  ? const Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                    )
                                                  : const Icon(Icons
                                                      .radio_button_checked),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              addressProvider
                                                      .addressList.isEmpty
                                                  ? InkWell(
                                                      onTap: () {
                                                        Routes
                                                            .navigateToManageAddressScreen(
                                                                context);
                                                      },
                                                      child: const Text(
                                                        "Add Address",
                                                        style: TextStyle(
                                                            color: colors
                                                                .textColor,
                                                            fontSize: 16),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.68,
                                                      child: Text(
                                                        "${addressProvider.addressList[0].address}, ${addressProvider.addressList[0].address1}",
                                                        style: const TextStyle(
                                                            color: colors
                                                                .textColor,
                                                            fontSize: 15),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                              cartProvider.cartModel.isEmpty
                                                  ? Container()
                                                  : addressProvider
                                                          .addressList.isEmpty
                                                      ? const Icon(Icons
                                                          .arrow_forward_ios_rounded)
                                                      : const SizedBox(
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    cartProvider.cartModel.isEmpty
                                        ? Container()
                                        : const Divider(
                                            color: colors.textColor,
                                            height: 1,
                                          ),
                                    cartProvider.cartModel.isEmpty
                                        ? Container()
                                        : Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            height: 70,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  cartProvider.model.data.total,
                                                  style: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: colors.textColor),
                                                ),
                                                SizedBox(
                                                    height: 40,
                                                    width: 150,
                                                    child: CommonButton(
                                                      text: "PLACE ORDER",
                                                      fontSize: 14,
                                                      onClick: () async {
                                                        var billingId = SharedPref
                                                                .shared.pref!
                                                                .getString(PrefKeys
                                                                    .billingAddressID) ??
                                                            "";
                                                        var paymentMethod =
                                                            "cash_on_delivery";
                                                        String couponCode =
                                                            cartProvider
                                                                .couponController
                                                                .text;
                                                        String data =
                                                            "billing_address_id=$billingId&payment_method=$paymentMethod&transaction_id=${cartProvider.generateRandomTransactionID()}&is_wallet_used=0&wallet_amount=0&order_note=This is a order note.&coupan_code=$couponCode&coupan_amount";
                                                        var res =
                                                            await cartProvider
                                                                .placeOrder(
                                                                    data,
                                                                    context);
                                                        if (res) {
                                                          Routes
                                                              .navigateToPaymentScreen(
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
      selectedOption = value;
    });
  }
}
