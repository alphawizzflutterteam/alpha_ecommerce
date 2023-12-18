import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/currencyViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/languageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../profile/setting/languageSelection.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({super.key});

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  late LanguageViewModel languageModel;
  late CurrencyViewModel currencyViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageModel = Provider.of<LanguageViewModel>(context, listen: false);
    currencyViewModel = Provider.of<CurrencyViewModel>(context, listen: false);
    languageModel.getLanguages(context);
    currencyViewModel.getCurrencies(context);
  }

  @override
  Widget build(BuildContext context) {
    var languageModel = Provider.of<LanguageViewModel>(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              Images.bgGreenBottom,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Routes.navigateToCurrencyScreen(context, true);
                },
                icon: const Icon(
                  Icons.close,
                  color: colors.textColor,
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    Routes.navigateToCurrencyScreen(context, true);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: colors.textColor,
                  )),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: languageModel.isLoading
                  ? appLoader()
                  : LanguageWidget(
                      label: "Choose your Language",
                      model: languageModel.model,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
