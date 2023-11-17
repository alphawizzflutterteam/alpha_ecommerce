// ignore_for_file: file_names

class AppUrl {
  static const baseURL = "https://alpha-ecom.developmentalphawizz.com/api/v1/";
  static String sendLoginOtp = "${baseURL}auth/send-login-otp";
  static String sendRegisterOtp = "${baseURL}auth/send-otp";
  static String loginWithEmailPassword = "${baseURL}auth/login";
  static String register = "${baseURL}auth/register";
  static String updatePassword = "${baseURL}auth/update-password";

  static String languages = "${baseURL}languages";
  static String currencies = "${baseURL}currencies";
}
