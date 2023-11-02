import 'package:alpha_ecommerce_18oct/helper/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../../widgets/commonBackground.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  CarouselController carouselController = CarouselController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  List<String> list = [
    'Discover New Local Product',
    'Discover New Local Product',
    'Enjoy Wide Range of Products'
  ];
  List<String> imageList = [
    Images.onBoarding1,
    Images.onBoarding2,
    Images.onBoarding3
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const CommonBackgroundPatternAuthWidget(),
      const CommonBackgroundAuthWidget(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: body(),
      )
    ]);
  }

  Widget body() {
    return Column(
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
    );
  }

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
        return CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height,
              onPageChanged: (index, value) {
                currentIndex.value = index;
              }),
          items: list.map((item) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              color: Colors.transparent,
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
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 20,
                            color: colors.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: const Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting',
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
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
                        margin:  const EdgeInsets.symmetric(
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
      onTap: () {
        if (currentIndex.value == 2) {
          Routes.navigateToLanguageScreen(context);
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
