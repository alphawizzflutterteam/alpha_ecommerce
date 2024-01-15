import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../../model/paymentMethod.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_button.dart';
import '../../../widget_common/common_header.dart';
import '../../common_header.dart';

class Payment extends StatefulWidget {
  final String data;
  final String billingId;
  final String couponCode;
  final bool showCod;
  final String isComingFor;
  const Payment({
    super.key,
    required this.data,
    required this.billingId,
    required this.couponCode,
    required this.showCod,
    required this.isComingFor,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? selectedPaymentMethod;
  Razorpay? _razorpay;
  int? pricerazorpayy;
  String selectedMethod = "";
  late CartViewModel cartProvider;
  List<PaymentMethodList> paymentMethods = [];
  late HomeViewModel homeProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartViewModel>(context, listen: false);
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    if (widget.showCod && widget.isComingFor == "order") {
      paymentMethods.add(PaymentMethodList(
          paymentMethodName: 'Cash On Delivery',
          paymentMethodImage: Images.cod));
    } else {}
    paymentMethods.add(PaymentMethodList(
        paymentMethodName: 'Razor Pay', paymentMethodImage: Images.razorpay));
    if (widget.isComingFor != "wallet") {
      paymentMethods.add(PaymentMethodList(
          paymentMethodName: 'Wallet', paymentMethodImage: Images.wallet));
    }
  }

  void openCheckout(amount) async {
    double res = double.parse(amount.toString());
    pricerazorpayy = int.parse(res.toStringAsFixed(0)) * 100;
    // Navigator.of(context).pop();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "$pricerazorpayy",
      'name': 'Place Order',
      'image': 'assets/images/loogo_black.png',
      'description': 'Place Order',
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Utils.toastMessage("Payment successfully");

    if (widget.isComingFor == "wallet") {
      var uuserID = SharedPref.shared.pref!.getString(PrefKeys.userId)!;

      Map data = {
        'user_id': uuserID,
        'amount': widget.couponCode,
        'transaction_type': 'add_wallet',
        "transaction_id": response.paymentId
      };
      homeProvider.addMoneyToWallet(data, context);
    } else if (widget.isComingFor == "subscription") {
      var uuserID = SharedPref.shared.pref!.getString(PrefKeys.userId)!;

      Map data = {'plan_id': widget.data, "transaction_id": response.paymentId};
      homeProvider.subscribeAlpha(data, context);
    } else if (selectedMethod == "Razor Pay") {
      setTransactionId(response.paymentId!);
    } else {
      setTransactionIdWallet(response.paymentId!);
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Utils.toastMessage("Payment cancelled by user");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartViewModel>(context);
    homeProvider = Provider.of<HomeViewModel>(context);

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
                child: Stack(
                  children: const [
                    ProfileHeader(),
                    InternalPageHeader(text: "Add Money")
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Select payment method",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).brightness !=
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: paymentMethods.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () async {
                                if (paymentMethods[i].paymentMethodName ==
                                    "Cash On Delivery") {
                                  await cartProvider.placeOrder(
                                      widget.data, context);
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness !=
                                          Brightness.dark
                                      ? const Color.fromARGB(255, 212, 212, 212)
                                      : Color.fromARGB(255, 147, 147, 147),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0x660A9494),
                                  ),
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    paymentMethods[i].paymentMethodImage,
                                    width: 40,
                                    height: 40,
                                  ),
                                  title: Text(
                                    paymentMethods[i].paymentMethodName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color:
                                                Theme.of(context).brightness !=
                                                        Brightness.dark
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14),
                                  ),
                                  trailing: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: colors.greyText),
                                    child: Radio<int>(
                                      value: i,
                                      groupValue: selectedPaymentMethod,
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedPaymentMethod = value;
                                          print(value);
                                        });
                                        selectedMethod =
                                            paymentMethods[i].paymentMethodName;
                                      },
                                      focusColor: colors.buttonColor,
                                      hoverColor: colors.buttonColor,
                                      activeColor: colors.buttonColor,
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: cartProvider.isLoading
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Center(
                            child: LoadingAnimationWidget.halfTriangleDot(
                          color: colors.buttonColor,
                          size: 40,
                        )),
                      )
                    : Container(
                        height: 80,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? colors.textFieldBG
                            : const Color.fromARGB(255, 228, 228, 228),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: CommonButton(
                                        text: "CONTINUE",
                                        fontSize: Platform.isAndroid
                                            ? size_12
                                            : size_14,
                                        onClick: () async {
                                          if (widget.isComingFor == "wallet") {
                                            openCheckout(widget.couponCode);
                                          } else if (widget.isComingFor ==
                                              "subscription") {
                                            openCheckout(widget.couponCode);
                                          } else {
                                            if (selectedPaymentMethod != null &&
                                                selectedMethod ==
                                                    "Cash On Delivery") {
                                              await cartProvider.placeOrder(
                                                  widget.data, context);
                                            } else if (selectedPaymentMethod !=
                                                    null &&
                                                selectedMethod == "Razor Pay") {
                                              //cartProvider.model.data.total
                                              var billingId = SharedPref
                                                  .shared.pref!
                                                  .getString(PrefKeys
                                                      .billingAddressID);

                                              var paymentMethod = "razorpay";
                                              String couponCode = cartProvider
                                                  .couponController.text;
                                              String data =
                                                  "billing_address_id=$billingId&payment_method=$paymentMethod&transaction_id=${cartProvider.generateRandomTransactionID()}&is_wallet_used=0&wallet_amount=0&order_note=This is a order note.&coupan_code=$couponCode&coupan_amount";

                                              var amout = cartProvider
                                                      .model.data.subtotal
                                                  // .replaceFirst("₹ ", "")
                                                  ;
                                              print(amout);
                                              openCheckout(amout);
                                            } else if (selectedPaymentMethod !=
                                                    null &&
                                                selectedMethod == "Wallet") {
                                              if (widget.isComingFor ==
                                                  "order") {
                                                var billingId = SharedPref
                                                    .shared.pref!
                                                    .getString(PrefKeys
                                                        .billingAddressID);

                                                var paymentMethod =
                                                    "pay_by_wallet";
                                                String couponCode = cartProvider
                                                    .couponController.text;
                                                var amout = cartProvider
                                                    .model.data.total
                                                    .replaceFirst("₹ ", "");
                                                String data =
                                                    "billing_address_id=$billingId&payment_method=$paymentMethod&transaction_id=${cartProvider.generateRandomTransactionID()}&is_wallet_used=1&wallet_amount=$amout&order_note=This is a order note.&coupan_code=$couponCode&coupan_amount";

                                                print(amout);
                                                await cartProvider.placeOrder(
                                                    data,
                                                    context); // registration();

                                                // openCheckout(amout);
                                              }
                                            } else {
                                              Utils.showFlushBarWithMessage(
                                                  "Alert",
                                                  "Please select any option",
                                                  context);
                                            }
                                          }
                                        })),
                              ],
                            ),
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

  Future<void> setTransactionId(String transactionId) async {
    String data =
        "billing_address_id=${widget.billingId}&payment_method=razorpay&transaction_id=$transactionId&is_wallet_used=0&wallet_amount=0&order_note=This is a order note.&coupan_code=${widget.couponCode}&coupan_amount";

    await cartProvider.placeOrder(data, context); // registration();
  }

  Future<void> setTransactionIdWallet(String transactionId) async {
    var amout = cartProvider.model.data.total.replaceFirst("₹ ", "");
    String data =
        "billing_address_id=${widget.billingId}&payment_method=pay_by_wallet&transaction_id=$transactionId&is_wallet_used=1&wallet_amount=$amout&order_note=This is a order note.&coupan_code=${widget.couponCode}&coupan_amount";

    await cartProvider.placeOrder(data, context); // registration();
  }
}
