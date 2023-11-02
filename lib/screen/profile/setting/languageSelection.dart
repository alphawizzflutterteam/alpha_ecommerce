import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/color.dart';
import '../../../provider/language_provider.dart';

class LanguageWidget extends StatefulWidget {
  final String label;
  const LanguageWidget({super.key, required this.label});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  List<String> languageList = [
    'English',
    'Germane',
    'Italian',
    'Chanzies',
    'Bangla',
    'Spanish',
    'French',
    'Portuguese',
    'Arabic',
    'Russian',
    'Japanese'
  ];
  String selectedValue = 'English';
  final ValueNotifier<List<String>> selected = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    selected.value.addAll(languageList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);

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
            style: const TextStyle(
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
            hintStyle: const TextStyle(color: Color(0xFFC3C5DD),fontSize: 16),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFFC3C5DD),
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
          style: const TextStyle(color: Colors.white),
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
                        languageProvider.setLanguage(selected.value[index]);
                        // Routes.navigateToPreviousScreen(context);
                      });
                    },
                    title: Text(
                      selected.value[index],
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    trailing: selected.value[index] == selectedValue
                        ? const Icon(
                            Icons.check,
                            color: Color(0xff03DAC6),
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
