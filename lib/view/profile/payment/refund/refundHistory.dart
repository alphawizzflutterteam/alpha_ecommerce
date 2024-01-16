import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/refund/refundHistoryCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  late ProfileViewModel profileModelProvider;
  @override
  void initState() {
    super.initState();
    profileModelProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileModelProvider.getRefundHistoryData(context);
  }

  @override
  Widget build(BuildContext context) {
    profileModelProvider = Provider.of<ProfileViewModel>(context);

    return Stack(
      children: [
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
                child: const Stack(
                  children: [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Refund History",
                    )
                  ],
                ),
              ),
              profileModelProvider.isLoading
                  ? appLoader()
                  : profileModelProvider.refundData.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/Group 3021.png',
                                height: size_150,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "No refund history yet.",
                                style: TextStyle(
                                  color: colors.greyText,
                                ),
                              )
                            ],
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              for (int i = 0;
                                  i < profileModelProvider.refundData.length;
                                  i++)
                                refundHistoryCard(
                                    context: context,
                                    data: profileModelProvider.refundData[i]),
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
