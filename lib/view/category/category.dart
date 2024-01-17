import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/categoryViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../model/category.dart';
import '../cart/savedItems.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';
import 'categoryCard.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchTextController = TextEditingController();

  late CategoryViewModel categoryProvider;
  late SearchViewModel searchProvider;

  List<Childes> listItem = [];
  bool isFirstTym = true;

  @override
  void initState() {
    super.initState();
    categoryProvider = Provider.of<CategoryViewModel>(context, listen: false);
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);
    searchProvider.clearFilters();
    if (searchProvider.selectedIndexFromHome != 0) {
      searchProvider.selectedIndex = searchProvider.selectedIndexFromHome;
      searchProvider.selectedIndexFromHome = 0;
    }

    if (categoryProvider.data.isEmpty) {
      getCategory();
    }
  }

  Future<void> getCategory() async {
    await categoryProvider.getCategories(context);
    //listItem = categoryProvider.data[0].childes!;
    setState(() {
      searchText("");
    });
  }

  void searchText(String text) {
    listItem.clear();
    print(text);
    print(categoryProvider.data[searchProvider.selectedIndex].childes!.length
        .toString());

    for (int i = 0;
        i < categoryProvider.data[searchProvider.selectedIndex].childes!.length;
        i++) {
      print(categoryProvider
          .data[searchProvider.selectedIndex].childes![i].name!
          .toLowerCase());
      if (text == "") {
        listItem.add(
            categoryProvider.data[searchProvider.selectedIndex].childes![i]);
      } else {
        print(categoryProvider
            .data[searchProvider.selectedIndex].childes![i].name!
            .toLowerCase());
        if (categoryProvider
            .data[searchProvider.selectedIndex].childes![i].name!
            .toLowerCase()
            .contains(text.toLowerCase())) {
          print(categoryProvider
              .data[searchProvider.selectedIndex].childes![i].name!
              .toLowerCase());
          listItem.add(
              categoryProvider.data[searchProvider.selectedIndex].childes![i]);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryViewModel>(context);
    searchProvider = Provider.of<SearchViewModel>(context);

    if (searchProvider.selectedIndexFromHome != null && isFirstTym) {
      isFirstTym = false;
      searchText("");
    }

    return Stack(
      children: [
        const LightBackGround(),
        RefreshIndicator(
          color: colors.buttonColor,
          backgroundColor: Colors.white,
          displacement: 40.0,
          strokeWidth: 2.0,
          semanticsLabel: 'Pull to refresh',
          semanticsValue: 'Refresh',
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
            searchProvider.clearFilters();
            if (searchProvider.selectedIndexFromHome != 0) {
              searchProvider.selectedIndex =
                  searchProvider.selectedIndexFromHome;
              searchProvider.selectedIndexFromHome = 0;
            }

            getCategory();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            extendBody: true,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.white,
            body: Column(
              children: [
                Container(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : colors.buttonColor,
                  child: const Stack(
                    children: [
                      ProfileHeader(),
                      DashboardHeader(),
                    ],
                  ),
                ),
                categoryProvider.isLoading
                    ? appLoader()
                    : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Divider(height: 5, color: Colors.transparent),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Explore Categories",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: Platform.isAndroid
                                            ? size_18
                                            : size_20,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 5,
                            ),
                            categoryProvider.isLoading
                                ? appLoader()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.68,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.32,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          itemCount:
                                              categoryProvider.data.length,
                                          itemBuilder: (context, i) {
                                            return buildTabButton(
                                                categoryProvider.data[i].name!,
                                                searchProvider.selectedIndex ==
                                                    i, () {
                                              searchProvider.selectedIndex = i;
                                              searchTextController.text = "";
                                              searchProvider.categoryId =
                                                  categoryProvider.data[i].id!
                                                      .toString();

                                              setState(() {
                                                searchText("");
                                              });
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      categoryProvider.data.isEmpty
                                          ? Container()
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      searchText(value);
                                                    },
                                                    controller:
                                                        searchTextController,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      fillColor: Theme.of(
                                                                      context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? colors.textFieldBG
                                                          : Colors.white,
                                                      filled: true,
                                                      hintText: 'Search',
                                                      hintStyle: Theme.of(
                                                              context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                      prefixIcon: Icon(
                                                        Icons.search,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                      focusedErrorBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              width: 2)),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1)),
                                                      errorBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1)),
                                                    ),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.6,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: 1,
                                                    itemBuilder: (context, i) {
                                                      return SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              categoryProvider
                                                                  .data[searchProvider
                                                                      .selectedIndex]
                                                                  .name!,
                                                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                                  color: Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: Platform
                                                                          .isAndroid
                                                                      ? size_16
                                                                      : size_18),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.55,
                                                              child: GridView
                                                                  .builder(
                                                                shrinkWrap:
                                                                    true,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            20),
                                                                physics:
                                                                    const AlwaysScrollableScrollPhysics(),
                                                                gridDelegate:
                                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  mainAxisSpacing:
                                                                      2,
                                                                  childAspectRatio:
                                                                      0.85,
                                                                ),
                                                                itemCount:
                                                                    listItem
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        j) {
                                                                  print(listItem
                                                                      .length);
                                                                  return categoryCard(
                                                                      context:
                                                                          context,
                                                                      categoryIndex:
                                                                          searchProvider
                                                                              .selectedIndex,
                                                                      categoryListIndex:
                                                                          j,
                                                                      model:
                                                                          listItem[
                                                                              j],
                                                                      searchProvider:
                                                                          searchProvider,
                                                                      categoryId: categoryProvider
                                                                          .data[searchProvider
                                                                              .selectedIndex]
                                                                          .id
                                                                          .toString(),
                                                                      isComingFromHome:
                                                                          false);
                                                                },
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ],
                                  )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? colors.textFieldBG
          : Color(0xFFE3E1EC),
      width: MediaQuery.of(context).size.width * 0.35,
      height: 48,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? colors.buttonColor
                : Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : Color(0xFFE3E1EC),
          ),
          // style: ElevatedButton.styleFrom(
          //   primary: isSelected ? colors.buttonColor : Color(0xFFE3E1EC),
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          // ),
          child: Text(
            label,
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: Platform.isAndroid ? size_10 : size_12,
                color: isSelected
                    ? Colors.white
                    : Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
          ),
        ),
      ),
    );
  }
}
