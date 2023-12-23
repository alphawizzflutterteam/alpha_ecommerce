import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const secondary = Color(0xFF3B76F6);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = colors.darkColor2;
  static const card = colors.darkColor2;
}

abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colors.primary_app,
        ).copyWith(
          secondary: colors.darkIcon,
          brightness: Brightness.light,
        ),
        canvasColor: Theme.of(context).colorScheme.lightWhite,
        cardColor: Theme.of(context).colorScheme.white,
        dialogBackgroundColor: Theme.of(context).colorScheme.white,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: colors.primary,
            ),
        primarySwatch: colors.primary_app,
        primaryColor: Theme.of(context).colorScheme.lightWhite,
        fontFamily: 'ubuntu',
        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.bold,
          ),
        ).apply(
          bodyColor: Theme.of(context).colorScheme.fontColor,
        ),
      );

  /// Dark theme and its settings.
  static ThemeData dark(BuildContext context) => ThemeData(
        canvasColor: colors.darkColor,
        cardColor: colors.darkColor2,
        dialogBackgroundColor: colors.darkColor2,
        primaryColor: colors.darkColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: colors.darkIcon,
          selectionColor: colors.darkIcon,
          selectionHandleColor: colors.darkIcon,
        ),
        fontFamily: 'ubuntu',
        brightness: Brightness.dark,
        hintColor: colors.white10,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: colors.secondary,
            ),
        // textTheme: TextTheme(
        //   titleLarge: TextStyle(
        //     color: Theme.of(context).colorScheme.fontColor,
        //     fontWeight: FontWeight.w600,
        //   ),
        //   titleMedium: TextStyle(
        //     color: Theme.of(context).colorScheme.fontColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ).apply(
        //   bodyColor: Theme.of(context).colorScheme.fontColor,
        // ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colors.primary_app,
        ).copyWith(
          secondary: colors.darkIcon,
          brightness: Brightness.dark,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
        ),
      );
}
