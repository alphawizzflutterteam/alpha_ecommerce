import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screen/profile/payment/myTransaction/transactionHistory.dart';
import '../screen/profile/payment/myWallet/wallet.dart';
import '../screen/profile/payment/refund/refundHistory.dart';

class PaymentTypeList {
  IconData paymentTypeIcon;
  String paymentTypeName;
  Widget navigationScreen;
  PaymentTypeList(
      {required this.paymentTypeIcon,
      required this.paymentTypeName,
      required this.navigationScreen});
}

List<PaymentTypeList> paymentType = [
  PaymentTypeList(
      paymentTypeIcon: FontAwesomeIcons.wallet,
      paymentTypeName: 'My Wallet',
      navigationScreen: const Wallet()),
  PaymentTypeList(
      paymentTypeIcon: FontAwesomeIcons.file,
      paymentTypeName: 'My Transaction',
      navigationScreen: const TransactionHistory()),
  PaymentTypeList(
      paymentTypeIcon: FontAwesomeIcons.moneyBill,
      paymentTypeName: 'Refund',
      navigationScreen: const RefundHistory()),
];
