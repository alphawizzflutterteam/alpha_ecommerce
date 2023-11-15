import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../widget_common/commonBackground.dart';
import '../../common_header.dart';

class SingleTransaction extends StatefulWidget {
  const SingleTransaction({Key? key}) : super(key: key);

  @override
  State<SingleTransaction> createState() => _SingleTransactionState();
}

class _SingleTransactionState extends State<SingleTransaction> {
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
                                "Transaction Detail",
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
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "\$ 2562",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text(
                            "2 Oct 2023 04:45 PM",
                            style: TextStyle(
                                color: colors.lightTextColor, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.54,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color:
                                      const Color(0xff2568EE).withOpacity(0.2),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Transaction Successful",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: colors.boxBorder,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order ID",
                                    style: TextStyle(
                                        color: colors.lightTextColor,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("OID2345678912",
                                      style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              buildCustom(true)
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transaction ID",
                                    style: TextStyle(
                                        color: colors.lightTextColor,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("OID2345678912",
                                      style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transaction Type",
                                    style: TextStyle(
                                        color: colors.lightTextColor,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("Bank Transfer",
                                      style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Type",
                                    style: TextStyle(
                                        color: colors.lightTextColor,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("Product Purchase",
                                      style: TextStyle(
                                          color: colors.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
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

  Widget buildCustom(bool isSuccess) {
    Color buttonColor = isSuccess ? Colors.green : Colors.red;
    Color textColor = isSuccess ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: buttonColor.withOpacity(0.2),
      ),
      child: Text(
        isSuccess ? "SUCCESS" : "unsuccessful",
        style: TextStyle(color: textColor),
      ),
    );
  }
}
