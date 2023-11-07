import 'package:flutter/material.dart';
import '../../../utils/color.dart';
import 'currencySelection.dart';

Future<void> currency(context) async {
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
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CurrencyWidget(),
            ),
          ),
        ),
      );
    },
  );
}
