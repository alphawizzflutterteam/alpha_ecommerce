import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/category/categoryCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/categoryViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';

Future<void> homeCategory(context, CategoryViewModel model,
    SearchViewModel searchProvider, bool isComingFromhome) async {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? colors.overlayBG
                        : Colors.white,
                    child: SingleChildScrollView(
                        controller: scrollController,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          CategoryFilter(
                            categoryProvider: model,
                            searchProvider: searchProvider,
                            isComingFromHome: isComingFromhome,
                          )
                        ]))));
          },
        );
      });
}

class CategoryFilter extends StatefulWidget {
  final CategoryViewModel categoryProvider;
  final SearchViewModel searchProvider;
  final bool isComingFromHome;
  const CategoryFilter(
      {Key? key,
      required this.categoryProvider,
      required this.searchProvider,
      required this.isComingFromHome})
      : super(key: key);

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  TextEditingController searchTextController = TextEditingController();

  late SearchViewModel searchProvider;
  List<Childes> listItem = [];

  @override
  void initState() {
    super.initState();
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);

    getCategory();
  }

  Future<void> getCategory() async {
    searchText("");
  }

  void searchText(String text) {
    listItem.clear();
    print(text);
    print(widget
        .categoryProvider.data[searchProvider.selectedIndex].childes!.length
        .toString());

    for (int i = 0;
        i <
            widget.categoryProvider.data[searchProvider.selectedIndex].childes!
                .length;
        i++) {
      print(widget
          .categoryProvider.data[searchProvider.selectedIndex].childes![i].name!
          .toLowerCase());
      if (text == "") {
        listItem.add(widget
            .categoryProvider.data[searchProvider.selectedIndex].childes![i]);
      } else {
        print(widget.categoryProvider.data[searchProvider.selectedIndex]
            .childes![i].name!
            .toLowerCase());
        if (widget.categoryProvider.data[searchProvider.selectedIndex]
            .childes![i].name!
            .toLowerCase()
            .contains(text.toLowerCase())) {
          print(widget.categoryProvider.data[searchProvider.selectedIndex]
              .childes![i].name!
              .toLowerCase());
          listItem.add(widget
              .categoryProvider.data[searchProvider.selectedIndex].childes![i]);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Explore Categories",
              style: TextStyle(
                  color: Theme.of(context).brightness != Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: widget.categoryProvider.data.length,
                        itemBuilder: (context, i) {
                          return buildTabButton(
                              widget.categoryProvider.data[i].name!,
                              searchProvider.selectedIndex == i, () {
                            searchProvider.selectedIndex = i;
                            searchTextController.text = "";
                            searchProvider.categoryId =
                                widget.categoryProvider.data[i].id.toString();

                            setState(() {
                              searchText("");
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              widget.categoryProvider.data.isEmpty
                  ? Container()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            controller: searchTextController,
                            onChanged: (value) {
                              searchText(value);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textFieldBG
                                  : Colors.white,
                              filled: true,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                      width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1)),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.9,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, i) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget
                                          .categoryProvider
                                          .data[searchProvider.selectedIndex]
                                          .name!,
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 2,
                                          childAspectRatio: 0.7,
                                        ),
                                        itemCount: listItem.length,
                                        itemBuilder: (context, j) {
                                          print(listItem.length);
                                          return categoryCard(
                                              context: context,
                                              categoryIndex:
                                                  searchProvider.selectedIndex,
                                              categoryListIndex: j,
                                              model: listItem[j],
                                              searchProvider: searchProvider,
                                              categoryId: widget
                                                  .categoryProvider
                                                  .data[searchProvider
                                                      .selectedIndex]
                                                  .id
                                                  .toString(),
                                              isComingFromHome:
                                                  widget.isComingFromHome);
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
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    return Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? colors.textFieldBG
            : Color(0xFFE3E1EC),
        width: MediaQuery.of(context).size.width * 0.35,
        height: 60,
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
                      : Color.fromARGB(255, 164, 163, 170),
            ),
            child: Center(
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size_12,
                    color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
