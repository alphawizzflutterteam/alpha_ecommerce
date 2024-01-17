import 'dart:async';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/brandsCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/cartCard.dart.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/dailyDealsCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/productsForYouCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/secondCategory.dart';
import 'package:alpha_ecommerce_18oct/view/home/cards/wishlistCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/homeTexts&Spaces.dart';
import 'package:alpha_ecommerce_18oct/view/home/productQualityCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/specialOfferCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/topDealCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/categoryShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/filterShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/sortShuffle.dart';
import 'package:alpha_ecommerce_18oct/viewModel/categoryViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool isWidgetVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late HomeViewModel homeProvider;

  late SearchViewModel searchProvider;
  late CategoryViewModel categoryProvider;
  ScrollController _scrollController = ScrollController();

  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    // optional, false if you cont want continous lookup
    lookUpDuration: const Duration(seconds: 10),
    // optional, to override default lookup duration
    lookUpUrl: 'example.com', // optional, to override default lookup url
  );

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    categoryProvider = Provider.of<CategoryViewModel>(context, listen: false);
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);

    checkInternetAvailability();
    _scrollController.addListener(() {
      setState(() {
        // homeProvider.isScrolled = _scrollController.offset > 0;

        homeProvider.setScrolling(
            _scrollController.position.userScrollDirection ==
                ScrollDirection.forward);
      });
    });
  }

  callApis() async {
    await homeProvider.getHomeBanners(context);
    await homeProvider.getCategoriesList(context, 1);
    await homeProvider.getBannersList(context);

    searchProvider.selectedIndexFromHome = 0;
    searchProvider.selectedIndex = 0;
    searchProvider.selectedType = "";

    searchProvider.clearFilters();
    await homeProvider.getProductFilters(context);
    await searchProvider.getProductsListNew(context, "25", "1");

    try {
      var phone = SharedPref.shared.pref!.getString(PrefKeys.mobile);

      Map data = {'phone': phone};
      await homeProvider.getProfileAPI(data, context);
    } catch (stacktrace) {}
    await homeProvider.getBrandsList(context);
    await homeProvider.getSpecialOffersList(context);
    await homeProvider.getDailyDealsList(context);
    await homeProvider.getCartListItem(context);
    await homeProvider.getWishlistItem(context);

    getCategory();
    homeProvider.getChatlist(context);
  }

  Future<void> getCategory() async {
    searchProvider.selectedIndex = 0;
    searchProvider.selectedIndexFromHome = 0;
    categoryProvider.getCategories(context);
    //listItem = categoryProvider.data[0].childes!;
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkInternetAvailability() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      bool _isInternetAvailableOnCall =
          await _flutterNetworkConnectivity.isInternetConnectionAvailable();
      if (_isInternetAvailableOnCall) {
        callApis();
      }
    } on PlatformException {
      // _isInternetAvailableOnCall = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);
    categoryProvider = Provider.of<CategoryViewModel>(context);
    searchProvider = Provider.of<SearchViewModel>(context);

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
            searchProvider.selectedFilter.clear();
            searchProvider.clearFilters();
            checkInternetAvailability();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            extendBody: true,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.transparent
                : Colors.white,
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Routes.navigateToChatScreen(context);
                },
                backgroundColor: colors.buttonColor,
                child: Image.asset(
                  Images.chat,
                  height: 35,
                  width: 35,
                )),
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
                // Container(
                //   height: 50,
                //   color: colors.homeContainer1BG,
                //   child: ListView(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //     scrollDirection: Axis.horizontal,
                //     children: List.generate(5, (index) {
                //       return categoryCardTop();
                //     }),
                //   ),
                // ),
                !isWidgetVisible
                    ? Container()
                    : FilterBar(
                        homeProvider: homeProvider,
                        searchProvider: searchProvider,
                        categoryProvider: categoryProvider),
                Expanded(
                    child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                homeProvider.categoriesModel.length > 4
                                    ? InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          Routes.navigateToBottomNavScreen(
                                              context, 1);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 12.0, left: 12, right: 12),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/Group 738.png",
                                                height: size_50,
                                              ),
                                              // Icon(
                                              //   Icons.arrow_forward,
                                              //   color: Colors.black,
                                              //   size: size_30,
                                              // ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 4.0, bottom: 8),
                                                child: Text("View All",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            fontSize: Platform
                                                                    .isAndroid
                                                                ? size_10
                                                                : size_12,
                                                            color: colors
                                                                .darkColor2,
                                                            fontWeight:
                                                                FontWeight.w600)
                                                    //  TextStyle(
                                                    //     color: colors.darkColor2,
                                                    //      fontSize: Platform.isAndroid ? size_10 : size_12,
                                                    //     fontWeight:
                                                    //         FontWeight.w500),
                                                    ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: secondCategoryListCard(
                                      context,
                                      homeProvider.categoriesModel,
                                      searchProvider,
                                      categoryProvider.data),
                                ),
                              ],
                            )),
                      ),

                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: size_200 * 0.95,
                            child: CarouselSlider(
                              items: homeProvider.imageList.map((item) {
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    searchProvider.clearFilters();

                                    for (int i = 0;
                                        i < homeProvider.bannersListTop.length;
                                        i++) {
                                      if (homeProvider
                                              .bannersListTop[i].photo ==
                                          item) {
                                        searchProvider.offerId = homeProvider
                                            .bannersListTop[i].id
                                            .toString();
                                      }
                                    }
                                    //  searchProvider.brandId = model.id.toString();
                                    searchProvider.isHome = false;
                                    Routes.navigateToSearchScreen(context);
                                    searchProvider.getProductsListNew(
                                        context, "25", "1");
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: CachedNetworkImage(
                                      imageUrl: item,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) =>
                                          appLoader(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: false,
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size_5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: homeProvider.imageList
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentIndex = entry.key;
                                  });
                                },
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == entry.key
                                        ? colors.buttonColor
                                        : colors.secondary,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Divider(color: Colors.transparent, height: 5),

                      //Brands Listing
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                homeProvider.brandsModel.length > 4
                                    ? InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          Routes.navigateToBrandsScreen(
                                              context,
                                              homeProvider.brandsModel,
                                              searchProvider);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 12.0, left: 12, right: 12),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/Group 738.png",
                                                height: size_50,
                                              ),
                                              // Icon(
                                              //   Icons.arrow_forward,
                                              //   color: Colors.black,
                                              //   size: size_30,
                                              // ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 4.0, bottom: 8),
                                                child: Text("View All",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            fontSize: Platform
                                                                    .isAndroid
                                                                ? size_10
                                                                : size_12,
                                                            color: colors
                                                                .darkColor2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: brandsCard(
                                        context,
                                        homeProvider.brandsModel,
                                        searchProvider),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      homeProvider.modelBanners == null
                          ? appLoader()
                          : Container(
                              height: MediaQuery.of(context).size.height * .1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colors.homeBG.withOpacity(1),
                                    colors.homeBG.withOpacity(0.8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: productQualityCard(
                                  homeProvider.modelBanners, context)),
                      spaceOfHeight(height: 20),

                      homeProvider.cartModel.isEmpty
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          homeProvider.isScrolled = false;

                                          Routes.navigateToCartScreen(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "View your cart Items",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? colors.textColor
                                                          : Colors.black),
                                            ),
                                            InkWell(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                Routes
                                                    .navigateToBottomNavScreen(
                                                        context, 0);
                                              },
                                              child: Text("VIEW ALL",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontSize:
                                                              Platform.isAndroid
                                                                  ? size_10
                                                                  : size_12,
                                                          color: colors
                                                              .buttonColor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              // style: Theme.of(context)
                                              //       .textTheme
                                              //       .titleSmall!
                                              //       .copyWith(

                                              // //     color: colors.buttonColor),
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: cartCardRowHome(context,
                                                  homeProvider.cartModel),
                                            ),
                                          )),
                                    ),
                                    homeProvider.specialOffersModel.isEmpty
                                        ? Container()
                                        : const SizedBox(height: 20)
                                  ],
                                ),
                              ),
                            ),

                      homeProvider.specialOffersModel.isEmpty
                          ? Container()
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colors.homeBGGradient1.withOpacity(1),
                                    colors.homeBGGradient2.withOpacity(0.8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 60),
                                          child: Divider(
                                            height: 1,
                                            color: colors.homeDivider,
                                            thickness: 3,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          "Special Offer",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: colors.textColor,
                                                  fontSize: Platform.isAndroid
                                                      ? size_18
                                                      : size_20,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 60),
                                          child: Divider(
                                            height: 1,
                                            color: colors.homeDivider,
                                            thickness: 3,
                                            indent: 3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: specialOfferList(
                                              context,
                                              homeProvider.specialOffersModel,
                                              searchProvider),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                      homeProvider.specialOffersModel.isEmpty
                          ? Container()
                          : const SizedBox(
                              height: 20,
                            ),
                      homeProvider.wishlistModel.isEmpty
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 270,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Your wishlist items",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? colors.textColor
                                                        : Colors.black),
                                          ),
                                          InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              Routes.navigateToWishlistScreen(
                                                  context);
                                            },
                                            child: Row(
                                              children: [
                                                Text("VIEW ALL",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            fontSize: Platform
                                                                    .isAndroid
                                                                ? size_10
                                                                : size_12,
                                                            color: colors
                                                                .buttonColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: wishlistCardsRow(context,
                                                  homeProvider.wishlistModel),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      homeProvider.banner1 == ""
                          ? Container()
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                homeProvider.banner1 ?? "",
                                fit: BoxFit.contain,
                              ),
                            ),
                      homeProvider.banner1 == ""
                          ? Container()
                          : const SizedBox(
                              height: 20,
                            ),
                      homeProvider.banner2 == ""
                          ? Container()
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                homeProvider.banner2 ?? "",
                                fit: BoxFit.contain,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      homeProvider.dailyDealsModel.isEmpty
                          ? Container()
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                  gradient:
                                      // Theme.of(context).brightness == Brightness.dark
                                      //     ?
                                      LinearGradient(
                                colors: [
                                  colors.homeGradient3.withOpacity(0.7),
                                  colors.homeGradient4.withOpacity(0.4),
                                  colors.homeGradient3.withOpacity(0.7),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.centerRight,
                              )
                                  // : LinearGradient(
                                  //     colors: [
                                  //       colors.homeGradient3.withOpacity(0.7),
                                  //       colors.homeGradient4.withOpacity(0.4),
                                  //       colors.homeGradient3.withOpacity(0.7),
                                  //     ],
                                  //     begin: Alignment.topLeft,
                                  //     end: Alignment.centerRight,
                                  //   ),
                                  ),
                              child: Column(
                                children: [
                                  spaceOfHeight(),
                                  spaceOfHeight(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 60),
                                          child: Divider(
                                            height: 1,
                                            color: colors.homeDivider,
                                            thickness: 3,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text("Daily Deals",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: Platform.isAndroid
                                                        ? size_18
                                                        : size_20,
                                                    color: colors.textColor,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        // // style: Theme.of(context)
                                        //                   .textTheme
                                        //                   .titleSmall!
                                        //                   .copyWith(

                                        //     color: colors.textColor,
                                        //     fontSize: Platform.isAndroid ? size_18 : size_20,
                                        //     fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 60),
                                          child: Divider(
                                            height: 1,
                                            color: colors.homeDivider,
                                            thickness: 3,
                                            indent: 3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceOfHeight(),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: dailyDealListCard(
                                              context,
                                              homeProvider.dailyDealsModel,
                                              searchProvider),
                                        ),
                                      )),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height * 0.15,
                                  //   child: ListView(
                                  //     padding: const EdgeInsets.symmetric(
                                  //         horizontal: 10, vertical: 0),
                                  //     scrollDirection: Axis.horizontal,
                                  //     children: List.generate(3, (index) {
                                  //       return dailyDealCard();
                                  //     }),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/topDeal.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  homeProvider.modelBanners.data!
                                      .topDealProduct!.title!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Platform.isAndroid
                                              ? size_16
                                              : size_18),
                                )),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.62,
                                ),
                                itemCount: homeProvider.modelBanners.data!
                                            .topDealProduct!.products!.length >
                                        6
                                    ? 6
                                    : homeProvider.modelBanners.data!
                                        .topDealProduct!.products!.length,
                                itemBuilder: (context, j) {
                                  return topDealCard(
                                      context,
                                      homeProvider.modelBanners.data!
                                          .topDealProduct!.products![j]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      spaceOfHeight(),
                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Images
                                      .homeBG), // Replace with your image path
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.refer,
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                            homeProvider.modelBanners.data!
                                                .giftSection!.giftTitle!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: colors.textColor,
                                                    fontSize: Platform.isAndroid
                                                        ? size_18
                                                        : size_20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  spaceOfHeight(),
                                  // spaceOfHeight(),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0;
                                            i <
                                                homeProvider
                                                    .modelBanners
                                                    .data!
                                                    .giftSection!
                                                    .products!
                                                    .length;
                                            i++)
                                          Row(
                                            children: [
                                              InkWell(
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                onTap: () {
                                                  Routes
                                                      .navigateToProductDetailPageScreen(
                                                          context,
                                                          homeProvider
                                                              .modelBanners
                                                              .data!
                                                              .giftSection!
                                                              .products![i]
                                                              .slug!);
                                                },
                                                child: CachedNetworkImage(
                                                  imageUrl: homeProvider
                                                      .modelBanners
                                                      .data!
                                                      .giftSection!
                                                      .products![i]
                                                      .thumbnail!,
                                                  fit: BoxFit.fill,
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(Images
                                                          .defaultProductImg),
                                                  height: 110,
                                                  width: 100,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      isWidgetVisible ? Container() : spaceOfHeight(),
                      isWidgetVisible ? Container() : productForUText(context),
                      isWidgetVisible ? Container() : spaceOfHeight(height: 20),
                      //Product for you section

                      isWidgetVisible
                          ? Container()
                          : FilterBar(
                              homeProvider: homeProvider,
                              searchProvider: searchProvider,
                              categoryProvider: categoryProvider),
                      VisibilityDetector(
                        key: Key("unique key"),
                        onVisibilityChanged: (VisibilityInfo info) {
                          isWidgetVisible = info.visibleFraction > 0.15;
                          debugPrint(
                              "${info.visibleFraction} of my widget is visible");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          height: MediaQuery.of(context).size.height *
                              0.33 *
                              searchProvider.searchResults.length /
                              1.8,
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.66,
                            ),
                            itemCount: searchProvider.searchResults.length,
                            itemBuilder: (context, j) {
                              return productForYouCard(
                                  searchProvider.searchResults[j],
                                  context,
                                  homeProvider);
                            },
                          ),
                        ),
                      ),
                      spaceOfHeight(),
                      Text(
                        "Alpha Product: All rights reserved",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: colors.textColor),
                      ),
                      spaceOfHeight(),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    required this.homeProvider,
    required this.searchProvider,
    required this.categoryProvider,
  });

  final HomeViewModel homeProvider;
  final SearchViewModel searchProvider;
  final CategoryViewModel categoryProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.33,
          color: Theme.of(context).brightness == Brightness.dark
              ? colors.midBorder
              : Color(0xFFE3E1EC),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              homeFilter(
                  context, homeProvider.filterModel, searchProvider, true);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.filter,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('Filter',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ))
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.34,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? colors.midBorder
                : Color(0xFFE3E1EC),
            border: Border(
              left: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? colors.midBorder
                    : Colors.grey.shade400,
              ),
            ),
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              homeCategory(context, categoryProvider, searchProvider, true);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.categoryWhite,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('Category',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        )
                    //   style: Theme.of(context)
                    // .textTheme
                    // .titleSmall!
                    // .copyWith(

                    //       color: Theme.of(context).brightness == Brightness.dark
                    //           ? Colors.white
                    //           : Colors.black,
                    //       Platform.isAndroid ? size_14 : size_16),
                    )
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.33,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? colors.midBorder
                : Color(0xFFE3E1EC),
            border: Border(
              left: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? colors.midBorder
                    : Colors.grey.shade400,
              ),
            ),
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              homeSort(context, searchProvider);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.sort,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('Sort',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
