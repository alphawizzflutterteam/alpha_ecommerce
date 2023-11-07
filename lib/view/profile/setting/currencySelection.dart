import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../provider/currency_provider.dart';

class CurrencyWidget extends StatefulWidget {
  const CurrencyWidget({super.key});

  @override
  State<CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  List<String> currencyList = [
    '€ Euro',
    '£ Pounds',
    '¥ Yen',
    '¥ Chinese Yuan',
    '₹ Russian Ruble',
    'Rp Indonesian Rupiah'
  ];
  String selectedValue = '¥ Yen';
  final ValueNotifier<List<String>> selected = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    selected.value.addAll(currencyList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currencyProvider =
        Provider.of<CurrencyProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Select Currency ',
          style: TextStyle(
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
                    .toLowerCase()
                    .contains(value.toLowerCase())) {
                  selected.value.add(currencyList[i]);
                }
              }
            }
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            hintText: 'Search',
            hintStyle:
                const TextStyle(color: colors.lightTextColor, fontSize: 16),
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
          style: const TextStyle(color: colors.textColor),
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
                        selectedValue = selected.value[index];
                        currencyProvider.setCurrency(selected.value[index]);
                      });
                    },
                    title: Text(
                      selected.value[index],
                      style: const TextStyle(
                          fontSize: 14, color: colors.textColor),
                    ),
                    trailing: selected.value[index] == selectedValue
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
