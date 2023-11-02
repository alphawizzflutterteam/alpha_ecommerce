import '../helper/images.dart';

class PaymentMethodList {
  String paymentMethodImage;
  String paymentMethodName;
  PaymentMethodList(
      {required this.paymentMethodName, required this.paymentMethodImage});
}

List<PaymentMethodList> paymentMethods = [
  PaymentMethodList(
      paymentMethodName: 'Visa Card', paymentMethodImage: Images.visa),
  PaymentMethodList(
      paymentMethodName: 'Phone Pay', paymentMethodImage: Images.phonePay),
  PaymentMethodList(
      paymentMethodName: 'UPI Payment', paymentMethodImage: Images.upi),
  PaymentMethodList(
      paymentMethodName: 'Google Pay', paymentMethodImage: Images.google),
];
