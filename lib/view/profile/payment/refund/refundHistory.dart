import 'package:alpha_ecommerce_18oct/view/profile/payment/refund/refundHistoryCard.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../model/refund.dart';
import '../../../../utils/routes.dart';
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
              const Stack(
                children: [
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
                      refundHistoryCard(context: context, refundIndex: i),
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
