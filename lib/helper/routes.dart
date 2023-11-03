import 'package:alpha_ecommerce_18oct/screen/auth/otp_verification.dart';
import 'package:alpha_ecommerce_18oct/screen/auth/reset_password.dart';
import 'package:alpha_ecommerce_18oct/screen/auth/sign_in.dart';
import 'package:alpha_ecommerce_18oct/screen/auth/sign_up.dart';
import 'package:alpha_ecommerce_18oct/screen/auth/terms_and_conditions.dart';
import 'package:alpha_ecommerce_18oct/screen/auth/verify_number.dart';
import 'package:alpha_ecommerce_18oct/screen/cart/cart.dart';
import 'package:alpha_ecommerce_18oct/screen/country_selection/country_selection.dart';
import 'package:alpha_ecommerce_18oct/screen/greet/pay_success.dart';
import 'package:alpha_ecommerce_18oct/screen/greet/wallet_money_added.dart';
import 'package:alpha_ecommerce_18oct/screen/greet/welcome.dart';
import 'package:alpha_ecommerce_18oct/screen/home/home.dart';
import 'package:alpha_ecommerce_18oct/screen/language_selection/language_selection.dart';
import 'package:alpha_ecommerce_18oct/screen/offer/offer.dart';
import 'package:alpha_ecommerce_18oct/screen/order/orderDetail.dart';
import 'package:alpha_ecommerce_18oct/screen/productDetail/productDetailPage.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/aboutUs/aboutUs.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/address/manage_address.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/chat/chat.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/contactUs/contactUs.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/coupon/coupon.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/editProfile/editProfile.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/faqs/faqs.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/myTransaction/transactionHistory.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/myWallet/addMoney.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/myWallet/payment.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/myWallet/payment_form.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/myWallet/wallet.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/profile_payment.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/payment/refund/refundHistory.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/privacyPolicy/privacyPolicy.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/profile.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/referEarn/referEarn.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/setting/setting.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/shippingPolicy/shippingPolicy.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/subscribe/subscribe.dart';
import 'package:alpha_ecommerce_18oct/screen/vendor/vendor.dart';
import 'package:alpha_ecommerce_18oct/screen/vendor/vendorDetails.dart';
import 'package:flutter/cupertino.dart';
import '../screen/category/category.dart';
import '../screen/categoryDetail/categoryDetail.dart';
import '../screen/currency_selection/currency_selection.dart';
import '../screen/dashboard/common_bottom.dart';
import '../screen/dashboard/dashboard.dart';
import '../screen/intro_slider/intro_slider.dart';
import '../screen/order/order.dart';
import '../screen/placeOrder/placeOrder.dart';
import '../screen/profile/subscribe/currentPlan.dart';
import '../screen/wishlist/wishlist.dart';
import '../widgets/notification.dart';
import '../widgets/search.dart';

GlobalKey<DashboardState>? dashboardPageState;

class Routes {
  static navigateToOTPVerificationScreen(BuildContext context, page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            OTPVerification(signIn: page),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToResetPasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const ResetPassword(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSignInScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SignIn(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SignUP(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToTermsConditionScreen(BuildContext context, page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const TermAndCondition(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPrivacyPolicyScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const PrivacyPolicy(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToVerifyNumberScreen(BuildContext context, signIn) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            VerifyNumber(signIn: signIn),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCartScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Cart(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCategoryScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const AllCategory(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCountrySelectionScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const CountrySelection(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToDashboardScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Dashboard(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCurrencyScreen(BuildContext context, condition) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            SelectionCurrencyWidget(
          signIn: condition,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToBottomNavScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const BottomNavPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPaySuccessScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const PaySuccess(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToWalletSuccessScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const WalletSuccess(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Welcome(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Home(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToIntroSliderScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const IntroSlider(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToLanguageScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const SelectLanguageWidget(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToVendorScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Vendor(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToAboutUsScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const AboutUs(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToManageAddressScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const ManageAddress(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToContactUsScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const ContactUs(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCouponScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Coupon(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToFAQsScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FAQs(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToTransactionHistoryScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const TransactionHistory(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToAddMoneyScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const AddMoney(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Payment(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPaymentFormScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const PaymentForm(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToWalletScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Wallet(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToOrderDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const OrderDetail(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToRefundHistoryScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const RefundHistory(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToProfilePaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const ProfilePayment(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToReferAndEarnScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const ReferAndEarn(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSettingScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Setting(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToShippingPolicyScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const ShippingPolicy(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSubscribeScreen(BuildContext context, bool signUp) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => Subscribe(
          signUp: signUp,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Profile(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCurrentPlanScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const CurrentPlan(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToWishlistScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Wishlist(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToOrderScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Order(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToNotificationScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const NotificationScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Search(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const EditProfile(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToChatScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Chat(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToProductDetailPageScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const ProductDetailPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPlaceOrderScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const PlaceOrder(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToOffersScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Offers(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToVendorDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const VendorDetails(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCategoryDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const CategoryDetail(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
