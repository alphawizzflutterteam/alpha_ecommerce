import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/app_utils.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/model/productDetailModel.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/productRatingAndFollowers.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/recommendedProductCard.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/reviewCard.dart';
import 'package:alpha_ecommerce_18oct/view/productDetail/specificationCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/productViewModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../widget_common/toast_message.dart';
import '../profile/common_header.dart';
import 'freeDeliveryCard.dart';

class ProductDetailPage extends StatefulWidget {
  final String slug;
  const ProductDetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double rating = 4;
  List<String> imageList = [];
  List<Variation> variationList = [];
  var selectedPrice = "";
  var selectedProduct = "";
  var selectedVariation = "";

  late ProductDetailViewModel productModel;
  @override
  void initState() {
    super.initState();
    productModel = Provider.of<ProductDetailViewModel>(context, listen: false);
    productModel.getDetails(context, "", widget.slug);

    imageList = productModel.model.first.images;
    selectedPrice = productModel.model.first.specialPrice;
    variationList = productModel.model.first.variation;
  }

  int _currentIndex = 0;

  void checkSelectedProductAndUpdateProductRate(String selectedVariation) {
    var text = selectedVariation.replaceAll(RegExp(r"\s+\b|\b\s"), "");
    print(text.toLowerCase());
    for (int i = 0; i < variationList.length; i++) {
      if (variationList[i].type.toLowerCase().contains(text.toLowerCase())) {
        print(variationList[i].type.toLowerCase());
        selectedProduct = variationList[i].type;
        print(variationList[i].price);
        selectedPrice = variationList[i].price;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    productModel = Provider.of<ProductDetailViewModel>(context);

    //  print(productModel.model.first.slug.toString());
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
          body: Column(
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : colors.buttonColor,
                child: const Stack(
                  children: [
                    ProfileHeader(),
                    InternalDetailPageHeader(
                      text: "Product Detail",
                    )
                  ],
                ),
              ),
              productModel.isLoading
                  ? appLoader()
                  : Expanded(
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
                                height: MediaQuery.of(context).size.height * .3,
                                child: Column(
                                  children: [
                                    CarouselSlider(
                                      items: imageList.map((item) {
                                        return SizedBox(
                                          height: 100,
                                          width: double.infinity,
                                          child: Image.network(
                                            item,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error,
                                                    stackTrace) =>
                                                Image.asset(
                                                    Images.defaultProductImg),
                                          ),
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                        enableInfiniteScroll: false,
                                        autoPlay: true,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: imageList
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${productModel.model.first.discount} %",
                                    style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  LikeButton(
                                    // onTap: (isLiked) {
                                    //   var isLoggedIn = SharedPref.shared.pref
                                    //       ?.getString(PrefKeys.isLoggedIn);

                                    //   if (isLoggedIn == "1") {
                                    //     Map data = {
                                    //       'product_id': productModel.model.first.id.toString()
                                    //     };
                                    //     if (isLiked) {
                                    //       // return homeProvider.removeFromWishlist(
                                    //       //     data, context);
                                    //     } else {
                                    //       // return homeProvider.addToWishlist(
                                    //       //     data, context);
                                    //     }
                                    //   } else {
                                    //     return AppUtils.appUtilsInstance.nothing();
                                    //   }
                                    //    },
                                    size: size_20,
                                    isLiked:
                                        productModel.model.first.isFavorite,
                                    circleColor: const CircleColor(
                                        start: Colors.red, end: Colors.red),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor: Colors.red,
                                      dotSecondaryColor: Colors.red,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.favorite,
                                        color:
                                            isLiked ? Colors.pink : Colors.grey,
                                        size: 20,
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Text(
                                      productModel.model.first.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: size_16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Row(
                                    children: [
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedPrice,
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "or Pay \$${productModel.model.first.amount_after_coin_use} + ",
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.rupees,
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            productModel.model.first
                                                .use_coins_with_amount,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: size_15,
                            ),
                            SizedBox(
                              height: productModel
                                      .model.first.choiceOptions.length *
                                  (MediaQuery.of(context).size.height * .1),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: productModel
                                      .model.first.choiceOptions.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productModel.model.first
                                                .choiceOptions[i].title,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const AlwaysScrollableScrollPhysics(),
                                                  itemCount: productModel
                                                      .model
                                                      .first
                                                      .choiceOptions[i]
                                                      .options
                                                      .length,
                                                  itemBuilder: (context, j) {
                                                    return InkWell(
                                                      onTap: () {
                                                        selectedVariation =
                                                            productModel
                                                                .model
                                                                .first
                                                                .choiceOptions[
                                                                    i]
                                                                .options[j];
                                                        checkSelectedProductAndUpdateProductRate(
                                                            productModel
                                                                .model
                                                                .first
                                                                .choiceOptions[
                                                                    i]
                                                                .options[j]);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Theme.of(
                                                                              context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? Border.all(
                                                                      color: selectedVariation ==
                                                                              productModel.model.first.choiceOptions[i].options[
                                                                                  j]
                                                                          ? Colors
                                                                              .white
                                                                          : const Color(
                                                                              0x14E9E9E9),
                                                                      width: 2)
                                                                  : Border.all(
                                                                      color: selectedVariation ==
                                                                              productModel.model.first.choiceOptions[i].options[
                                                                                  j]
                                                                          ? colors
                                                                              .buttonColor
                                                                          : colors
                                                                              .lightBorder,
                                                                      width: 2),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child: Text(
                                                                productModel
                                                                    .model
                                                                    .first
                                                                    .choiceOptions[
                                                                        i]
                                                                    .options[j],
                                                                style: TextStyle(
                                                                    color: Theme.of(context).brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        size_12),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Map data = {
                                        'product_id': productModel
                                            .model.first.id
                                            .toString()
                                      };
                                      productModel.addToSaveLater(
                                          data, context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              width: 1)),
                                      child: Text(
                                        "Save for later",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showAlertDialog(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              width: 1)),
                                      child: Text(
                                        "View 360",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black54,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    productModel.model.first.metaDescription,
                                    style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colors.textColor
                                            : Colors.black,
                                        fontSize: 12),
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
                                  Text(
                                    "Use pincode to check delivery info",
                                    style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          child: TextField(
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                signed: true, decimal: false),
                                            controller:
                                                productModel.pinController,
                                            textAlign: TextAlign.start,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  6)
                                            ],
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? colors.textFieldBG
                                                  : Colors.white,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                              hintText: 'Enter pincode',
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
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
                                              onClick: () {
                                                if (productModel.pinController
                                                    .text.isEmpty) {
                                                  return Utils
                                                      .showFlushBarWithMessage(
                                                          "Alert",
                                                          "Please enter valid pincode",
                                                          context);
                                                }
                                                Map data = {
                                                  'pincode': productModel
                                                      .pinController.text
                                                };
                                                productModel.addToSaveLater(
                                                    data, context);
                                              })),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //  recommendedAccessoryCard(context: context),
                            deliveryCard(context: context),
                            specificationCard(
                                context: context,
                                productData: productModel.model.first),
                            productRatingAndFollowersCard(
                                productModel.model.first.shop, context),
                            productModel.relatedProducts.isEmpty
                                ? Container()
                                :  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      "Recommended Product",
                                      style: TextStyle(  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                          ? Colors.white
                                          : Colors.black,),
                                    ),
                                  ),
                            productModel.relatedProducts.isEmpty
                                ? Container()
                                : recommendedProductCard(
                                    context: context,
                                    model: productModel.relatedProducts),
                            productModel.model.first.rating.isEmpty
                                ? Container()
                                : reviewCard(
                                    rating: rating,
                                  )
                          ],
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * .08,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF040D12)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 20)
                    ],
                  ),
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
                                  return   Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.transparent
                                          : Colors.white; // Default color
                                }),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                    BorderSide(
                                        color:Theme.of(context).brightness==Brightness.dark?Colors.white:colors.lightBorder, width: 1)),
                              ),
                              onPressed: () {
                                showToastMessage("Removed from Cart");
                              },
                              child: Text(
                                productModel.model.first.isCart
                                    ? 'REMOVE FROM CART'
                                    : 'ADD TO CART',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                                style: TextStyle(fontSize: 12,color: Colors.white),
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
            contentPadding: EdgeInsets.zero,
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
