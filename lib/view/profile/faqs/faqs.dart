import 'dart:io';

import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/viewModel/faqsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../common_header.dart';

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late FaqViewModel faqProvider;

  @override
  void initState() {
    super.initState();
    faqProvider = Provider.of<FaqViewModel>(context, listen: false);
    faqProvider.getFaqListItem(context);
  }

  @override
  Widget build(BuildContext context) {
    faqProvider = Provider.of<FaqViewModel>(context);

    return Stack(children: [
      Align(
        alignment: Alignment.topRight,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: colors.darkBG,
        ),
      ),
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
              child: Stack(
                children: [
                  const ProfileHeader(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.only(top: 35),
                      height: 100,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Routes.navigateToPreviousScreen(context);
                                  },
                                  child: const Icon(Icons.arrow_back_ios)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.1),
                                child: Text(
                                  "FAQs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Platform.isAndroid
                                          ? size_18
                                          : size_20),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 183 * faqProvider.faqList.length.toDouble(),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: faqProvider.faqList.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(
                                    color: Colors.white38, width: 0.2),
                              ),
                              elevation: 2,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.transparent
                                  : colors.buttonColor,
                              child: ExpansionTile(
                                iconColor: Colors.white,
                                collapsedIconColor: Colors.white,
                                title: Text(
                                  faqProvider.faqList[i].question,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                children: [
                                  SizedBox(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, bottom: 10),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${faqProvider.faqList[i].answer}",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
