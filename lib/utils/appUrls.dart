// ignore_for_file: file_names
class AppUrl {
  //https://alpha-ecom.developmentalphawizz.com
  //https://test-alpha-ecom.developmentalphawizz.com

  static const baseURL =
      "https://test-alpha-ecom.developmentalphawizz.com/api/v1/";
  static String sendLoginOtp = "${baseURL}auth/send-login-otp";
  static String socialLogin = "${baseURL}auth/social-login";
  static String sendRegisterOtp = "${baseURL}auth/send-otp";
  static String loginWithEmailPassword = "${baseURL}auth/login";
  static String register = "${baseURL}auth/register";
  static String updatePassword = "${baseURL}customer/update-password";
  static String resetPassword = "${baseURL}customer/reset-password";

  static const String getProfile = "${baseURL}customer/info";
  static const String updateProfile = "${baseURL}customer/update-profile";
  static String deleteAccount = "${baseURL}customer/account-delete/";

  static String addWallet = "${baseURL}customer/wallet/add-wallet";
  static String subscribe = "${baseURL}customer/purchase-plan";

  static const String languages = "${baseURL}languages";
  static const String currencies = "${baseURL}currencies";

  static const String updateImage = "${baseURL}customer/update-profile-image";

  static const String brands = "${baseURL}brands";
  static const String specialOffers = "${baseURL}offers/special-offers";
  static const String dailyDeals = "${baseURL}deal-of-the-day";
  static const String productsList = "${baseURL}products";
  static const String searchList = "${baseURL}products/search?";
  static const String filtersList = "${baseURL}products/get-filters";
  static const String bannersSection = "${baseURL}config/app-home";
  static const String sendMessage =
      "${baseURL}customer/chat/send-admin-messages/admin";
  static const String chatList =
      "${baseURL}customer/chat/get-admin-messages/admin/1?limit=10&offset=0";

  static const String categories = "${baseURL}categories?vendor_id=&is_home=";
  static const String banners = "${baseURL}banners?banner_type=";

  static const String wishlist = "${baseURL}customer/wish-list";

  static const String addToWishlist = "${baseURL}customer/wish-list/add";
  static const String removeFromWishlist =
      "${baseURL}customer/wish-list/remove";

  static const String cartList = "${baseURL}cart?coupan=";

  static const String addToCart = "${baseURL}cart/add";
  static const String removeFromCart = "${baseURL}cart/remove";
  static const String updateCart = "${baseURL}cart/update";
  static const String applyCoupon = "${baseURL}coupon/apply?code=";
  static const String placeOrder = "${baseURL}customer/order/place?";
  static const String checkAvailabbilitty =
      "${baseURL}customer/order/check-shipping-type?billing_address_id=";

  static const String savedList = "${baseURL}customer/save-list";
  static const String addToSaveLater = "${baseURL}customer/save-list/add";
  static const String removeFromSaveLater =
      "${baseURL}customer/save-list/remove";

  static const String couponList = "${baseURL}coupon";

  static const String faq = "${baseURL}faq";
  static const String contact = "${baseURL}contact/store";

  static String vendorList = "${baseURL}seller/all";
  static String notifications = "${baseURL}notifications";
  static String followedVendor = "${baseURL}customer/followed-vendor";
  static String vendorCategories = "${baseURL}categories?vendor_id=";
  static const String followVendor = "${baseURL}seller/follow";

  static const String addressList = "${baseURL}customer/address/list";
  static const String addAddressList = "${baseURL}customer/address/add";
  static const String countries = "${baseURL}countries";
  static const String states = "${baseURL}states?country_id=";
  static const String updateAddressList = "${baseURL}customer/address/update";
  static const String city = "${baseURL}cities?state_id=";

  static const String deleteAddress = "${baseURL}customer/address?address_id=";

  static const String orderList = "${baseURL}customer/order/list";
  static const String orderDetail = "${baseURL}customer/order/details";
  static const String orderReturnDetail =
      "${baseURL}customer/order/refund-details?id=";
  static const String orderReturn = "${baseURL}customer/order/refund-store";
  static const String orderCancel = "${baseURL}order/cancel-order";

  static const String contactForm = "${baseURL}contact/store";

  static const String productDetail = "${baseURL}products/details/";
  static const String pincodeCheck = "${baseURL}products/pin-code-check";

  static const String privacyPolicyData =
      "${baseURL}config/privacy-policy-pages";
  static const String writeReview = "${baseURL}products/reviews/submit";
  static const String transactionHistory =
      "${baseURL}customer/get-order-transaction";

  static const String refundHistory = "${baseURL}customer/order/refund-list";
  static const String walletHistory =
      "${baseURL}customer/wallet/list?limit=25&offset=0";
  static const String referral = "${baseURL}customer/referrer-list";
  static const String subscription = "${baseURL}customer/plans";
}
