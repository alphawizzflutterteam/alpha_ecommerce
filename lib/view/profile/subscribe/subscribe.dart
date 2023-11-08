import 'package:flutter/material.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_header.dart';
import '../common_header.dart';

class Subscribe extends StatefulWidget {
  final bool? signUp;
  const Subscribe({Key? key, this.signUp}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  late bool showHeader;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showHeader = widget.signUp ?? false;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isYearlyTabSelected = true;

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
              showHeader
                  ? Container(
                      padding: const EdgeInsets.only(top: 40, right: 20),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Routes.navigateToDashboardScreen(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 30,
                          )),
                    )
                  : const Stack(
                      children: [
                        ProfileHeader(),
                        InternalPageHeader(
                          text: "Alpha Subscription",
                        )
                      ],
                    ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        showHeader
                            ? const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Review your detail",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Your Plans & benefits",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 20,
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTabButton("Yearly", isYearlyTabSelected, () {
                              setState(() {
                                isYearlyTabSelected = true;
                              });
                            }),
                            buildTabButton("Monthly", !isYearlyTabSelected, () {
                              setState(() {
                                isYearlyTabSelected = false;
                              });
                            }),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (isYearlyTabSelected)
                          // Yearly content
                          Column(
                            children: [
                              Container(
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors
                                        .white, // Set the border color here
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ALPHA PREMIUM",
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
                                                  fontWeight: FontWeight.normal,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          Routes.navigateToPaymentScreen(
                                              context);
                                        },
                                        child: Text(
                                          showHeader
                                              ? 'SUBSCRIBE NOW'
                                              : 'UPGRADE PLAN',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      colors.subscribeYellow,
                                      colors.subscribeYellow.withOpacity(0.1),
                                    ],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors
                                        .white, // Set the border color here
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "ALPHA GOLD",
                                                      style: TextStyle(
                                                        fontSize:
                                                            20, // Adjust the size as needed
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .white, // Customize the color
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text.rich(
                                                      TextSpan(
                                                        text:
                                                            '\$', // The dollar sign
                                                        style: TextStyle(
                                                          fontSize:
                                                              18, // Adjust the size as needed
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: colors
                                                              .lightTextColor, // Customize the color
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: '9.99',
                                                            style: TextStyle(
                                                              fontSize:
                                                                  24, // Adjust the size as needed
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .white, // Customize the color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: showHeader
                                                        ? const Text(
                                                            'SUBSCRIBE NOW',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .check_circle_outline,
                                                                    size: 18,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 3,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Routes.navigateToCurrentPlanScreen(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'CURRENT PLAN',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              const Text(
                                                                'Expiring by 02 Feb, 2023',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
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
                                          for (int i = 0; i < 4; i++)
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 5, top: 5),
                                              child: Row(
                                                children: [
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
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      colors.buttonColor,
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors
                                        .white, // Set the border color here
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ALPHA BASIC",
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
                                                text: '0.00',
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
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors
                                                      .white, // Customize the color
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        else
                          Container(
                            child: const Text(""),
                          ),
                      ],
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

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    Color textColor = isSelected ? Colors.black : Colors.white;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: isSelected ? Colors.white : Colors.transparent,
            onPrimary: textColor,
          ),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
