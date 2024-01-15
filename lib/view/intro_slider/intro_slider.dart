import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/viewModel/languageViewModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  CarouselController carouselController = CarouselController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  List<String> list = [
    'Welcome to Alpha E-commerce: Your ultimate shopping destination for all things stylish and affordable!',
    'Explore endless possibilities with Alpha E-commerce: Where convenience meets quality shopping experiences.',
    'Start your journey with Alpha E-commerce: Where every purchase brings you closer to satisfaction and style'
  ];
  List<String> imageList = [
    Images.onBoarding1,
    Images.onBoarding2,
    Images.onBoarding3
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : Colors.white,
      body: Stack(
        children: [
          Theme.of(context).brightness == Brightness.dark
              ? CommonBackgroundAuthWidget()
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(child: carouselSliderBuilder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [carouselSliderIndicator(), skipAndStartButton()],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Stack(children: [
  //     const CommonBackgroundPatternAuthWidget(),
  //     const CommonBackgroundAuthWidget(),
  //     Scaffold(
  //       resizeToAvoidBottomInset: false,
  //       key: _scaffoldKey,
  //       extendBody: true,
  //       backgroundColor: Theme.of(context).brightness == Brightness.dark
  //           ? Colors.transparent
  //           : Colors.transparent,
  //       body: body(),
  //     )
  //   ]);
  // }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget carouselSliderBuilder() {
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(Images.lightIntroImage))),
          child: CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                animateToClosest: false,
                height: MediaQuery.of(context).size.height,
                onPageChanged: (index, value) {
                  currentIndex.value = index;
                }),
            items: list.map((item) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(
                        imageList[currentIndex.value],
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width * 1,
                        child: Text(
                          item,
                          textAlign: TextAlign.center,
                          textScaler: Platform.isAndroid
                              ? TextScaler.linear(0.8)
                              : TextScaler.linear(1),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize:
                                      Platform.isAndroid ? size_18 : size_20,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colors.textColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20),
                    //     width: MediaQuery.of(context).size.width * 0.75,
                    //     child: Text(
                    //       'Lorem Ipsum is simply dummy text of the printing and typesetting',
                    //       style: Theme.of(context)
                    // .textTheme
                    // .titleSmall!
                    // .copyWith(

                    //         fontSize: Platform.isAndroid ? size_12 : size_14,
                    //         color:
                    //             Theme.of(context).brightness == Brightness.dark
                    //                 ? colors.textColor
                    //                 : Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Builder carouselSliderIndicator() {
    return Builder(builder: (context) {
      return ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width / 2.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: map<Widget>(list, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex.value == index
                              ? colors.lightButton
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          });
    });
  }

  Widget skipAndStartButton() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (currentIndex.value == 2) {
          //Routes.navigateToLanguageScreen(context);
          Routes.navigateToSignInScreen(context);
        } else {
          carouselController.nextPage();
        }
      },
      child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              color: colors.buttonColor, shape: BoxShape.circle),
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: colors.textColor,
          )),
    );
  }
}
