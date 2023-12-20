import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/vendorDetailCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/vendorViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../../model/category.dart';
import '../category/categoryCard.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class VendorDetails extends StatefulWidget {
  final VendorDatum model;
  const VendorDetails({Key? key, required this.model}) : super(key: key);

  @override
  State<VendorDetails> createState() => _VendorDetailsState();
}

class _VendorDetailsState extends State<VendorDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> isTabSelectedList = List.generate(11, (index) => index == 0);
  late VendorViewModel categoryProvider;
  late SearchViewModel searchProvider;
  TextEditingController searchTextController = TextEditingController();

  List<Childes> listItem = [];

  @override
  void initState() {
    super.initState();
    categoryProvider = Provider.of<VendorViewModel>(context, listen: false);
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);
    searchProvider.vendorId = widget.model.id.toString();
    getCategory();

    categoryProvider.isFollowing =
        widget.model.isFollowing == "1" ? true : false;
  }

  Future<void> getCategory() async {
    await categoryProvider.getVendorCategoriesItem(
        context, widget.model.id.toString());
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
    categoryProvider = Provider.of<VendorViewModel>(context);
    searchProvider = Provider.of<SearchViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  InternalDetailPageHeader(
                    text: "Vendor Details",
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0x14E9E9E9), width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        widget.model.image,
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              widget.model.name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.22,
                                                child: CommonButton(
                                                  text: !categoryProvider
                                                          .isFollowing
                                                      ? "Follow"
                                                      : "Unfollow",
                                                  fontSize: 14,
                                                  onClick: () {
                                                    Map data = {
                                                      'shop_id': widget.model.id
                                                          .toString()
                                                    };
                                                    categoryProvider
                                                        .followVendor(
                                                            data, context);
                                                  },
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 16,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            widget.model.rating,
                                            style: const TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Rating",
                                        style:
                                            TextStyle(color: colors.greyText),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        widget.model.followers,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const Text(
                                        "Follower",
                                        style: TextStyle(
                                            color: colors.greyText,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  widget.model.isVerified == "0"
                                      ? Container()
                                      : Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            Images.trusted,
                                            height: 30,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.white,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.model.address,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            widget.model.contact != ""
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : Container(),
                            Text(
                              widget.model.contact,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      categoryProvider.isLoading
                          ? appLoader()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemCount: categoryProvider.data.length,
                                        itemBuilder: (context, i) {
                                          return buildTabButton(
                                              categoryProvider.data[i].name!,
                                              searchProvider.selectedIndex == i,
                                              () {
                                            searchProvider.selectedIndex = i;
                                            searchTextController.text = "";
                                            searchProvider.categoryId =
                                                categoryProvider.data[i].id!
                                                    .toString();
                                            searchProvider.vendorId =
                                                widget.model.id.toString();
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                searchText(value);
                                              },
                                              controller: searchTextController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                fillColor: colors.textFieldBG,
                                                filled: true,
                                                hintText: 'Search',
                                                hintStyle: const TextStyle(
                                                    color: Colors.white),
                                                prefixIcon: const Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1)),
                                                errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey,
                                                            width: 1)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1)),
                                              ),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
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
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.55,
                                                        child: GridView.builder(
                                                          shrinkWrap: true,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 20),
                                                          physics:
                                                              const AlwaysScrollableScrollPhysics(),
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            mainAxisSpacing: 2,
                                                            childAspectRatio:
                                                                0.7,
                                                          ),
                                                          itemCount:
                                                              listItem.length,
                                                          itemBuilder:
                                                              (context, j) {
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
                                                                    listItem[j],
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
      width: MediaQuery.of(context).size.width * 0.3,
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
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
