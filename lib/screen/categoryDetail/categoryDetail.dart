import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../helper/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/filterShuffle.dart';
import '../widget_common/sortShuffle.dart';
import '../profile/common_header.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
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
          body: Column(
            children: [
              Stack(
                children: [
                  const ProfileHeader(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.only(top: 35),
                      height: 110,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7),
                            child: InkWell(
                              onTap: () {
                                Routes.navigateToPreviousScreen(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 25,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              child: InkWell(
                                onTap: () {
                                  Routes.navigateToPaymentScreen(context);
                                },
                                child: const Text(
                                  "Tea & Coffee",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7),
                            child: Icon(
                              Icons.shopping_cart_sharp,
                              size: 25,
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            for (int i = 0; i < 10; i++)
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
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: colors.textFieldBG,
                    image: DecorationImage(
                      image: AssetImage(Images.bgTab),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: InkWell(
                            onTap: () {
                              homeFilter(context);
                            },
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
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
