import 'package:alpha_ecommerce_18oct/view/home/brandsCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/categoryCardTop.dart';
import 'package:alpha_ecommerce_18oct/view/home/homeTexts&Spaces.dart';
import 'package:alpha_ecommerce_18oct/view/home/productQualityCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/secondCategory.dart';
import 'package:alpha_ecommerce_18oct/view/home/specialOfferCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/categoryShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/filterShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/sortShuffle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
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
  final List<String> imageList = [
    Images.homeSale,
    Images.homeSale,
    Images.homeSale,
    Images.homeSale,
  ];
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Routes.navigateToChatScreen(context);
              },
              backgroundColor: colors.buttonColor,
              child: Image.asset(Images.chat)),
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  DashboardHeader(),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: colors.homeContainer1BG,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(5, (index) {
                          return categoryCardTop();
                        }),
                      ),
                    ),
                    Container(
                      height: 140,
                      color: colors.textColor,
                      alignment: Alignment.center,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) {
                          return secondCategoryCard();
                        }),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: CarouselSlider(
                            items: imageList.map((item) {
                              return SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.fill,
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
                          children: imageList.asMap().entries.map((entry) {
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
                    spaceOf10Height(),
                    Container(
                      color: colors.textColor,
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) {
                          return brandCard();
                        }),
                      ),
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
                        child: productQualityCard()),
                    spaceOf10Height(),
                    productForUText(),
                    spaceOf10Height(),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.33,
                          color: colors.midBorder,
                          child: InkWell(
                            onTap: () {
                              homeFilter(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_list_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
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
                              homeCategory(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_list_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
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
                              homeSort(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_list_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, j) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Routes.navigateToProductDetailPageScreen(
                                      context);
                                },
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      gradient: LinearGradient(
                                        colors: [
                                          colors.boxGradient1.withOpacity(1),
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      border:
                                          Border.all(color: colors.boxBorder)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        Images.onBoarding2,
                                        width: 80,
                                        height: 80,
                                      ),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '35% Off',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 12,
                                              ),
                                            ),
                                            LikeButton(
                                              size: 20,
                                              circleColor: const CircleColor(
                                                  start: Colors.red,
                                                  end: Colors.red),
                                              bubblesColor: const BubblesColor(
                                                dotPrimaryColor: Colors.red,
                                                dotSecondaryColor: Colors.red,
                                              ),
                                              likeBuilder: (bool isLiked) {
                                                return Icon(
                                                  Icons.favorite,
                                                  color: isLiked
                                                      ? Colors.pink
                                                      : Colors.grey,
                                                  size: 20,
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          'Dettol refresh longi...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Row(
                                          children: [
                                            const Text(
                                              '120.00',
                                              style: TextStyle(
                                                color: Colors.cyan,
                                                fontSize: 12,
                                              ),
                                            ),
                                            spaceOf10Height(),
                                            const Text(
                                              "\$200",
                                              style: TextStyle(
                                                color: colors.lightTextColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              spaceOf10Height(),
                            ],
                          );
                        },
                      ),
                    ),
                    spaceOf10Height(),
                    spaceOf10Height(),
                    Container(
                      height: 250,
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
                                padding: EdgeInsets.symmetric(horizontal: 15),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(3, (index) {
                                return specialOfferCard(context);
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 270,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your wishlist items",
                                    style: TextStyle(color: colors.textColor),
                                  ),
                                  Text(
                                    "VIEW ALL",
                                    style: TextStyle(color: colors.buttonColor),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(10, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Routes
                                                .navigateToProductDetailPageScreen(
                                                    context);
                                          },
                                          child: Container(
                                            height: 200,
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    colors.boxGradient1
                                                        .withOpacity(1),
                                                    Colors.transparent,
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                border: Border.all(
                                                    color: colors.boxBorder)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  Images.onBoarding2,
                                                  width: 80,
                                                  height: 80,
                                                ),
                                                const SizedBox(height: 8),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Text(
                                                    '35% Off',
                                                    style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Text(
                                                    'Dettol refresh longi...',
                                                    style: TextStyle(
                                                      color: colors.textColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '120.00',
                                                        style: TextStyle(
                                                          color: Colors.cyan,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "\$200",
                                                        style: TextStyle(
                                                          color: colors
                                                              .lightTextColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 170,
                      child: Image.asset(
                        Images.summerSale,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 85,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors.homeBG.withOpacity(1),
                            colors.homeBGGradiant.withOpacity(1),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Image.asset(Images.starDeal),
                              )),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Prime Time Deals",
                              style: TextStyle(
                                  color: colors.homePrimeDeals,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, bottom: 10),
                                child: Image.asset(Images.starDeal),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
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
                          spaceOf10Height(),
                          spaceOf10Height(),
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
                          spaceOf10Height(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(3, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Image.asset(
                                    Images.bestOffer,
                                    height: 130,
                                    width: 130,
                                  ),
                                );
                              }),
                            ),
                          ),
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
                              child: const Text(
                                "Top Deals of electronic appliances",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15,
                                childAspectRatio: 0.55,
                              ),
                              itemCount: 6,
                              itemBuilder: (context, j) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Routes
                                            .navigateToProductDetailPageScreen(
                                                context);
                                      },
                                      child: SizedBox(
                                        height: 160,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    topLeft:
                                                        Radius.circular(10)),
                                              ),
                                              width: double.infinity,
                                              child: Image.asset(
                                                Images.onBoarding2,
                                                width: 70,
                                                height: 70,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                  color: colors.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        'Electric Stove',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        '\$699',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    spaceOf10Height(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    spaceOf10Height(),
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
                            height: MediaQuery.of(context).size.height * 0.35,
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
                                        child: const Text(
                                          "LET THEM PICK THE PERFECT GIFT",
                                          style: TextStyle(
                                              color: colors.textColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                spaceOf10Height(),
                                spaceOf10Height(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.book1,
                                      height: 120,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      Images.book2,
                                      height: 120,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      Images.book3,
                                      height: 120,
                                      width: 100,
                                    )
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                    spaceOf10Height(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "View your cart Items",
                                    style: TextStyle(color: colors.textColor),
                                  ),
                                  Text(
                                    "VIEW ALL",
                                    style: TextStyle(color: colors.buttonColor),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(10, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Routes
                                                .navigateToProductDetailPageScreen(
                                                    context);
                                          },
                                          child: Container(
                                            height: 200,
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    colors.boxGradient1
                                                        .withOpacity(1),
                                                    Colors.transparent,
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                border: Border.all(
                                                    color: colors.boxBorder)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  Images.onBoarding2,
                                                  width: 80,
                                                  height: 80,
                                                ),
                                                const SizedBox(height: 8),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Text(
                                                    '35% Off',
                                                    style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Text(
                                                    'Dettol refresh longi...',
                                                    style: TextStyle(
                                                      color: colors.textColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        '120.00',
                                                        style: TextStyle(
                                                          color: Colors.cyan,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "\$200",
                                                        style: TextStyle(
                                                          color: colors
                                                              .lightTextColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const Text(
                              "Alpha Product: All rights reserved",
                              style: TextStyle(color: colors.textColor),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
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
