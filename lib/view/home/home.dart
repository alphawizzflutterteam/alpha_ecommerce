import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
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
import 'package:alpha_ecommerce_18oct/view/widget_common/sortShuffle.dart';
import 'package:alpha_ecommerce_18oct/viewModel/categoryViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    categoryProvider = Provider.of<CategoryViewModel>(context, listen: false);
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);
    homeProvider.getBrandsList(context);
    homeProvider.getSpecialOffersList(context);
    homeProvider.getDailyDealsList(context);
    homeProvider.getCategoriesList(context);
    homeProvider.getBannersList(context);
    homeProvider.getWishlistItem(context);
    homeProvider.getCartListItem(context);
    homeProvider.getProductFilters(context);
    homeProvider.getHomeBanners(context);
    homeProvider.getChatlist(context);

    getCategory();
    searchProvider.clearFilters();
    searchProvider.getProductsListNew(context, "25", "1");
    _scrollController.addListener(() {
      setState(() {
        // homeProvider.isScrolled = _scrollController.offset > 0;

        homeProvider.setScrolling(
            _scrollController.position.userScrollDirection ==
                ScrollDirection.forward);
      });
    });
  }

  Future<void> getCategory() async {
    await categoryProvider.getCategories(context);
    //listItem = categoryProvider.data[0].childes!;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);
    categoryProvider = Provider.of<CategoryViewModel>(context);
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
                  : Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.33,
                          color: colors.midBorder,
                          child: InkWell(
                            onTap: () {
                              homeFilter(context, homeProvider.filterModel,
                                  searchProvider, true);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.filter,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.34,
                          decoration: const BoxDecoration(
                            color: colors.midBorder,
                            border: Border(
                              left: BorderSide(
                                color: colors.midBorder,
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              homeCategory(context, categoryProvider,
                                  searchProvider, true);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.categoryWhite,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Category',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: const BoxDecoration(
                            color: colors.midBorder,
                            border: Border(
                              left: BorderSide(
                                color: colors.midBorder,
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              homeSort(context, searchProvider);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.sort,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Sort',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

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
                                      onTap: () {
                                        Routes.navigateToBottomNavScreen(
                                            context, 1);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.0, left: 12, right: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.black,
                                              size: size_30,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4.0, bottom: 8),
                                              child: Text(
                                                "View All",
                                                style: TextStyle(
                                                    color: colors.darkColor2,
                                                    fontSize: size_12,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                    searchProvider),
                              ),
                            ],
                          )),
                    ),

                    Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: CarouselSlider(
                            items: homeProvider.imageList.map((item) {
                              return InkWell(
                                onTap: () {
                                  searchProvider.clearFilters();

                                  for (int i = 0;
                                      i < homeProvider.bannersListTop.length;
                                      i++) {
                                    if (homeProvider.bannersListTop[i].photo ==
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
                                    placeholder: (context, url) => appLoader(),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
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
                    spaceOfHeight(height: 20),

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
                                      onTap: () {
                                        Routes.navigateToBrandsScreen(
                                            context,
                                            homeProvider.brandsModel,
                                            searchProvider);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.0, left: 12, right: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.black,
                                              size: size_30,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4.0, bottom: 8),
                                              child: Text(
                                                "View All",
                                                style: TextStyle(
                                                    color: colors.darkColor2,
                                                    fontSize: size_12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
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
                                  child: brandsCard(context,
                                      homeProvider.brandsModel, searchProvider),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                        height: 100,
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
                        child: productQualityCard(homeProvider.modelBanners)),
                    spaceOfHeight(height: 20),

                    homeProvider.cartModel.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 300,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Routes.navigateToCartScreen(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "View your cart Items",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? colors.textColor
                                                    : Colors.black),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Routes.navigateToBottomNavScreen(
                                                  context, 0);
                                            },
                                            child: const Text(
                                              "VIEW ALL",
                                              style: TextStyle(
                                                  color: colors.buttonColor),
                                            ),
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
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
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
                            height: MediaQuery.of(context).size.height * 0.28,
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
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        "Special Offer",
                                        style: TextStyle(
                                            color: colors.textColor,
                                            fontSize: 20,
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.textColor
                                                  : Colors.black),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Routes.navigateToWishlistScreen(
                                                context);
                                          },
                                          child: Row(
                                            children: [
                                              const Text(
                                                "VIEW ALL",
                                                style: TextStyle(
                                                    color: colors.buttonColor),
                                              ),
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
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
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
                        : SizedBox(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              homeProvider.banner1 ?? "",
                              fit: BoxFit.cover,
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
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              homeProvider.banner2 ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors.homeGradient3.withOpacity(0.7),
                            colors.homeGradient4.withOpacity(0.4),
                            colors.homeGradient3.withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          spaceOfHeight(),
                          spaceOfHeight(),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Daily Deals",
                                  style: TextStyle(
                                      color: colors.textColor,
                                      fontSize: 20,
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
                          spaceOfHeight(),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
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
                                homeProvider
                                    .modelBanners.data!.topDealProduct!.title!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.55,
                              ),
                              itemCount: 6,
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
                            height: MediaQuery.of(context).size.height * 0.40,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.refer,
                                      height: 120,
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
                                          style: TextStyle(
                                              color: colors.textColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                spaceOfHeight(),
                                spaceOfHeight(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            homeProvider.modelBanners.data!
                                                .giftSection!.products!.length;
                                        i++)
                                      Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: homeProvider
                                                .modelBanners
                                                .data!
                                                .giftSection!
                                                .products![i]
                                                .thumbnail!,
                                            height: 120,
                                            width: 100,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                  ],
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
                        : Row(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.33,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.midBorder
                                    : Color(0xFFE3E1EC),
                                child: InkWell(
                                  onTap: () {
                                    homeFilter(
                                        context,
                                        homeProvider.filterModel,
                                        searchProvider,
                                        true);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.filter,
                                        height: 20,
                                        width: 20,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Filter',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.34,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.midBorder
                                      : Color(0xFFE3E1EC),
                                  border: Border(
                                    left: BorderSide(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.midBorder
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    homeCategory(context, categoryProvider,
                                        searchProvider, true);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.categoryWhite,
                                        height: 20,
                                        width: 20,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Category',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.33,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.midBorder
                                      : Color(0xFFE3E1EC),
                                  border: Border(
                                    left: BorderSide(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colors.midBorder
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    homeSort(context, searchProvider);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.sort,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Sort',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                    VisibilityDetector(
                      key: Key("unique key"),
                      onVisibilityChanged: (VisibilityInfo info) {
                        isWidgetVisible = info.visibleFraction > 0.182;
                        debugPrint(
                            "${info.visibleFraction} of my widget is visible");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        height: MediaQuery.of(context).size.height *
                            0.35 *
                            searchProvider.searchResults.length /
                            2,
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
                    const Text(
                      "Alpha Product: All rights reserved",
                      style: TextStyle(color: colors.textColor),
                    ),
                    spaceOfHeight(),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
