import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/currency_selection/currencyModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/currencyViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

class SelectionCurrencyWidget extends StatefulWidget {
  final String? label;
  final bool signIn;
  const SelectionCurrencyWidget({super.key, required this.signIn, this.label});

  @override
  State<SelectionCurrencyWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectionCurrencyWidget> {
  late CurrencyViewModel currencyProvider;

  List<Datum> currencyList = [];
  String selectedValue = 'Indian';
  final ValueNotifier<List<Datum>> selected = ValueNotifier<List<Datum>>([]);

  @override
  void initState() {
    currencyProvider = Provider.of<CurrencyViewModel>(context, listen: false);
    currencyProvider.getCurrencies(context);
    currencyList = currencyProvider.currencyModel.data;
    selected.value.addAll(currencyProvider.currencyModel.data);
    print(selected.value.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currencyProvider = Provider.of<CurrencyViewModel>(context);

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
                  widget.signIn
                      ? Routes.navigateToSignInScreen(context)
                      : Routes.navigateToPreviousScreen(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: colors.textColor,
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    widget.signIn
                        ? Routes.navigateToSignInScreen(context)
                        : Routes.navigateToPreviousScreen(context);
                  },
                  icon: const Icon(
                    Icons.check,
                    color: colors.textColor,
                  )),
            ],
          ),
          body: currencyProvider.isLoading
              ? appLoader()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.label ?? 'Choose your Currency ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 24,
                                  color: colors.textColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            if (value == '') {
                              selected.value = [];
                              selected.value.addAll(currencyList);
                            } else {
                              selected.value = [];
                              for (var i = 0; i < currencyList.length; i++) {
                                if (currencyList[i]
                                    .name
                                    .toLowerCase()
                                    .contains(value.toLowerCase())) {
                                  selected.value.add(currencyList[i]);
                                }
                              }
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            hintText: 'Search',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: colors.lightTextColor,
                                    fontSize:
                                        Platform.isAndroid ? size_14 : size_16),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: colors.lightTextColor,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: colors.textFieldColor, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: colors.textFieldColor, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: colors.textFieldColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: colors.textFieldColor, width: 1)),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: colors.textColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        currencyProvider.isLoading
                            ? appLoader()
                            : ValueListenableBuilder(
                                valueListenable: selected,
                                builder: (context, value, child) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: selected.value.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            setState(() {
                                              selectedValue =
                                                  selected.value[index].name;
                                              currencyProvider.setCurrency(
                                                  selected.value[index].name);

                                              SharedPref.shared.pref?.setString(
                                                  PrefKeys.currencyID,
                                                  selected.value[index].id
                                                      .toString());
                                            });
                                          },
                                          title: Text(
                                            "${selected.value[index].symbol} ${selected.value[index].name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: Platform.isAndroid
                                                        ? size_12
                                                        : size_14,
                                                    color: colors.textColor),
                                          ),
                                          trailing:
                                              selected.value[index].name ==
                                                      selectedValue
                                                  ? const Icon(
                                                      Icons.check,
                                                      color: colors.lightButton,
                                                    )
                                                  : Container(
                                                      width: 0,
                                                    ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              )
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
