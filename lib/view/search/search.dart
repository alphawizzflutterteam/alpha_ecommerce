import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/theme.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/search/productsForYouCardSearch.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/categoryShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/filterShuffle.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/sortShuffle.dart';
import 'package:alpha_ecommerce_18oct/viewModel/categoryViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// import 'package:speech_to_text/speech_to_text.dart' as stt;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SearchViewModel searchProvider;
  late HomeViewModel homeProvider;
  late CategoryViewModel categoryProvider;
  late stt.SpeechToText _speech;
  bool isListening = false;
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    super.initState();
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    categoryProvider = Provider.of<CategoryViewModel>(context, listen: false);
    _speech = stt.SpeechToText();
    //searchProvider.clearFilters();
  }

  void _listen() async {
    if (!isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print('Status: $status');
          _speech.stop();
          isListening = !isListening;
          setState(() {});
        },
        onError: (error) {
          print('Error: $error');
          _speech.stop();
          isListening = !isListening;

          setState(() {});
        },
      );

      if (available) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Started Listening"),
        ));
        _speech.listen(
          listenFor: const Duration(seconds: 10),
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords;
              searchProvider.searchController.text = _text;
              searchProvider.getProductsListNew(context, "25", "1");
              print(_text);
              setState(() {});
            });
          },
        );
      }
    } else {
      _speech.stop();
      isListening = !isListening;
      setState(() {});
    }

    setState(() {
      isListening = !isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of<SearchViewModel>(context);
    homeProvider = Provider.of<HomeViewModel>(context);
    categoryProvider = Provider.of<CategoryViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      extendBody: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : Colors.white,
      body: Stack(
        children: [
          Theme.of(context).brightness == Brightness.dark
              ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: colors.darkBG,
                    child: Image.asset(
                      Images.bgGreenBottom,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : Container(
                  height: 0,
                ),
          Column(
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : colors.buttonColor,
                child: const Stack(
                  children: [
                    ProfileHeader(),
                    InternalDetailPageHeader(
                      text: "Search Product",
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            onChanged: (value) {
                              searchProvider.getProductsListNew(
                                context,
                                "25",
                                "1",
                              );
                            },
                            controller: searchProvider.searchController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              fillColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colors.textFieldBG
                                  : Colors.white,
                              filled: true,
                              hintText: 'Search',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black),
                              prefixIcon: Icon(Icons.search,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black),
                              suffixIcon: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  searchProvider.searchController.text = "";
                                  searchProvider.getProductsListNew(
                                    context,
                                    "25",
                                    "1",
                                  );
                                },
                                child: Icon(Icons.clear,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.textFieldColor, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.textFieldColor, width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.textFieldColor, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.textFieldColor, width: 1)),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                          ),
                        ),
                        // InkWell(
                        // highlightColor: Colors.transparent,
                        // splashColor: Colors.transparent,
                        //     onTap: () {
                        //       //accessCamera(context);
                        //     },
                        //     child: Image.asset(Images.camera,
                        //         height: 25,
                        //         width: 25,
                        //         color: Theme.of(context).brightness ==
                        //                 Brightness.dark
                        //             ? Colors.white
                        //             : Colors.black)),
                        // isListening
                        //     ? InkWell(
                        //         highlightColor: Colors.transparent,
                        //         splashColor: Colors.transparent,
                        //         onTap: () {
                        //           _speech.stop();
                        //           isListening = false;
                        //           setState(() {});
                        //         },
                        //         child: Image.asset(
                        //           "assets/images/microphone_gif.gif",
                        //           height: 25,
                        //           width: 25,
                        //         ),
                        //       )
                        //     : InkWell(
                        //         highlightColor: Colors.transparent,
                        //         splashColor: Colors.transparent,
                        //         onTap: () {
                        //           _listen();
                        //         },
                        //         child: Image.asset(Images.smallMic,
                        //             height: 25,
                        //             width: 25,
                        //             color: Theme.of(context).brightness ==
                        //                     Brightness.dark
                        //                 ? Colors.white
                        //                 : Colors.black),
                        //       )
                      ],
                    ),
                  ),
                  searchProvider.searchResults.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: size_50,
                            ),
                            Image.asset("assets/images/no-results.png",
                                height: size_80,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                            const SizedBox(
                              height: size_10,
                            ),
                            Text(
                              "No Result Found.",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black),
                            ),
                            const SizedBox(
                              height: size_5,
                            ),
                            Text(
                              "Try searching with some other keyword",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black),
                            )
                          ],
                        )
                      : Container(height: 0),
                  searchProvider.searchResults.isEmpty
                      ? Container()
                      : searchProvider.isLoading
                          ? appLoader()
                          : Container(
                              height: MediaQuery.of(context).size.height * .73,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              // height: MediaQuery.of(context).size.height * 0.73,
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                // physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.68,
                                ),
                                itemCount: searchProvider.searchResults.length,
                                itemBuilder: (context, j) {
                                  return productForYouCardSearch(
                                      searchProvider.searchResults[j],
                                      context,
                                      homeProvider,
                                      searchProvider);
                                },
                              ),
                            ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? colors.textFieldBG
                    : Colors.white,
                // image: DecorationImage(
                //   image: AssetImage(Images.bgTab),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Center(
                child: Material(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      homeFilter(context, homeProvider.filterModel,
                          searchProvider, false);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.33,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? colors.midBorder
                              : colors.theme,
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
                              DefaultTextStyle(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: Platform.isAndroid
                                            ? size_14
                                            : size_16),
                                child: Text('Filter'),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              homeCategory(context, categoryProvider,
                                  searchProvider, true);
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.34,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.midBorder
                                    : colors.theme,
                                border: Border(
                                  left: BorderSide(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.midBorder
                                        : colors.theme,
                                  ),
                                ),
                              ),
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
                                  DefaultTextStyle(
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: Platform.isAndroid
                                                ? size_14
                                                : size_16),
                                    child: Text('Category'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              homeSort(context, searchProvider);
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.33,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.midBorder
                                    : colors.theme,
                                border: Border(
                                  left: BorderSide(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? colors.midBorder
                                        : colors.theme,
                                  ),
                                ),
                              ),
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
                                  DefaultTextStyle(
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: Platform.isAndroid
                                                ? size_14
                                                : size_16),
                                    child: Text('Sort'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showMicrophone(context) async {
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
              height: 260,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.mic,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Allow microphone',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontSize: Platform.isAndroid ? size_18 : size_20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: colors.greyText,
                        fontSize: Platform.isAndroid ? size_14 : size_14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 90,
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
                            side: MaterialStateProperty.all(const BorderSide(
                                color: Colors.white, width: 1)),
                          ),
                          onPressed: () {
                            Routes.navigateToPreviousScreen(context);
                          },
                          child: Text(
                            'CANCEL',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 90, // Increase button width
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
                          onPressed: () async {
                            await Permission.microphone.request();
                            Routes.navigateToPreviousScreen(context);
                          },
                          child: Text(
                            'ALLOW',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize:
                                      Platform.isAndroid ? size_10 : size_12,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
