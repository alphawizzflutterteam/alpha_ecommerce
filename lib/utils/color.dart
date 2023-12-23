import 'package:flutter/material.dart';

extension colors on ColorScheme {
  static MaterialColor primary_app = const MaterialColor(
    0xC7183D3D,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );

  //new
  static const Color primary = Color(0xFFD9D9D9);
  static const Color secondary = Color(0xC7183D3D);
  static const Color buttonColor = Color(0xFF0A9494);
  static const Color textColor = Color(0xFFE3E1EC);
  static const Color lightTextColor = Color(0xFFC3C5DD);
  static const Color labelColor = Color(0xFFA8AAC1);
  static const Color textFieldColor = Color(0xff5B5B5B);
  static const Color textFieldBG = Color(0xff040D12);
  static const Color greyText = Color(0xFFA3A3A3);
  static const Color boxGradient1 = Color(0xFF4E5255);
  static const Color boxBorder = Color(0xFF363D41);
  static const Color midBorder = Color(0xFF444647);
  static const Color lightButton = Color(0xff03DAC6);
  static const Color overlayBG = Color(0xFF2D3438);
  static const Color darkBG = Color(0xFF040D12);
  static const Color dividerGrey = Color(0xff4A5054);
  static const Color subscribeYellow = Color(0xFF987808);
  static const Color bodyBackgroundDark = Color(0xFF1D2429);

  //home
  static const Color homeBG = Color(0xFFFFDC98);
  static const Color homeBGGradient1 = Color(0xFF007F78);
  static const Color homeBGGradient2 = Color(0xFF006B65);
  static const Color homeDivider = Color(0xFFFF9934);
  static const Color homeBGGradiant = Color(0xFFFFBC39);
  static const Color homePrimeDeals = Color(0xFF965C04);
  static const Color homeGradient3 = Color(0xFFE89825);
  static const Color homeGradient4 = Color(0xFF00214A);
  static const Color homeContainer1BG = Color(0xFF123C3F);

  //order
  static const Color onTheWayLight = Color(0xffF9ECAC);
  static const Color onTheWayDark = Color(0xffD89C01);
  static const Color orderCancelledLight = Color(0xffFFB8C5);
  static const Color orderCancelledDark = Color(0xffB8163D);
  static const Color deliveredLight = Color(0xffB8FFD0);
  static const Color deliveredDark = Color(0xff2B6F1B);
  static const Color returnedLight = Color(0xffB8C7FF);
  static const Color returnedDark = Color(0xff4A16DD);

  // previous

  Color get lightWhite =>
      brightness == Brightness.dark ? darkColor : const Color(0xffEEF2F9);

  Color get blue => brightness == Brightness.dark
      ? const Color(0xff8381d5)
      : const Color(0xff4543c1);

  Color get fontColor =>
      brightness == Brightness.dark ? whiteTemp : const Color(0xff222222);

  static Color darkIcon = const Color(0xff9B9B9B);
  static Color lightBorder = const Color(0xFFC3C5DD);
  static Color lightGrey = const Color(0xFFC3C5DD);

  static const Color grad1Color = Color(0xffEEF2F3);
  static const Color grad2Color = Color(0xC7183D3D);

  static const Color red = Colors.red;

  static const Color darkColor = Color(0xff181616);
  static const Color darkColor2 = Color(0xff252525);
  static const Color darkColor3 = Color(0xffa0a1a0);

  Color get white =>
      brightness == Brightness.dark ? darkColor2 : const Color(0xffFFFFFF);
  static const Color whiteTemp = Color(0xffFFFFFF);

  Color get black =>
      brightness == Brightness.dark ? whiteTemp : const Color(0xff000000);

  static const Color white10 = Colors.white10;
}
