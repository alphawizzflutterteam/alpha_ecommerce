import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  String text = 'Press the button and start speaking';

  @override
  void initState() {
    super.initState();
    getMicrophonePermission(true);
  }

  Future<void> initSpeechState() async {
    bool available = await speech.initialize(
      onStatus: (status) {
        print('Speech recognition status: $status');
      },
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      print('Speech recognition is available');
    } else {
      print('Speech recognition is not available');
    }
  }

  Future<void> startListening() async {
    if (!isListening) {
      bool listening = await speech.listen(
        onResult: (result) {
          setState(() {
            text = result.recognizedWords;

            searchController.text = result.recognizedWords;
          });
        },
      );

      if (listening) {
        setState(() {
          isListening = true;
        });
      }
    }
  }

  Future<void> stopListening() async {
    if (isListening) {
      await speech.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  Future<void> getMicrophonePermission(bool isCallingForFirstTime) async {
    PermissionStatus status = await Permission.microphone.status;

    // If permission is granted, return early

    print(status.toString());
    if (status.isGranted) {
      if (isCallingForFirstTime) {
        initSpeechState();
      } else {
        isListening ? stopListening() : startListening();
      }
    }

    // If permission is not granted, request the microphone permission
    if (status.isRestricted) {
      status = await Permission.microphone.request();
    }

    // If permission is denied, show a dialog or handle it accordingly
    if (status.isDenied) {
      showMicrophone(context);

      print(status.toString());

      // You can show a dialog or message here to inform the user
      // that the permission is necessary for the app to function.
    }
    if (status.isPermanentlyDenied) {
      status = await Permission.microphone.request();
      print(status.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          onChanged: (value) {},
                          controller: searchController,
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
                                Routes.navigateToPreviousScreen(context);
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
                          getMicrophonePermission(false);
                        },
                        child: Image.asset(
                          Images.smallMic,
                          height: 25,
                          width: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
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

                            getMicrophonePermission(false);
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
