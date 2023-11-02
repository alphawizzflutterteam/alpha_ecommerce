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
      CupertinoPageRoute(
        builder: (context) => OTPVerification(signIn: page),
      ),
    );
  }

  static navigateToResetPasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ResetPassword(),
      ),
    );
  }

  static navigateToSignInScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const SignIn(),
      ),
    );
  }

  static navigateToSignUpScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const SignUP(),
      ),
    );
  }

  static navigateToTermsConditionScreen(BuildContext context, page) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const TermAndCondition(),
      ),
    );
  }

  static navigateToPrivacyPolicyScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const PrivacyPolicy(),
      ),
    );
  }

  static navigateToVerifyNumberScreen(BuildContext context, signIn) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => VerifyNumber(signIn: signIn),
      ),
    );
  }

  static navigateToCartScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Cart(),
      ),
    );
  }

  static navigateToCategoryScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const AllCategory(),
      ),
    );
  }

  static navigateToCountrySelectionScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const CountrySelection(),
      ),
    );
  }

  static navigateToDashboardScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Dashboard(),
      ),
    );
  }

  static navigateToCurrencyScreen(BuildContext context, condition) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SelectionCurrencyWidget(
          signIn: condition,
        ),
      ),
    );
  }

  static navigateToBottomNavScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const BottomNavPage(),
      ),
    );
  }

  static navigateToPaySuccessScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const PaySuccess(),
      ),
    );
  }

  static navigateToWalletSuccessScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const WalletSuccess(),
      ),
    );
  }

  static navigateToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Welcome(),
      ),
    );
  }

  static navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  static navigateToIntroSliderScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const IntroSlider(),
      ),
    );
  }

  static navigateToLanguageScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const SelectLanguageWidget(),
      ),
    );
  }

  static navigateToVendorScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Vendor(),
      ),
    );
  }

  static navigateToAboutUsScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const AboutUs(),
      ),
    );
  }

  static navigateToManageAddressScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ManageAddress(),
      ),
    );
  }

  static navigateToContactUsScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ContactUs(),
      ),
    );
  }

  static navigateToCouponScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Coupon(),
      ),
    );
  }

  static navigateToFAQsScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const FAQs(),
      ),
    );
  }

  static navigateToTransactionHistoryScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const TransactionHistory(),
      ),
    );
  }

  static navigateToAddMoneyScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const AddMoney(),
      ),
    );
  }

  static navigateToPaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Payment(),
      ),
    );
  }

  static navigateToPaymentFormScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const PaymentForm(),
      ),
    );
  }

  static navigateToWalletScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Wallet(),
      ),
    );
  }

  static navigateToOrderDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const OrderDetail(),
      ),
    );
  }

  static navigateToRefundHistoryScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const RefundHistory(),
      ),
    );
  }

  static navigateToProfilePaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ProfilePayment(),
      ),
    );
  }

  static navigateToReferAndEarnScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ReferAndEarn(),
      ),
    );
  }

  static navigateToSettingScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Setting(),
      ),
    );
  }

  static navigateToShippingPolicyScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ShippingPolicy(),
      ),
    );
  }

  static navigateToSubscribeScreen(BuildContext context, bool signUp) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => Subscribe(
          signUp: signUp,
        ),
      ),
    );
  }

  static navigateToProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Profile(),
      ),
    );
  }

  static navigateToCurrentPlanScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const CurrentPlan(),
      ),
    );
  }

  static navigateToWishlistScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Wishlist(),
      ),
    );
  }

  static navigateToOrderScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Order(),
      ),
    );
  }

  static navigateToNotificationScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  }

  static navigateToSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Search(),
      ),
    );
  }

  static navigateToEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const EditProfile(),
      ),
    );
  }

  static navigateToChatScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Chat(),
      ),
    );
  }

  static navigateToProductDetailPageScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ProductDetailPage(),
      ),
    );
  }

  static navigateToPlaceOrderScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const PlaceOrder(),
      ),
    );
  }

  static navigateToOffersScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Offers(),
      ),
    );
  }

  static navigateToVendorDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const VendorDetails(),
      ),
    );
  }

  static navigateToCategoryDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const CategoryDetail(),
      ),
    );
  }

  static navigateToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
