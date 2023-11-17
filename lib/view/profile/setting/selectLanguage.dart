import 'package:alpha_ecommerce_18oct/viewModel/languageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import 'languageSelection.dart';

Future<void> language(context) async {
  final languageModel = Provider.of<LanguageViewModel>(context);

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: Container(
          color: colors.overlayBG,
          height: MediaQuery.of(context).size.height * 0.85,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: LanguageWidget(
                label: 'Select Language',
                model: languageModel.model,
              ),
            ),
          ),
        ),
      );
    },
  );
}
