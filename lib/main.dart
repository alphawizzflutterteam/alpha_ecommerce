import 'package:alpha_ecommerce_18oct/viewModel/currencyViewModel.dart';
import 'package:alpha_ecommerce_18oct/provider/home_provider.dart';
import 'package:alpha_ecommerce_18oct/provider/language_provider.dart';
import 'package:alpha_ecommerce_18oct/provider/setting_provider.dart';
import 'package:alpha_ecommerce_18oct/provider/theme_provider.dart';
import 'package:alpha_ecommerce_18oct/provider/user_provider.dart';
import 'package:alpha_ecommerce_18oct/view/dashboard/dashboard.dart';
import 'package:alpha_ecommerce_18oct/view/language/languageConstants.dart';
import 'package:alpha_ecommerce_18oct/view/splash/splashScreen.dart';
import 'package:alpha_ecommerce_18oct/viewModel/authViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/languageViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/splashViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'utils/color.dart';
import 'utils/constant.dart';
import 'utils/routes.dart';
import 'utils/shared_pref..dart';
import 'utils/string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.shared.getPref();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (BuildContext context) {
        String? theme = SharedPref.shared.pref?.getString(PrefKeys.appTheme);

        if (theme == DARK) {
          ISDARK = 'true';
        } else if (theme == LIGHT) {
          ISDARK = 'false';
        }

        if (theme == null || theme == '' || theme == DEFAULT_SYSTEM) {
          SharedPref.shared.pref?.setString(APP_THEME, DEFAULT_SYSTEM);
          var brightness =
              SchedulerBinding.instance.platformDispatcher.platformBrightness;
          ISDARK = (brightness == Brightness.dark).toString();

          return ThemeNotifier(ThemeMode.system);
        }

        return ThemeNotifier(theme == LIGHT ? ThemeMode.light : ThemeMode.dark);
      },
    ),
    Provider<SettingProvider>(
      create: (context) => SettingProvider(SharedPref.shared.pref!),
    ),
    ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
    ChangeNotifierProvider<AuthViewModel>(create: (context) => AuthViewModel()),
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel()),
    ChangeNotifierProvider<LanguageViewModel>(
        create: (context) => LanguageViewModel()),
    ChangeNotifierProvider<SplashViewModel>(
        create: (context) => SplashViewModel()),
    ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
    ChangeNotifierProvider<LanguageProvider>(
        create: (context) => LanguageProvider()),
    ChangeNotifierProvider<CurrencyViewModel>(
        create: (context) => CurrencyViewModel()),
  ], child: const MyApp()));
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    if (mounted) {
      setState(
        () {
          _locale = locale;
        },
      );
    }
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    dashboardPageState = GlobalKey<DashboardState>();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('es', 'ES'),
        Locale('hi', 'IN'),
        Locale('fr', 'FR'),
        Locale('ar', 'DZ'),
        Locale('ru', 'RU'),
        Locale('ja', 'JP'),
        Locale('de', 'DE'),
      ],
      title: appName,
      theme: ThemeData(
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
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Dashboard(),
      },
      darkTheme: ThemeData(
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
      ),
      themeMode: themeNotifier.getThemeMode(),
    );
  }
}
