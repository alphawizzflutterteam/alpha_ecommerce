import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/filtersModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';

List<Map<dynamic, dynamic>> brand = [
  {'text': 'Pune'},
  {'text': 'Metro'},
  {'text': 'Adidas'},
  {'text': 'H&M'},
  {'text': 'levis'},
  {'text': 'Biba'}
];

List<Map<dynamic, dynamic>> rating = [
  {'text': '2.0 and above'},
  {'text': '3.0 and above'},
  {'text': '4.0 and above'},
  {'text': '3.5 and above'},
  {'text': '4.5 and above'}
];

List<Map<dynamic, dynamic>> colorCode = [
  {'color': Colors.green},
  {'color': Colors.red},
  {'color': Colors.blue},
  {'color': Colors.yellow},
  {'color': Colors.black}
];

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

Future<void> homeFilter(context, List<Filters> filter, SearchViewModel model,
    bool isComingForHome) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? colors.overlayBG
                : Colors.white,
            child: FilterClass(
              filter: filter,
              model: model,
              isComingForHome: isComingForHome,
            ),
          ));
    },
  );
}

class FilterClass extends StatefulWidget {
  final List<Filters> filter;
  final SearchViewModel model;
  final bool isComingForHome;
  const FilterClass(
      {super.key,
      required this.filter,
      required this.model,
      required this.isComingForHome});

  @override
  State<FilterClass> createState() => _FilterClassState();
}

class _FilterClassState extends State<FilterClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Filter",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 5),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    widget.model.selectedFilter.clear();
                    widget.model.clearFilters();
                    widget.model.getProductsListNew(context, "25", "1");

                    setState(() {});
                  },
                  child: Text(
                    "Clear Filters",
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Min Price",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Text(
                    "Max Price",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        controller: widget.model.minPriceController,
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(7),
                        ],
                        decoration: (const InputDecoration())
                            .applyDefaults(
                                Theme.of(context).inputDecorationTheme)
                            .copyWith(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: "Min",
                            ),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "to",
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        controller: widget.model.maxPriceController,
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(7),
                        ],
                        decoration: (const InputDecoration())
                            .applyDefaults(
                                Theme.of(context).inputDecorationTheme)
                            .copyWith(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: "Max",
                            ),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: widget.filter.length,
                  itemBuilder: (context, i) {
                    return widget.filter[i].title == "Price"
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.filter[i].title!,
                                  style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .14,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    // physics:
                                    //     const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 1,
                                      childAspectRatio: 2.4,
                                    ),
                                    itemCount: widget.filter[i].fields!.length,
                                    itemBuilder: (context, j) {
                                      bool isElementPresent = widget
                                          .model.selectedFilter
                                          .where((map) =>
                                              map.containsKey(widget
                                                  .filter[i].title!
                                                  .toString()) &&
                                              map[widget.filter[i].title!
                                                      .toString()] ==
                                                  widget.filter[i].fields![j]
                                                      .value!)
                                          .isNotEmpty;

                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          width: size_15,
                                          height: size_10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              // int value = int.parse(valueString, radix: 16);
                                              //Color otherColor = new Color(value);
                                              decoration: BoxDecoration(
                                                  color: widget.filter[i]
                                                              .title ==
                                                          "Color"
                                                      ? widget.filter[i]
                                                          .fields![j].value!
                                                          .toColor()
                                                      : Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.transparent
                                                          : Color.fromARGB(255,
                                                              222, 222, 222),
                                                  //  Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: isElementPresent
                                                          ? Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .transparent
                                                              : Colors.black
                                                          : const Color(
                                                              0x14E9E9E9),
                                                      width: isElementPresent
                                                          ? 3
                                                          : 2)),
                                              child: InkWell(
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                onTap: () {
                                                  print(widget.filter[i].title!
                                                          .toString() +
                                                      " " +
                                                      widget.filter[i]
                                                          .fields![j].value!);
                                                  Map<String, String> map = {
                                                    widget.filter[i].title!
                                                            .toString():
                                                        widget.filter[i]
                                                            .fields![j].value!
                                                  };
                                                  if (widget.filter[i].title ==
                                                      "Color") {
                                                    widget.model.color = widget
                                                        .filter[i]
                                                        .fields![j]
                                                        .value!
                                                        .toString();
                                                  } else if (widget
                                                          .filter[i].title ==
                                                      "Brand") {
                                                    widget.model.brandId =
                                                        widget.filter[i]
                                                            .fields![j].value!
                                                            .toString();
                                                  } else if (widget
                                                          .filter[i].title ==
                                                      "Brand") {
                                                    widget.model.brandId =
                                                        widget.filter[i]
                                                            .fields![j].value!
                                                            .toString();
                                                  } else if (widget
                                                          .filter[i].title ==
                                                      "Rating") {
                                                    widget.model.reviewFilter =
                                                        widget.filter[i]
                                                            .fields![j].value!
                                                            .toString();
                                                  }
                                                  widget.model
                                                      .getProductsListNew(
                                                          context, "25", "1");
                                                  bool isElementPresent = widget
                                                      .model.selectedFilter
                                                      .where((map) => map
                                                              .containsKey(widget
                                                                  .filter[i]
                                                                  .title!
                                                                  .toString())
                                                          //      &&
                                                          // map[widget
                                                          //         .filter[i]
                                                          //         .title!
                                                          //         .toString()] ==
                                                          //     widget
                                                          //         .filter[i]
                                                          //         .fields![
                                                          //             j]
                                                          //         .value!
                                                          )
                                                      .isNotEmpty;
                                                  if (isElementPresent) {
                                                    print(
                                                        'Element is present in the list.');
                                                  } else {
                                                    print(
                                                        'Element is not present in the list.');
                                                  }

                                                  if (isElementPresent) {
                                                    widget.model.selectedFilter
                                                        .removeWhere(
                                                            (element) => element
                                                                .containsKey(widget
                                                                    .filter[i]
                                                                    .title!
                                                                    .toString())

                                                            //   &&
                                                            // element[widget
                                                            //         .filter[
                                                            //             i]
                                                            //         .title!
                                                            //         .toString()] ==
                                                            //     widget
                                                            //         .filter[
                                                            //             i]
                                                            //         .fields![
                                                            //             j]
                                                            //         .value!
                                                            );
                                                    widget.model.selectedFilter
                                                        .add(map);
                                                  } else {
                                                    widget.model.selectedFilter
                                                        .add(map);
                                                  }
                                                  setState(() {});
                                                },
                                                child: widget.filter[i].title ==
                                                        "Color"
                                                    ? const SizedBox(
                                                        width: size_25,
                                                        height: size_10,
                                                      )
                                                    : Center(
                                                        child: Text(
                                                          widget
                                                              .filter[i]
                                                              .fields![j]
                                                              .title!,
                                                          style: TextStyle(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              fontSize:
                                                                  size_12),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                  }),
            ),
            const SizedBox(
              height: size_5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered) ||
                            states.contains(MaterialState.pressed)) {
                          return colors.buttonColor;
                        }
                        return Theme.of(context).brightness == Brightness.dark
                            ? Colors.transparent
                            : Colors.white; // Default color
                      }),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.white, width: 1)),
                    ),
                    onPressed: () {
                      Routes.navigateToPreviousScreen(context);
                    },
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered) ||
                            states.contains(MaterialState.pressed)) {
                          return colors.buttonColor;
                        }
                        return colors.buttonColor;
                      }),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.model.isHome = widget.isComingForHome;

                      Routes.navigateToPreviousScreen(context);
                      widget.model.getProductsListNew(context, "25", "1");
                    },
                    child: const Text(
                      'APPLY',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
