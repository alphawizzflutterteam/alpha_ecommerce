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

  @override
  void initState() {
    super.initState();
    categoryProvider = Provider.of<CategoryViewModel>(context, listen: false);
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);
    searchProvider.clearFilters();

    getCategory();
  }

  Future<void> getCategory() async {
    await categoryProvider.getCategories(context);
    //listItem = categoryProvider.data[0].childes!;
    searchText("");
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

    return Stack(
      children: [
        const LightBackGround(),
        categoryProvider.isLoading
            ? appLoader()
            : Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                extendBody: true,
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    const Stack(
                      children: [
                        ProfileHeader(),
                        DashboardHeader(),
                      ],
                    ),
                    categoryProvider.isLoading
                        ? appLoader()
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "Explore Categories",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  categoryProvider.isLoading
                                      ? appLoader()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(),
                                                    itemCount: categoryProvider
                                                        .data.length,
                                                    itemBuilder: (context, i) {
                                                      return buildTabButton(
                                                          categoryProvider
                                                              .data[i].name!,
                                                          searchProvider
                                                                  .selectedIndex ==
                                                              i, () {
                                                        searchProvider
                                                            .selectedIndex = i;
                                                        searchTextController
                                                            .text = "";
                                                        searchProvider
                                                                .categoryId =
                                                            categoryProvider
                                                                .data[i].id!
                                                                .toString();

                                                        setState(() {
                                                          searchText("");
                                                        });
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        child: TextFormField(
                                                          onChanged: (value) {
                                                            searchText(value);
                                                          },
                                                          controller:
                                                              searchTextController,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            fillColor: colors
                                                                .textFieldBG,
                                                            filled: true,
                                                            hintText: 'Search',
                                                            hintStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                            prefixIcon:
                                                                const Icon(
                                                              Icons.search,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    const BorderSide(
                                                                        color:
                                                                            Colors
                                                                                .grey,
                                                                        width:
                                                                            1)),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    const BorderSide(
                                                                        color:
                                                                            Colors
                                                                                .grey,
                                                                        width:
                                                                            1)),
                                                            errorBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    const BorderSide(
                                                                        color:
                                                                            Colors
                                                                                .grey,
                                                                        width:
                                                                            1)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    const BorderSide(
                                                                        color:
                                                                            Colors
                                                                                .grey,
                                                                        width:
                                                                            1)),
                                                          ),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.9,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemCount: 1,
                                                          itemBuilder:
                                                              (context, i) {
                                                            return SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.6,
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
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          10),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.55,
                                                                    child: GridView
                                                                        .builder(
                                                                      shrinkWrap:
                                                                          true,
                                                                      padding: const EdgeInsets
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
                                                                            0.7,
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
                                                                            categoryIndex: searchProvider
                                                                                .selectedIndex,
                                                                            categoryListIndex:
                                                                                j,
                                                                            model: listItem[
                                                                                j],
                                                                            searchProvider:
                                                                                searchProvider,
                                                                            categoryId:
                                                                                categoryProvider.data[searchProvider.selectedIndex].id.toString(),
                                                                            isComingFromHome: false);
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
                          ),
                  ],
                ),
              ),
      ],
    );
  }

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    return Container(
      color: colors.textFieldBG,
      width: MediaQuery.of(context).size.width * 0.35,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isSelected ? colors.buttonColor : Colors.transparent,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
