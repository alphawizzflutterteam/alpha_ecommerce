import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/search/productsForYouCardSearch.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/categoryShuffle.dart';
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
  bool _isListening = false;
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    super.initState();
    searchProvider = Provider.of<SearchViewModel>(context, listen: false);
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    categoryProvider = Provider.of<CategoryViewModel>(context, listen: false);
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print('Status: $status');
        },
        onError: (error) {
          print('Error: $error');
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
            });
          },
        );
      }
    } else {
      _speech.stop();
      _isListening = !_isListening;
    }

    setState(() {
      _isListening = !_isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of<SearchViewModel>(context);
    homeProvider = Provider.of<HomeViewModel>(context);
    categoryProvider = Provider.of<CategoryViewModel>(context);

    return Stack(
      children: [
        Align(
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
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          // bottomNavigationBar: searchProvider.searchResults.isEmpty
          //     ? Container()
          //     : Padding(
          //         padding: const EdgeInsets.only(bottom: 8.0),
          //         child: Row(
          //           children: [
          //   Container(
          //     height: 50,
          //     width: MediaQuery.of(context).size.width * 0.33,
          //     color: colors.midBorder,
          //     child: InkWell(
          //       onTap: () {
          //         homeFilter(context, homeProvider.filterModel);
          //       },
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             Images.filter,
          //             height: 20,
          //             width: 20,
          //           ),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           const Text(
          //             'Filter',
          //             style: TextStyle(
          //                 color: Colors.white, fontSize: 16),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          //   Container(
          //     height: 50,
          //     width: MediaQuery.of(context).size.width * 0.34,
          //     decoration: const BoxDecoration(
          //       color: colors.midBorder,
          //       border: Border(
          //         left: BorderSide(
          //           color: colors.midBorder,
          //         ),
          //       ),
          //     ),
          //     child: InkWell(
          //       onTap: () {
          //         homeCategory(context);
          //       },
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             Images.categoryWhite,
          //             height: 20,
          //             width: 20,
          //           ),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           const Text(
          //             'Category',
          //             style: TextStyle(
          //                 color: Colors.white, fontSize: 16),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          //   Container(
          //     height: 50,
          //     width: MediaQuery.of(context).size.width * 0.33,
          //     decoration: const BoxDecoration(
          //       color: colors.midBorder,
          //       border: Border(
          //         left: BorderSide(
          //           color: colors.midBorder,
          //         ),
          //       ),
          //     ),
          //     child: InkWell(
          //       onTap: () {
          //         homeSort(context);
          //       },
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             Images.sort,
          //             height: 20,
          //             width: 20,
          //           ),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           const Text(
          //             'Sort',
          //             style: TextStyle(
          //                 color: Colors.white, fontSize: 16),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ],
          //         ),
          //       ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.7,
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
                            fillColor: colors.textFieldBG,
                            filled: true,
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                if (searchProvider.searchController.text ==
                                    "") {
                                  Routes.navigateToPreviousScreen(context);
                                } else {
                                  searchProvider.searchController.text = "";
                                }
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
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
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            //accessCamera(context);
                          },
                          child: Image.asset(
                            Images.camera,
                            height: 25,
                            width: 25,
                          )),
                      InkWell(
                        onTap: () {
                          _listen();
                        },
                        child: _isListening
                            ? Image.asset(
                                "assets/images/microphone_gif.gif",
                                height: 25,
                                width: 25,
                              )
                            : Image.asset(
                                Images.smallMic,
                                height: 25,
                                width: 25,
                              ),
                      )
                    ],
                  ),
                ),
              ),
              searchProvider.searchResults.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/no-results.png",
                              height: size_100,
                            ),
                            const SizedBox(
                              height: size_10,
                            ),
                            const Text(
                              "No Result Found.",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: size_5,
                            ),
                            const Text(
                              "Try searching with some other keyword",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              searchProvider.isLoading
                  ? appLoader()
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              // height: MediaQuery.of(context).size.height *
                              //     0.5 *
                              //     searchProvider.searchResults.length /
                              //     2,
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
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
                      ),
                    ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: colors.textFieldBG,
              image: DecorationImage(
                image: AssetImage(Images.bgTab),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Material(
                child: InkWell(
                  onTap: () {
                    homeFilter(context, homeProvider.filterModel,
                        searchProvider, false);
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.33,
                        color: colors.midBorder,
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
                            const DefaultTextStyle(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              child: Text('Filter'),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            homeCategory(context, categoryProvider,
                                searchProvider, true);
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.34,
                            decoration: const BoxDecoration(
                              color: colors.midBorder,
                              border: Border(
                                left: BorderSide(
                                  color: colors.midBorder,
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
                                const DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  child: Text('Category'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            homeSort(context, searchProvider);
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.33,
                            decoration: const BoxDecoration(
                              color: colors.midBorder,
                              border: Border(
                                left: BorderSide(
                                  color: colors.midBorder,
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
                                const DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
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
        )
      ],
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
                  const Text(
                    'Allow microphone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lorem Ipsum is simply dummy text',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colors.greyText, fontSize: 14),
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
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(fontSize: 12),
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
                          child: const Text(
                            'ALLOW',
                            style: TextStyle(fontSize: 12),
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
