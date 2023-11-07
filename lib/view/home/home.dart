import 'package:alpha_ecommerce_18oct/view/home/brandsCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/categoryCardTop.dart';
import 'package:alpha_ecommerce_18oct/view/home/homeTexts&Spaces.dart';
import 'package:alpha_ecommerce_18oct/view/home/productQualityCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/productsForYouCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/savedCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/secondCategory.dart';
import 'package:alpha_ecommerce_18oct/view/home/specialOfferCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/topDealCard.dart';
import 'package:alpha_ecommerce_18oct/view/home/wishlistCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/categoryShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/filterShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/sortShuffle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';
import 'dailyDealsCard.dart';

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
              Container(
                height: 50,
                color: colors.homeContainer1BG,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) {
                    return categoryCardTop();
                  }),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
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
                    spaceOfHeight(height: 20),
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
                    spaceOfHeight(height: 20),
                    productForUText(),
                    spaceOfHeight(height: 20),
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
                          horizontal: 10, vertical: 20),
                      height: MediaQuery.of(context).size.height * 0.34,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, j) {
                          return productForYouCard(context);
                        },
                      ),
                    ),
                    spaceOfHeight(),
                    spaceOfHeight(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.28,
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
                                  return wishlistCard(context);
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(3, (index) {
                                return dailyDealCard();
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
                                childAspectRatio: 0.6,
                              ),
                              itemCount: 6,
                              itemBuilder: (context, j) {
                                return topDealCard(context);
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
                                        child: const Text(
                                          "LET THEM PICK THE PERFECT GIFT",
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
                    spaceOfHeight(),
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
                                  return savedCard(context);
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
