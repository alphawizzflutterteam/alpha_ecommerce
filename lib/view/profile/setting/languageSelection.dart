import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/language/language.dart';
import 'package:alpha_ecommerce_18oct/viewModel/languageViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../provider/language_provider.dart';

class LanguageWidget extends StatefulWidget {
  final String label;
  final LanguageModel model;
  const LanguageWidget({super.key, required this.label, required this.model});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  String selectedValue = '';
  List<Datum> languageList = [];
  final ValueNotifier<List<Datum>> selected = ValueNotifier<List<Datum>>([]);

  @override
  void initState() {
    languageList = widget.model.data;

    selected.value.addAll(languageList);
    selectedValue = languageList[0].name;
    print(languageList.length.toString() + "Language list");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageModel = Provider.of<LanguageViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          onChanged: (value) {
            if (value == '') {
              selected.value = [];
              selected.value.addAll(languageList);
            } else {
              selected.value = [];
              for (var i = 0; i < languageList.length; i++) {
                if (languageList[i]
                    .name
                    .toLowerCase()
                    .contains(value.toLowerCase())) {
                  selected.value.add(languageList[i]);
                }
              }
            }
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            hintText: 'Search',
            hintStyle: TextStyle(
                color: colors.lightTextColor,
                fontSize: Platform.isAndroid ? size_14 : size_16),
            prefixIcon: const Icon(
              Icons.search,
              color: colors.lightTextColor,
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: colors.textFieldColor, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: colors.textFieldColor, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: colors.textFieldColor, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: colors.textFieldColor, width: 1)),
          ),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        ValueListenableBuilder(
          valueListenable: selected,
          builder: (context, value, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: selected.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectedValue = selected.value[index].name;
                        SharedPref.shared.pref?.setString(
                            PrefKeys.selectedLanguageID,
                            selected.value[index].id);
                        languageModel.setLanguage(selected.value[index].name,
                            context, Locale(selected.value[index].code, ""));
                      });
                    },
                    title: Text(
                      selected.value[index].name,
                      style: TextStyle(
                          fontSize: Platform.isAndroid ? size_14 : size_14,
                          color: Colors.white),
                    ),
                    trailing: selected.value[index].name == selectedValue
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
    );
  }
}
