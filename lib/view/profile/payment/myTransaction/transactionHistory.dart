import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/profile/payment/myTransaction/transactionHistoryCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_header.dart';
import '../../common_header.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late ProfileViewModel profileModelProvider;
  @override
  void initState() {
    super.initState();
    profileModelProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileModelProvider.getTransactionHistoryData(context);
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
              : const Color.fromARGB(255, 232, 232, 232),
          body: Column(
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : colors.buttonColor,
                child:  Stack(
                  children: [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Transaction History",
                    )
                  ],
                ),
              ),
              profileModelProvider.isLoading
                  ? appLoader()
                  : profileModelProvider.transactionDatta.isEmpty
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
                              Text(
                                "No transactions yet.",
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
                                  i <
                                      profileModelProvider
                                          .transactionDatta.length;
                                  i++)
                                transactionHistoryCard(
                                    context: context,
                                    data: profileModelProvider
                                        .transactionDatta[i]),
                            ],
                          ),
                        )),
            ],
          ),
        ),
      ],
    );
  }
}
