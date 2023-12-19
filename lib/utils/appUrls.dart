// ignore_for_file: file_names
class AppUrl {
  //https://alpha-ecom.developmentalphawizz.com
  //https://test-alpha-ecom.developmentalphawizz.com
  static const baseURL =
      "https://test-alpha-ecom.developmentalphawizz.com/api/v1/";
  static String sendLoginOtp = "${baseURL}auth/send-login-otp";
  static String sendRegisterOtp = "${baseURL}auth/send-otp";
  static String loginWithEmailPassword = "${baseURL}auth/login";
  static String register = "${baseURL}auth/register";
  static String updatePassword = "${baseURL}auth/update-password";
  static String resetPassword = "${baseURL}customer/reset-password";

  static String getProfile = "${baseURL}customer/info";
  static String updateProfile = "${baseURL}customer/update-profile";

  static String languages = "${baseURL}languages";
  static String currencies = "${baseURL}currencies";

  static String brands = "${baseURL}brands";
  static String specialOffers = "${baseURL}offers/special-offers";
  static String dailyDeals = "${baseURL}deal-of-the-day";
  static String productsList = "${baseURL}products";
  static String searchList = "${baseURL}products/search?";
  static String filtersList = "${baseURL}products/get-filters";

  static String categories = "${baseURL}categories";
  static String banners = "${baseURL}banners?banner_type=";

  static String wishlist = "${baseURL}customer/wish-list";

  static String addToWishlist = "${baseURL}customer/wish-list/add";
  static String removeFromWishlist = "${baseURL}customer/wish-list/remove";

  static String cartList = "${baseURL}cart?coupan=";

  static String addToCart = "${baseURL}cart/add";
  static String removeFromCart = "${baseURL}cart/remove";
  static String updateCart = "${baseURL}cart/update";
  static String applyCoupon = "${baseURL}coupon/apply?code=";
  static String placeOrder = "${baseURL}customer/order/place?";

  static String savedList = "${baseURL}customer/save-list";
  static String addToSaveLater = "${baseURL}customer/save-list/add";
  static String removeFromSaveLater = "${baseURL}customer/save-list/remove";

  static String couponList = "${baseURL}coupon";

  static String faq = "${baseURL}faq";

  static String vendorList = "${baseURL}seller/all";

  static String addressList = "${baseURL}customer/address/list";
  static String addAddressList = "${baseURL}customer/address/add";
  static String updateAddressList = "${baseURL}customer/address/update";
  static String deleteAddress = "${baseURL}customer/address?address_id=";

  static String orderList = "${baseURL}customer/order/list";

  static String contactForm = "${baseURL}contact/store";

  static String productDetail = "${baseURL}products/details/";
  static String pincodeCheck = "${baseURL}products/pin-code-check";
}
