import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../model/refund.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_header.dart';
import '../../common_header.dart';

class RefundHistory extends StatefulWidget {
  const RefundHistory({Key? key}) : super(key: key);

  @override
  State<RefundHistory> createState() => _RefundHistoryState();
}

class _RefundHistoryState extends State<RefundHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              Stack(
                children: const [
                  ProfileHeader(),
                  InternalPageHeader(
                    text: "Refund History",
                  )
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    for (int i = 0; i < 4; i++)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${refund[i].transactionDate} , ${refund[i].transactionTime}",
                                            style: const TextStyle(
                                                color: colors.textColor,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            refund[i].transactionAmount,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      buildCustomButton(
                                          refund[i].transactionStatus),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Transaction ID",
                                    style: TextStyle(
                                        color: colors.textColor, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  refund[i].transactionStatus
                                      ? Text(
                                          refund[i].transactionId,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                      : const Text(
                                          "-",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCustomButton(bool isSuccess) {
    Color buttonColor = isSuccess ? Colors.green : Colors.red;
    Color textColor = isSuccess ? Colors.green : Colors.red;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor.withOpacity(0.2),
        onPrimary: textColor,
      ),
      onPressed: () {},
      child: Text(isSuccess ? "SUCCESS" : "unsuccessful"),
    );
  }
}
