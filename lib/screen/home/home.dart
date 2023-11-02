import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../helper/routes.dart';
import '../../widgets/commonBackground.dart';
import '../../widgets/common_header.dart';
import '../profile/common_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageList = [
    'assets/images/sale.png',
    'assets/images/sale.png',
    'assets/images/sale.png',
    'assets/images/sale.png',
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
              child: Image.asset("assets/icons/chat.png")),
          body: Column(
            children: [
              Stack(
                children: const [
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
                      color: const Color(0xFF123C3F),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: const [
                                Icon(Icons.category),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Categories",
                                  style: TextStyle(color: colors.textColor),
                                ),
                              ],
                            ),
                          );
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
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/temporaryImages/phone.png",
                                      height: 70,
                                      width: 70,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Categories",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
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
                                      : const Color(0xFF113C41),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: colors.textColor,
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(10, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/temporaryImages/puma.png",
                              height: 70,
                              width: 70,
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFFDC98).withOpacity(1),
                            const Color(0xFFFFDC98).withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/product.png",
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const SizedBox(
                                    width: 50,
                                    child: Text(
                                      "100% Original Product",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Product for you",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.33,
                          color: const Color(0xFF414141),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
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
                            color: Color(0xFF414141),
                            border: Border(
                              left: BorderSide(
                                color: Color(0xFF444647),
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
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
                            color: Color(0xFF414141),
                            border: Border(
                              left: BorderSide(
                                color: Color(0xFF444647),
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 0.3,
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
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
                                            const Color(0xFF4E5255)
                                                .withOpacity(1),
                                            Colors.transparent,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        border: Border.all(
                                            color: const Color(0xFF414141))),
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
                                                bubblesColor:
                                                    const BubblesColor(
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
                                                  color: colors.lightTextColor,
                                                  decoration: TextDecoration
                                                      .lineThrough,
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
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF007F78).withOpacity(1),
                            const Color(0xFF006B65).withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Divider(
                                height: 1,
                                color: Color(0xFFFF9934),
                                thickness: 3,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Text("Special Offer"),
                              Divider(
                                height: 1,
                                color: Color(0xFFFF9934),
                                thickness: 3,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(3, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/priceBg.png",
                                        height: 130,
                                        width: 130,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: MediaQuery.of(context).size.width*0.25,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: colors.textColor,
                                            onPrimary: colors.buttonColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          child: const Text('Shop now',
                                              style: TextStyle(fontSize: 12)),
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
                    // Column(
                    //   children: [
                    //     Container(
                    //         decoration: const BoxDecoration(
                    //           image: DecorationImage(
                    //             image: AssetImage(
                    //                 'assets/images/home_bg.png'), // Replace with your image path
                    //             fit: BoxFit.cover, // Adjust the fit as needed
                    //           ),
                    //         ),
                    //         width: MediaQuery.of(context).size.width,
                    //         height: MediaQuery.of(context).size.height * 0.35,
                    //         child: Column(
                    //           children: [
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Image.asset(
                    //                   "assets/images/refer.png",
                    //                   height: 120,
                    //                   width: 100,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 30,
                    //                 ),
                    //                 SizedBox(
                    //                     width:
                    //                         MediaQuery.of(context).size.width *
                    //                             0.5,
                    //                     child: const Text(
                    //                       "LET THEM PICK THE PERFECT GIFT",
                    //                       style: TextStyle(
                    //                           color: colors.textColor,
                    //                           fontSize: 25,
                    //                           fontWeight: FontWeight.bold),
                    //                     ))
                    //               ],
                    //             ),
                    //             const SizedBox(
                    //               height: 20,
                    //             ),
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Image.asset(
                    //                   "assets/images/temporaryImages/book1.png",
                    //                   height: 120,
                    //                   width: 100,
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 10,
                    //                 ),
                    //                 Image.asset(
                    //                   "assets/images/temporaryImages/book2.png",
                    //                   height: 120,
                    //                   width: 100,
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 10,
                    //                 ),
                    //                 Image.asset(
                    //                   "assets/images/temporaryImages/book3.png",
                    //                   height: 120,
                    //                   width: 100,
                    //                 )
                    //               ],
                    //             )
                    //           ],
                    //         )),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
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
                                                    const Color(0xFF4E5255)
                                                        .withOpacity(1),
                                                    Colors.transparent,
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFF414141))),
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
