import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screen/profile/aboutUs/aboutUs.dart';
import '../screen/profile/address/manage_address.dart';
import '../screen/profile/contactUs/contactUs.dart';
import '../screen/profile/coupon/coupon.dart';
import '../screen/profile/customerSupport/customerSupport.dart';
import '../screen/profile/faqs/faqs.dart';
import '../screen/profile/payment/profile_payment.dart';
import '../screen/profile/privacyPolicy/privacyPolicy.dart';
import '../screen/profile/referEarn/referEarn.dart';
import '../screen/profile/setting/setting.dart';
import '../screen/profile/shippingPolicy/shippingPolicy.dart';
import '../screen/profile/subscribe/subscribe.dart';

class ProfileList {
  IconData profileIcon;
  String profileText;
  Widget navigationScreen;
  ProfileList(
      {required this.profileIcon,
      required this.profileText,
      required this.navigationScreen});
}

List<ProfileList> profile = [
  ProfileList(
      profileIcon: Icons.location_on_outlined,
      profileText: 'Manage Address',
      navigationScreen: const ManageAddress()),
  ProfileList(
      profileIcon: Icons.payment,
      profileText: 'Payment',
      navigationScreen: const ProfilePayment()),
  ProfileList(
      profileIcon: Icons.discount,
      profileText: 'Coupons',
      navigationScreen: const Coupon()),
  ProfileList(
      profileIcon: Icons.settings,
      profileText: 'Setting',
      navigationScreen: const Setting()),
  ProfileList(
      profileIcon: Icons.subscriptions,
      profileText: 'Subscribe',
      navigationScreen: const Subscribe()),
  ProfileList(
      profileIcon: FontAwesomeIcons.share,
      profileText: 'Refer and Earn',
      navigationScreen: const ReferAndEarn()),
  ProfileList(
      profileIcon: Icons.support_agent_outlined,
      profileText: 'Customer Support',
      navigationScreen: const CustomerSupport()),
  ProfileList(
      profileIcon: Icons.phone_in_talk_outlined,
      profileText: 'Contact Us',
      navigationScreen: const ContactUs()),
  ProfileList(
      profileIcon: Icons.help_outline,
      profileText: 'Faqs',
      navigationScreen: const FAQs()),
  ProfileList(
      profileIcon: Icons.lock,
      profileText: 'Privacy Policy',
      navigationScreen: const PrivacyPolicy()),
  ProfileList(
      profileIcon: Icons.local_shipping,
      profileText: 'Shipping & Delivery policy',
      navigationScreen: const ShippingPolicy()),
  ProfileList(
      profileIcon: Icons.info,
      profileText: 'About Us',
      navigationScreen: const AboutUs()),
  ProfileList(
      profileIcon: Icons.logout,
      profileText: 'Logout',
      navigationScreen: const SizedBox()),
];
