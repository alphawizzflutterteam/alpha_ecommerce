import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/vendorDetailCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/vendorViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                    InternalDetailPageHeader(
                      text: "Vendor Details",
                    ),
                  ],
                ),
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
                            horizontal: 12, vertical: 10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0x14E9E9E9)
                                    : colors.lightBorder,
                                width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.model.image,
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) {
                                        return ErrorImageWidget();
                                      },
                                      width: size_60,
                                      height: size_60,
                                    )),
                                VerticalDivider(color: Colors.transparent),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.26,
                                  child: Text(
                                    widget.model.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.greyText
                                              : Colors.black,
                                          fontSize: Platform.isAndroid
                                              ? size_13
                                              : size_15,
                                        ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width *
                                        0.26,
                                    child: CommonButton(
                                      text: !categoryProvider.isFollowing
                                          ? "Follow"
                                          : "Unfollow",
                                      fontSize: Platform.isAndroid
                                          ? size_10
                                          : size_12,
                                      colorsText: Colors.white,
                                      onClick: () {
                                        Map data = {
                                          'shop_id': widget.model.id.toString()
                                        };
                                        categoryProvider.followVendor(
                                            data, context);
                                      },
                                    )),
                              ],
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: Platform.isAndroid
                                                ? size_12
                                                : size_14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Rating",
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.greyText
                                            : Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                VerticalDivider(
                                    color: Colors.transparent, width: size_40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.model.product_count,
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: Platform.isAndroid
                                            ? size_12
                                            : size_14,
                                      ),
                                    ),
                                    Text(
                                      "Products",
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.greyText
                                            : Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                VerticalDivider(
                                    color: Colors.transparent, width: size_40),
                                Column(
                                  children: [
                                    Text(
                                      widget.model.followers,
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: Platform.isAndroid
                                              ? size_13
                                              : size_15),
                                    ),
                                    Text(
                                      "Follower",
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? colors.greyText
                                              : Colors.black,
                                          fontSize: Platform.isAndroid
                                              ? size_12
                                              : size_14),
                                    ),
                                  ],
                                ),
                                widget.model.isVerified == "0"
                                    ? Container()
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          Images.trusted,
                                          height: size_30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: size_10,
                            ),
                            Divider(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              height: 1,
                            ),
                            const SizedBox(
                              height: size_10,
                            ),
                            Text(
                              widget.model.address,
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize:
                                    Platform.isAndroid ? size_10 : size_12,
                              ),
                            ),
                            widget.model.contact != ""
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : Container(),
                            Text(
                              widget.model.contact,
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize:
                                    Platform.isAndroid ? size_10 : size_12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: size_20),
                      categoryProvider.isLoading
                          ? appLoader()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.52,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
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
                                                fillColor: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? colors.textFieldBG
                                                    : Colors.white,
                                                filled: true,
                                                hintText: 'Search',
                                                hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
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
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                        width: 2)),
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
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
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
                                                0.5,
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
                                                        style: TextStyle(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                            0.5,
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
      color: Theme.of(context).brightness == Brightness.dark
          ? colors.textFieldBG
          : Color(0xFFE3E1EC),
      width: MediaQuery.of(context).size.width * 0.35,
      height: 55,
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
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
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
