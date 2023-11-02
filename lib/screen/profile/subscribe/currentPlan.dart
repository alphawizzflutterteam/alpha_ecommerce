import 'package:flutter/material.dart';
import '../../../helper/color.dart';
import '../../../helper/routes.dart';
import '../../../widgets/commonBackground.dart';
import '../common_header.dart';

class CurrentPlan extends StatefulWidget {
  const CurrentPlan({Key? key}) : super(key: key);

  @override
  State<CurrentPlan> createState() => _CurrentPlanState();
}

class _CurrentPlanState extends State<CurrentPlan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const LightBackGround(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
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
                                  right:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: const Text(
                                "Subscription Plan",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white, // Set the border color here
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.89,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "PREMIUM",
                                            style: TextStyle(
                                              fontSize:
                                                  20, // Adjust the size as needed
                                              fontWeight: FontWeight.bold,
                                              color: Colors
                                                  .white, // Customize the color
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text: '\$', // The dollar sign
                                              style: TextStyle(
                                                fontSize:
                                                    18, // Adjust the size as needed
                                                fontWeight: FontWeight.bold,
                                                color: colors
                                                    .lightTextColor, // Customize the color
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '9.99',
                                                  style: TextStyle(
                                                    fontSize:
                                                        24, // Adjust the size as needed
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .white, // Customize the color
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' / month',
                                                  style: TextStyle(
                                                    fontSize:
                                                        18, // Adjust the size as needed
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors
                                                        .white, // Customize the color
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: 30,
                                          width: 140,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.check_circle_outline,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Routes
                                                      .navigateToCurrentPlanScreen(
                                                          context);
                                                },
                                                child: const Text(
                                                  'CURRENT PLAN',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 1,
                                ),
                                const SizedBox(height: 15),
                                for (int i = 0; i < 21; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, top: 5),
                                    child: Row(
                                      children: const [
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.check_circle_outline,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Lorem Ipsum is simply dummy text",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
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
