import 'package:flutter/material.dart';
import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/commonTextStyle.dart';
import '../common_header.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                                  child: const HeaderText(text: "Contact Us")),
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
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            term1,
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30),
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.boxBorder
                                    : const Color.fromARGB(255, 236, 236, 236),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "9330011773",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Support@alphawizz.com",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "Areas we deliver",
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
                            "Pan India",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30),
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colors.boxBorder
                                    : const Color.fromARGB(255, 236, 236, 236),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delivery Timings",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("7:00 AM To 11:00 AM",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14)),
                                      Text(
                                        "12:00 PM To 04:00 PM",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 14),
                                      ),
                                      Text("05:00 PM To 09:00 PM",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Text(
                          "Note: You can order for maximum 7 days in advance. We deliver in minutes.",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
