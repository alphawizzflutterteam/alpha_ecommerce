import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/filtersModel.dart';
import 'package:flutter/material.dart';
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

Future<void> homeFilter(context, List<Filters> filter) async {
  print(filter.length.toString());
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: SingleChildScrollView(
            child: Container(
              color: colors.overlayBG,
              height: MediaQuery.of(context).size.height * 0.73,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Filter",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                      fillColor: colors.textFieldBG,
                                      filled: true,
                                      hintText: 'Min',
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                const Text(
                                  "to",
                                  style: TextStyle(
                                      color: colors.textColor, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                      fillColor: colors.textFieldBG,
                                      filled: true,
                                      hintText: 'Max',
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colors.textFieldColor,
                                              width: 1)),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: filter.length,
                                itemBuilder: (context, i) {
                                  return filter[i].title == "Price"
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                filter[i].title!,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height:
                                                    filter[i].fields!.length %
                                                                    4 !=
                                                                0 &&
                                                            filter[i]
                                                                    .fields!
                                                                    .length >
                                                                4
                                                        ? 72 *
                                                            (filter[i]
                                                                .fields!
                                                                .length) /
                                                            6.toDouble()
                                                        : 70,
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 0),
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 4,
                                                    mainAxisSpacing: 1,
                                                    childAspectRatio: 2.4,
                                                  ),
                                                  itemCount:
                                                      filter[i].fields!.length,
                                                  itemBuilder: (context, j) {
                                                    print(
                                                      filter[i].fields!.length,
                                                    );
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: SizedBox(
                                                        width: size_15,
                                                        height: size_10,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Container(
                                                            // int value = int.parse(valueString, radix: 16);
                                                            //Color otherColor = new Color(value);
                                                            decoration: BoxDecoration(
                                                                color: filter[i]
                                                                            .title ==
                                                                        "Color"
                                                                    ? filter[i]
                                                                        .fields![
                                                                            j]
                                                                        .value!
                                                                        .toColor()
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border:
                                                                    Border.all(
                                                                        color: const Color(
                                                                            0x14E9E9E9),
                                                                        width:
                                                                            2)),
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child: filter[i]
                                                                          .title ==
                                                                      "Color"
                                                                  ? const SizedBox(
                                                                      width:
                                                                          size_25,
                                                                      height:
                                                                          size_10,
                                                                    )
                                                                  : Center(
                                                                      child:
                                                                          Text(
                                                                        filter[i]
                                                                            .fields![j]
                                                                            .title!,
                                                                        style: const TextStyle(
                                                                            color:
                                                                                colors.textColor,
                                                                            fontSize: size_12),
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

                                              // Row(
                                              //   children: [
                                              //     SizedBox(
                                              //       height: 40,
                                              //       child: ListView.builder(
                                              //         scrollDirection: Axis.horizontal,
                                              //         padding: EdgeInsets.zero,
                                              //         shrinkWrap: true,
                                              //         physics:
                                              //             const AlwaysScrollableScrollPhysics(),
                                              //         itemCount: filter[i].fields!.length,
                                              //         itemBuilder: (context, j) {
                                              //           return SingleChildScrollView(
                                              //             scrollDirection:
                                              //                 Axis.horizontal,
                                              //             child: InkWell(
                                              //               onTap: () {},
                                              //               child: Row(
                                              //                 children: [
                                              //                   Container(
                                              //                     padding:
                                              //                         const EdgeInsets
                                              //                             .symmetric(
                                              //                             horizontal: 10,
                                              //                             vertical: 10),
                                              //                     margin: const EdgeInsets
                                              //                         .only(right: 10),
                                              //                     // int value = int.parse(valueString, radix: 16);
                                              //                     //Color otherColor = new Color(value);
                                              //                     decoration: BoxDecoration(
                                              //                         color: filter[i]
                                              //                                     .title ==
                                              //                                 "Color"
                                              //                             ? filter[i]
                                              //                                 .fields![j]
                                              //                                 .value!
                                              //                                 .toColor()
                                              //                             : Colors
                                              //                                 .transparent,
                                              //                         borderRadius:
                                              //                             BorderRadius
                                              //                                 .circular(
                                              //                                     5),
                                              //                         border: Border.all(
                                              //                             color: const Color(
                                              //                                 0x14E9E9E9),
                                              //                             width: 2)),
                                              //                     child: InkWell(
                                              //                       onTap: () {},
                                              //                       child:
                                              //                           filter[i].title ==
                                              //                                   "Color"
                                              //                               ? SizedBox(
                                              //                                   width:
                                              //                                       size_25,
                                              //                                   height:
                                              //                                       size_10,
                                              //                                 )
                                              //                               : Text(
                                              //                                   filter[i]
                                              //                                       .fields![
                                              //                                           j]
                                              //                                       .title!,
                                              //                                   style: const TextStyle(
                                              //                                       color: colors
                                              //                                           .textColor,
                                              //                                       fontSize:
                                              //                                           size_12),
                                              //                                 ),
                                              //                     ),
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           );
                                              //         },
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        );
                                }),
                          ),
                        ),

                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: const Text(
                        //     "Color",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // ),
                        // Container(
                        //     alignment: Alignment.centerLeft,
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 20, vertical: 10),
                        //     child: Row(
                        //       children: [
                        //         for (int i = 0; i < colorCode.length; i++)
                        //           Container(
                        //             decoration: BoxDecoration(
                        //                 color: colorCode[i]['color'],
                        //                 borderRadius: const BorderRadius.all(
                        //                     Radius.circular(5))),
                        //             margin: const EdgeInsets.only(right: 10),
                        //             height: 30,
                        //             width: 30,
                        //           ),
                        //       ],
                        //     )),
                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: const Text(
                        //     "Price",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // ),
                        // Container(
                        //     alignment: Alignment.centerLeft,
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 20, vertical: 10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         SizedBox(
                        //           height: 40,
                        //           width: MediaQuery.of(context).size.width * 0.4,
                        //           child: TextFormField(
                        //             decoration: InputDecoration(
                        //               contentPadding: const EdgeInsets.symmetric(
                        //                   vertical: 5, horizontal: 10),
                        //               fillColor: colors.textFieldBG,
                        //               filled: true,
                        //               hintText: 'Min',
                        //               hintStyle:
                        //                   const TextStyle(color: Colors.white),
                        //               focusedErrorBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //               enabledBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //               errorBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //               focusedBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //             ),
                        //             style: const TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //         const Text(
                        //           "to",
                        //           style: TextStyle(
                        //               color: colors.textColor, fontSize: 14),
                        //         ),
                        //         SizedBox(
                        //           height: 40,
                        //           width: MediaQuery.of(context).size.width * 0.4,
                        //           child: TextFormField(
                        //             decoration: InputDecoration(
                        //               contentPadding: const EdgeInsets.symmetric(
                        //                   vertical: 5, horizontal: 10),
                        //               fillColor: colors.textFieldBG,
                        //               filled: true,
                        //               hintText: 'Max',
                        //               hintStyle:
                        //                   const TextStyle(color: Colors.white),
                        //               focusedErrorBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //               enabledBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //               errorBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //               focusedBorder: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   borderSide: const BorderSide(
                        //                       color: colors.textFieldColor,
                        //                       width: 1)),
                        //             ),
                        //             style: const TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ],
                        //     )),
                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: const Text(
                        //     "Brand",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 10, vertical: 10),
                        //   child: Wrap(
                        //     spacing: 25,
                        //     runSpacing: 15,
                        //     children: [
                        //       for (int i = 0; i < brand.length; i++)
                        //         FittedBox(
                        //           fit: BoxFit.fitWidth,
                        //           child: Container(
                        //             height: 30,
                        //             width: 80,
                        //             alignment: Alignment.center,
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 10, vertical: 4),
                        //             decoration: BoxDecoration(
                        //               color: colors.textFieldBG,
                        //               borderRadius: BorderRadius.circular(10),
                        //               border: Border.all(color: Colors.grey),
                        //             ),
                        //             child: InkWell(
                        //               onTap: () {},
                        //               child: Text(
                        //                 brand[i]['text'],
                        //                 style: const TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 14,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: const Text(
                        //     "Rating",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Wrap(
                        //   spacing: 25,
                        //   runSpacing: 15,
                        //   children: [
                        //     for (int i = 0; i < rating.length; i++)
                        //       FittedBox(
                        //         fit: BoxFit.fitWidth,
                        //         child: Container(
                        //           height: 30,
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 20, vertical: 5),
                        //           decoration: BoxDecoration(
                        //             color: colors.textFieldBG,
                        //             borderRadius: BorderRadius.circular(10),
                        //             border: Border.all(color: Colors.grey),
                        //           ),
                        //           child: InkWell(
                        //             onTap: () {},
                        //             child: Text(
                        //               rating[i]['text'],
                        //               style: const TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 14,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),

                        SizedBox(
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
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return colors.buttonColor;
                                    }
                                    return Colors.transparent; // Default color
                                  }),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          color: Colors.white, width: 1)),
                                ),
                                onPressed: () {
                                  Routes.navigateToPreviousScreen(context);
                                },
                                child: const Text(
                                  'CANCEL',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    if (states
                                            .contains(MaterialState.hovered) ||
                                        states
                                            .contains(MaterialState.pressed)) {
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
                                onPressed: () {},
                                child: const Text(
                                  'APPLY',
                                  style: TextStyle(fontSize: 12),
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
                ),
              ),
            ),
          ));
    },
  );
}
