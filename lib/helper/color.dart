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

  Color get btnColor => brightness == Brightness.dark ? whiteTemp : primary;

  Color get changeablePrimary => brightness == Brightness.dark
      ? const Color(0xFFD9D9D9)
      : const Color(0xC7183D3D);

  Color get lightWhite =>
      brightness == Brightness.dark ? darkColor : const Color(0xffEEF2F9);

  Color get blue => brightness == Brightness.dark
      ? const Color(0xff8381d5)
      : const Color(0xff4543c1);

  Color get fontColor =>
      brightness == Brightness.dark ? whiteTemp : const Color(0xff222222);

  Color get gray =>
      brightness == Brightness.dark ? darkColor3 : const Color(0xfff0f0f0);

  Color get simmerBase =>
      brightness == Brightness.dark ? darkColor2 : Colors.grey[300]!;

  Color get simmerHigh =>
      brightness == Brightness.dark ? darkColor : Colors.grey[100]!;

  static Color darkIcon = const Color(0xff9B9B9B);

  static const Color grad1Color = Color(0xffEEF2F3);
  static const Color grad2Color = Color(0xC7183D3D);

  static const Color yellow = Color(0xfffdd901);

  static const Color red = Colors.red;

  Color get lightBlack => brightness == Brightness.dark
      ? whiteTemp.withOpacity(0.60)
      : const Color(0xff52575C);

  Color get lightBlack2 => brightness == Brightness.dark
      ? whiteTemp.withOpacity(0.38)
      : const Color(0xff999999);

  static const Color darkColor = Color(0xff181616);
  static const Color darkColor2 = Color(0xff252525);
  static const Color darkColor3 = Color(0xffa0a1a0);

  Color get white =>
      brightness == Brightness.dark ? darkColor2 : const Color(0xffFFFFFF);
  static const Color whiteTemp = Color(0xffFFFFFF);

  Color get black =>
      brightness == Brightness.dark ? whiteTemp : const Color(0xff000000);

  static const Color white10 = Colors.white10;
  static const Color white30 = Colors.white30;
  static const Color white70 = Colors.white70;

  static const Color black54 = Colors.black54;
  static const Color black12 = Colors.black12;
  static const Color disableColor = Color(0xffEEF2F9);

  static const Color blackTemp = Color(0xff000000);

  Color get black26 => brightness == Brightness.dark ? white30 : Colors.black54;
  static const Color cardColor = Color(0xffFFFFFF);
}
