import 'package:flutter/cupertino.dart';
import '../utils/images.dart';
import '../view/profile/payment/myTransaction/transactionHistory.dart';
import '../view/profile/payment/myWallet/wallet.dart';
import '../view/profile/payment/refund/refundHistory.dart';

class PaymentTypeList {
  String paymentTypeIcon;
  String paymentTypeName;
  Widget navigationScreen;
  PaymentTypeList(
      {required this.paymentTypeIcon,
      required this.paymentTypeName,
      required this.navigationScreen});
}

List<PaymentTypeList> paymentType = [
  PaymentTypeList(
      paymentTypeIcon: Images.walletProfile,
      paymentTypeName: 'My Wallet',
      navigationScreen: const Wallet()),
  PaymentTypeList(
      paymentTypeIcon: Images.transaction,
      paymentTypeName: 'My Transaction',
      navigationScreen: const TransactionHistory()),
  PaymentTypeList(
      paymentTypeIcon: Images.refund,
      paymentTypeName: 'Refund',
      navigationScreen: const RefundHistory()),
];
