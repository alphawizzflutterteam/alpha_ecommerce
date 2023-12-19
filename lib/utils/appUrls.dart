// ignore_for_file: file_names
class AppUrl {
  //https://alpha-ecom.developmentalphawizz.com
  //https://test-alpha-ecom.developmentalphawizz.com
  static const baseURL = "https://alpha-ecom.developmentalphawizz.com/api/v1/";
  static const String sendLoginOtp = "${baseURL}auth/send-login-otp";
  static const String sendRegisterOtp = "${baseURL}auth/send-otp";
  static const String loginWithEmailPassword = "${baseURL}auth/login";
  static const String register = "${baseURL}auth/register";
  static const String updatePassword = "${baseURL}auth/update-password";
  static const String resetPassword = "${baseURL}customer/reset-password";

  static const String getProfile = "${baseURL}customer/info";
  static const String updateProfile = "${baseURL}customer/update-profile";

  static const String languages = "${baseURL}languages";
  static const String currencies = "${baseURL}currencies";

  static const String brands = "${baseURL}brands";
  static const String specialOffers = "${baseURL}offers/special-offers";
  static const String dailyDeals = "${baseURL}deal-of-the-day";
  static const String productsList = "${baseURL}products";
  static const String searchList = "${baseURL}products/search?";
  static const String filtersList = "${baseURL}products/get-filters";

  static const String categories = "${baseURL}categories";
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

  static const String savedList = "${baseURL}customer/save-list";
  static const String addToSaveLater = "${baseURL}customer/save-list/add";
  static const String removeFromSaveLater =
      "${baseURL}customer/save-list/remove";

  static const String couponList = "${baseURL}coupon";

  static const String faq = "${baseURL}faq";

  static const String vendorList = "${baseURL}seller/all";

  static const String addressList = "${baseURL}customer/address/list";
  static const String addAddressList = "${baseURL}customer/address/add";
  static const String updateAddressList = "${baseURL}customer/address/update";
  static const String deleteAddress = "${baseURL}customer/address?address_id=";

  static const String orderList = "${baseURL}customer/order/list";
  static const String orderDetail = "${baseURL}customer/order/details";
  static const String orderReturn = "${baseURL}customer/order/refund-store";
  static const String orderCancel = "${baseURL}order/cancel-order";

  static const String contactForm = "${baseURL}contact/store";

  static const String productDetail = "${baseURL}products/details/";
  static const String pincodeCheck = "${baseURL}products/pin-code-check";
}
