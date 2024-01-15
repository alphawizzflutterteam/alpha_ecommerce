import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../model/chatMessage.dart';
import '../../widget_common/commonBackground.dart';
import '../common_header.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController txtMessage = TextEditingController();
  late HomeViewModel homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);

    homeProvider.getChatlist(context);
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
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
                child: Stack(
                  children: [
                    const ProfileHeader(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size_50,
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  width: size_35,
                                  height: size_35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).brightness !=
                                            Brightness.dark
                                        ? Colors.white
                                        : colors.buttonColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "AC",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : colors.buttonColor,
                                            fontSize: Platform.isAndroid
                                                ? size_13
                                                : size_15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Alpha Chatbot",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: Platform.isAndroid
                                                    ? size_16
                                                    : size_18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: homeProvider.chatListt.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: (homeProvider
                                          .chatListt[index].sentByCustomer ==
                                      0
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  color: (homeProvider
                                              .chatListt[index].sentByAdmin ==
                                          1
                                      ? colors.buttonColor
                                      : Colors.grey.shade600),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Text(
                                      homeProvider.chatListt[index].message,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: Platform.isAndroid
                                                  ? size_13
                                                  : size_15,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Color.fromARGB(255, 229, 229, 229),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  // margin:
                  //     const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 20, top: 10, right: 20),
                  height: 75,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: const SizedBox(
                      //     height: 30,
                      //     width: 30,
                      //     child: Icon(
                      //       Icons.camera_alt_outlined,
                      //       color: Colors.black,
                      //       size: 25,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Expanded(
                        child: TextField(
                          controller: txtMessage,
                          decoration: InputDecoration(
                            // fillColor:
                            //     Theme.of(context).brightness == Brightness.dark
                            //         ? Colors.white
                            //         : Colors.white,
                            hintText: "Type message",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black),
                            contentPadding: EdgeInsets.all(8.0),
                            border: InputBorder.none,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () async {
                          Map data = {'id': "1", 'message': txtMessage.text};
                          txtMessage.clear();

                          await homeProvider.sendMessage(context, data);
                        },
                        backgroundColor: colors.buttonColor,
                        elevation: 0,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
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
