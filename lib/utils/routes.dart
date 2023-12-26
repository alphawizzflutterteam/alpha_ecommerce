import 'package:alpha_ecommerce_18oct/view/auth/login/otp_verification.dart';
import 'package:alpha_ecommerce_18oct/view/auth/login/reset_password.dart';
import 'package:alpha_ecommerce_18oct/view/auth/login/sign_in.dart';
import 'package:alpha_ecommerce_18oct/view/auth/signup/sign_up.dart';
import 'package:alpha_ecommerce_18oct/view/auth/terms_and_conditions.dart';
import 'package:alpha_ecommerce_18oct/view/auth/login/verify_number.dart';
import 'package:alpha_ecommerce_18oct/view/cart/cart.dart';
import 'package:alpha_ecommerce_18oct/view/country_selection/country_selection.dart';
import 'package:alpha_ecommerce_18oct/view/greet/pay_success.dart';
import 'package:alpha_ecommerce_18oct/view/greet/wallet_money_added.dart';
import 'package:alpha_ecommerce_18oct/view/greet/welcome.dart';
import 'package:alpha_ecommerce_18oct/view/home/brandsList.dart';
import 'package:alpha_ecommerce_18oct/view/home/home.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/language_selection/language_selection.dart';
import 'package:alpha_ecommerce_18oct/view/offer/offer.dart';
import 'package:alpha_ecommerce_18oct/view/order/orderCancelled.dart';
import 'package:alpha_ecommerce_18oct/view/order/orderDetailOnTheWay.dart';
import 'package:alpha_ecommerce_18oct/view/order/orderReturned.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/productDetailPage.dart';
import 'package:alpha_ecommerce_18oct/view/profile/aboutUs/aboutUs.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/addressList.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/editAddress.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/manage_address.dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/addressModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/chat/chat.dart';
import 'package:alpha_ecommerce_18oct/view/profile/contactUs/contactUs.dart';
import 'package:alpha_ecommerce_18oct/view/profile/coupon/couponScreen.dart';
import 'package:alpha_ecommerce_18oct/view/profile/editProfile/editProfile.dart';
import 'package:alpha_ecommerce_18oct/view/profile/faqs/faqs.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/model/transactionHistoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/transactionHistory.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/addMoney.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/payment.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/payment_form.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myWallet/wallet.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/profile_payment.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/refund/refundHistory.dart';
import 'package:alpha_ecommerce_18oct/view/profile/privacyPolicy/privacyPolicy.dart';
import 'package:alpha_ecommerce_18oct/view/profile/profile.dart';
import 'package:alpha_ecommerce_18oct/view/profile/referEarn/referEarn.dart';
import 'package:alpha_ecommerce_18oct/view/profile/setting/setting.dart';
import 'package:alpha_ecommerce_18oct/view/profile/shippingPolicy/shippingPolicy.dart';
import 'package:alpha_ecommerce_18oct/view/profile/subscribe/subscribe.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/vendor.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/vendorDetails.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/cupertino.dart';
import '../view/category/category.dart';
import '../view/categoryDetail/categoryDetail.dart';
import '../view/currency_selection/currency_selection.dart';
import '../view/dashboard/common_bottom.dart';
import '../view/dashboard/dashboard.dart';
import '../view/intro_slider/intro_slider.dart';
import '../view/order/order.dart';
import '../view/order/orderDetailDelivered.dart';
import '../view/placeOrder/placeOrder.dart';
import '../view/profile/payment/myTransaction/singleTransaction.dart';
import '../view/profile/payment/refund/singleRefund.dart';
import '../view/profile/referEarn/viewAllReferall.dart';
import '../view/profile/subscribe/currentPlan.dart';
import '../view/wishlist/wishlist.dart';
import '../view/notification/notificationScreen.dart';
import '../view/search/search.dart';

GlobalKey<DashboardState>? dashboardPageState;

class Routes {
  static navigateToOTPVerificationScreen(
      BuildContext context, bool page, bool isComingFromForgotPassword) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => OTPVerification(
          isComingForLogin: page,
          isComingFromForgotPassword: isComingFromForgotPassword,
        ),
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
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const SignIn(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        (Route<dynamic> route) => false);

    // Navigator.of(context).pushAndRemoveUntil(
    //     CupertinoPageRoute(builder: (context) => SignIn()),
    //     (Route<dynamic> route) => false);
  }

  static navigateToIntroScreen(BuildContext context) {
    // Navigator.of(context).pushAndRemoveUntil(
    //     CupertinoPageRoute(builder: (context) => IntroSlider()),
    //     (Route<dynamic> route) => false);
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const IntroSlider(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        (Route<dynamic> route) => false);
    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation1, animation2) => SignIn(),
    //     transitionDuration: Duration.zero,
    //     reverseTransitionDuration: Duration.zero,
    //   ),
    // );
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

  static navigateToVerifyNumberScreen(BuildContext context, forSignUp) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            VerifyNumber(forSignUp: forSignUp),
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
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => CountrySelection()),
        (Route<dynamic> route) => false);
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => CountrySelection(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToDashboardScreen(BuildContext context, int index) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
            builder: (context) => Dashboard(
                  index: index,
                )),
        (Route<dynamic> route) => false);
    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation1, animation2) => Dashboard(
    //       index: index,
    //     ),
    //     transitionDuration: Duration.zero,
    //     reverseTransitionDuration: Duration.zero,
    //   ),
    // );
  }

  static navigateToCurrencyScreen(BuildContext context, condition) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
            builder: (context) => SelectionCurrencyWidget(
                  signIn: condition,
                )),
        (Route<dynamic> route) => false);
  }

  static navigateToBottomNavScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => BottomNavPage(
          index: index,
        ),
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

  static navigateToBrandsScreen(BuildContext context, List<BrandsList> brand,
      SearchViewModel searchProvidder) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => BrandsListScreen(
          brandsModel: brand,
          searchViewModel: searchProvidder,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToWelcomeScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => Welcome()),
        (Route<dynamic> route) => false);
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => Welcome(),
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
            SelectLanguageWidget(),
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

  static navigateToEditAddressScreen(
      BuildContext context, AddressList addressList) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => EditAddress(
          addressList: addressList,
        ),
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

  static navigateToAddressListScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const AddressListScreen(),
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
        pageBuilder: (context, animation1, animation2) => const CouponScreen(),
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

  static navigateToOrderOnTheWayDetailScreen(
      BuildContext context, String Order_id) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            OrderDetailOnTheWay(order_id: Order_id),
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

  static navigateToProductDetailPageScreen(BuildContext context, String model) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => ProductDetailPage(
          slug: model,
        ),
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

  static navigateToVendorDetailsScreen(
      BuildContext context, VendorDatum model) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => VendorDetails(
          model: model,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToCategoryDetailScreen(BuildContext context) {
    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation1, animation2) =>
    //         const CategoryDetail(),
    //     transitionDuration: Duration.zero,
    //     reverseTransitionDuration: Duration.zero,
    //   ),
    // );
  }

  static navigateToOrderCancelledScreen(BuildContext context, String order_id) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            OrderCancelled(order_id: order_id),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToOrderDetailDeliveredDetailScreen(
    BuildContext context,
    String order_id,
  ) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => OrderDetailDelivered(
          order_id: order_id,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToOrderReturnedDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const OrderReturned(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToViewAllReferallScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            const ViewAllReferall(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSingleTransactionScreen(
      BuildContext context, DatumTrasaction data) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => SingleTransaction(
          data: data,
        ),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToSingleRefundScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SingleRefund(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static navigateToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
