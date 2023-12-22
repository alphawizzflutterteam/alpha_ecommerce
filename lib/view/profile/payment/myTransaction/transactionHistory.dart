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
    profileModelProvider.getTransactionHistoryData();
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  InternalPageHeader(
                    text: "Transaction History",
                  )
                ],
              ),
              profileModelProvider.isLoading
                  ? appLoader()
                  : Expanded(
                      child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          for (int i = 0;
                              i < profileModelProvider.transactionDatta.length;
                              i++)
                            transactionHistoryCard(
                                context: context,
                                data: profileModelProvider.transactionDatta[i]),
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
