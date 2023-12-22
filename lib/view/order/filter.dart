import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/viewModel/orderViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';

List<Map<dynamic, dynamic>> status = [
  {'text': 'On the way'},
  {'text': 'Delivered'},
  {'text': 'Cancelled'},
  {'text': 'Returned'}
];

List<Map<dynamic, dynamic>> category = [
  {'text': 'Grocery & Staples'},
  {'text': 'Books'},
  {'text': 'Sweets'},
  {'text': 'Fruits'},
  {'text': 'Footwear'}
];

Future<void> filter(context, OrderViewModel orderProvider) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: SingleChildScrollView(
            child: Container(
              color: colors.overlayBG,
              height: 420,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      CancelApplyyBButtton(
                        orderProvider: orderProvider,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FilterClassStatus(
                        orderProvider: orderProvider,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Category",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      FilterClassCategory(
                        orderProvider: orderProvider,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.pressed)) {
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
                                orderProvider.status = "";
                                orderProvider.categorie = "";

                                orderProvider.getOrderList(context);
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
                            height: 40,
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
                                orderProvider.getOrderList(context);
                                Routes.navigateToPreviousScreen(context);
                              },
                              child: const Text(
                                'APPLY',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ));
    },
  );
}

class CancelApplyyBButtton extends StatefulWidget {
  final OrderViewModel orderProvider;
  const CancelApplyyBButtton({super.key, required this.orderProvider});

  @override
  State<CancelApplyyBButtton> createState() => _CancelApplyyBButttonState();
}

class _CancelApplyyBButttonState extends State<CancelApplyyBButtton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Filter",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          InkWell(
            onTap: () {
              widget.orderProvider.status = "";
              widget.orderProvider.categorie = "";
              setState(() {});
              widget.orderProvider.getOrderList(context);
              Routes.navigateToPreviousScreen(context);
            },
            child: Text(
              "Clear filter",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterClassCategory extends StatefulWidget {
  final OrderViewModel orderProvider;

  const FilterClassCategory({super.key, required this.orderProvider});

  @override
  State<FilterClassCategory> createState() => _FilterClassCategoryState();
}

class _FilterClassCategoryState extends State<FilterClassCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            widget.orderProvider.filters.categories!.length *
                                35,
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 15,
                            childAspectRatio: 3.8,
                          ),
                          itemCount:
                              widget.orderProvider.filters.categories!.length,
                          itemBuilder: (context, j) {
                            return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Container(
                                height: 28,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                decoration: BoxDecoration(
                                  color: colors.textFieldBG,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    widget.orderProvider.categorie = widget
                                        .orderProvider
                                        .filters
                                        .categories![j]
                                        .title!
                                        .toString();
                                    setState(() {});
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible:
                                            widget.orderProvider.categorie ==
                                                widget.orderProvider.filters
                                                    .categories![j].title!
                                                    .toString(),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: size_10,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        widget.orderProvider.filters
                                            .categories![j].value!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: size_10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterClassStatus extends StatefulWidget {
  final OrderViewModel orderProvider;

  const FilterClassStatus({super.key, required this.orderProvider});

  @override
  State<FilterClassStatus> createState() => _FilterClassStatusState();
}

class _FilterClassStatusState extends State<FilterClassStatus> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: widget.orderProvider.filters.status!.length /
                            2 *
                            34,
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            childAspectRatio: 3,
                          ),
                          itemCount:
                              widget.orderProvider.filters.status!.length,
                          itemBuilder: (context, j) {
                            return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Container(
                                height: 18,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                decoration: BoxDecoration(
                                  color: colors.textFieldBG,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    widget.orderProvider.status = widget
                                        .orderProvider
                                        .filters
                                        .status![j]
                                        .title!;
                                    setState(() {});
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: widget.orderProvider.status ==
                                            widget.orderProvider.filters
                                                .status![j].title!,
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: size_10,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        widget.orderProvider.filters.status![j]
                                            .value!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: size_8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
