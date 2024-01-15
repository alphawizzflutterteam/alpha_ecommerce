import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';

class BrandsListScreen extends StatelessWidget {
  final List<BrandsList> brandsModel;
  final SearchViewModel searchViewModel;

  const BrandsListScreen(
      {super.key, required this.brandsModel, required this.searchViewModel});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              Stack(
                children: [
                  ProfileHeader(),
                  InternalDetailPageHeader(
                    text: "Brands List",
                  )
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * .85),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                    itemCount: brandsModel.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * .22,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .10,
                            width: MediaQuery.of(context).size.width * .35,
                            child: Image.network(brandsModel[index].image),
                          ),
                          Divider(color: Colors.transparent),
                          Text(
                            brandsModel[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize:
                                        Platform.isAndroid ? size_14 : size_16,
                                    color: Colors.black),
                          ),
                          Divider(color: Colors.transparent),
                          GestureDetector(
                            onTap: () {
                              searchViewModel.clearFilters();

                              searchViewModel.brandId =
                                  brandsModel[index].id.toString();
                              searchViewModel.getProductsListNew(
                                  context, "25", "1");
                              Routes.navigateToSearchScreen(context);
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.teal,
                              ),
                              child: Center(
                                child: Text(
                                  "View Products",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: Platform.isAndroid
                                              ? size_8
                                              : size_10,
                                          color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
