import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../widget_common/toast_message.dart';
import '../profile/common_header.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double rating = 4;

  final List<String> imageList = [
    Images.powder,
    Images.powder,
    Images.powder,
    Images.powder,
  ];
  int _currentIndex = 0;

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
                children: const [
                  ProfileHeader(),
                  InternalDetailPageHeader(
                    text: 'Oats Fitness',
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colors.boxGradient1.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          height: 250,
                          child: Column(
                            children: [
                              CarouselSlider(
                                items: imageList.map((item) {
                                  return SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: Image.asset(
                                      item,
                                    ),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    imageList.asMap().entries.map((entry) {
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
                                            : Colors.grey,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "25% Off",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  FontAwesomeIcons.share,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.heart,
                                  size: 18,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Oats Fitness",
                              style: TextStyle(
                                  color: colors.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.3",
                                  style: TextStyle(
                                    color: colors.textColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: const [
                            Text(
                              "\$200",
                              style: TextStyle(
                                color: colors.lightTextColor,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "\$120.00",
                              style: TextStyle(
                                color: colors.buttonColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          children: [
                            for (int i = 0; i < 3; i++)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0x14E9E9E9),
                                        width: 2)),
                                child: const Text(
                                  "250gm",
                                  style: TextStyle(
                                      color: colors.textColor, fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0x14E9E9E9),
                                      width: 2)),
                              child: const Text(
                                "Save for later",
                                style: TextStyle(
                                    color: colors.textColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showAlertDialog(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0x14E9E9E9),
                                        width: 2)),
                                child: const Text(
                                  "View 360",
                                  style: TextStyle(
                                      color: colors.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: colors.textColor,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Description",
                              style: TextStyle(
                                  color: colors.textColor, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
                              style: TextStyle(
                                  color: colors.textColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Use pincode to check delivery info",
                              style: TextStyle(color: colors.textColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: colors.textFieldBG,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 15),
                                        hintText: 'Enter pincode',
                                        hintStyle: const TextStyle(
                                            color: colors.textColor,
                                            fontSize: 12),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: colors.textFieldColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: colors.textFieldColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: CommonButton(
                                        text: "Submit",
                                        fontSize: 14,
                                        onClick: () {})),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              colors: [
                                colors.boxGradient1.withOpacity(0.4),
                                colors.boxBorder.withOpacity(0.4),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(color: colors.boxBorder)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 200,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.powder,
                                        height: 120,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Oats Fitness",
                                        style: TextStyle(
                                            color: colors.textColor,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: const [
                                          Text(
                                            "\$200",
                                            style: TextStyle(
                                              color: colors.lightTextColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "\$120.00",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "4.3",
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            border: Border.all(
                                                color: colors.textColor)),
                                        child: const Text(
                                          "ADD",
                                          style: TextStyle(
                                              color: colors.textColor,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color(0x14E9E9E9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.freeDelivery,
                                    height: 50,
                                    width: 50,
                                  ),
                                  const Text(
                                    "Free Delivery",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: colors.textColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.nonRefundable,
                                    height: 50,
                                    width: 50,
                                  ),
                                  const Text(
                                    "Non-\nRefundable",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: colors.textColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.topBrand,
                                    height: 50,
                                    width: 50,
                                  ),
                                  const Text(
                                    "Top Brand",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.warranty,
                                    height: 50,
                                    width: 50,
                                  ),
                                  const Text(
                                    "Pay on Delivery",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0x14E9E9E9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Specification",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "190 MI",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Made IN",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "India",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Warranty",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "1 year",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Guarantee",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "1 year",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Refundable",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "1 Days",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Warranty",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "1 year",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Cancellable",
                                  style: TextStyle(
                                      color: colors.greyText, fontSize: 12),
                                ),
                                Text(
                                  "Till received",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0x14E9E9E9),
                            )),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(Images.vendor),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Best Mart",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4.3",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Rating",
                                          style: TextStyle(
                                              color: colors.lightTextColor),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              "167",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Followers",
                                          style: TextStyle(
                                              color: colors.lightTextColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  Images.arrow,
                                  width: 30,
                                  height: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "Recommended Product",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 230,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    gradient: const LinearGradient(
                                      colors: [
                                        colors.boxGradient1,
                                        colors.boxBorder,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    border:
                                        Border.all(color: colors.boxBorder)),
                                width: MediaQuery.of(context).size.width * 0.42,
                                height: 200,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          Images.powder,
                                          height: 120,
                                        ),
                                      ),
                                      const Text(
                                        "25% Off",
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 12),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Oats Fitness",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: const [
                                          Text(
                                            "\$200",
                                            style: TextStyle(
                                              color: colors.lightTextColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "\$120.00",
                                            style: TextStyle(
                                              color: colors.buttonColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Review",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(Images.profile),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Customer Name",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    RatingBar.builder(
                                      initialRating: rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemSize: 15,
                                      itemPadding:
                                          const EdgeInsets.only(right: 5),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (newRating) {
                                        setState(() {
                                          rating = newRating;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.white,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(Images.profile),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Customer Name",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    RatingBar.builder(
                                      initialRating: rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemSize: 15,
                                      itemPadding:
                                          const EdgeInsets.only(right: 5),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      onRatingUpdate: (newRating) {
                                        setState(() {
                                          rating = newRating;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
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
                  height: 80,
                  color: colors.textFieldBG,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.pressed)) {
                                    return colors.buttonColor;
                                  }
                                  return Colors.transparent; // Default color
                                }),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: Colors.white, width: 1)),
                              ),
                              onPressed: () {
                                showToastMessage("Removed from Cart");
                              },
                              child: const Text(
                                'REMOVE FROM CART',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered) ||
                                      states.contains(MaterialState.pressed)) {
                                    return colors.buttonColor;
                                  }
                                  return colors.buttonColor;
                                }),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Routes.navigateToPlaceOrderScreen(context);
                              },
                              child: const Text(
                                'BUY NOW',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Future<void> showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: colors.overlayBG,
              ),
              height: 300,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Routes.navigateToPreviousScreen(context);
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.cancel_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    Images.powder,
                    fit: BoxFit.cover,
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
