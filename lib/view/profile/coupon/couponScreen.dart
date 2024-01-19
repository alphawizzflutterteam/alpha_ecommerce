import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/viewModel/couponViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widget_common/commonBackground.dart';
import '../../widget_common/common_header.dart';
import '../common_header.dart';
import 'couponCard.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late CouponViewModel couponProvider;

  @override
  void initState() {
    super.initState();
    couponProvider = Provider.of<CouponViewModel>(context, listen: false);
    couponProvider.getCouponListItem(context);
  }

  @override
  Widget build(BuildContext context) {
    couponProvider = Provider.of<CouponViewModel>(context);

    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.transparent
              : Color.fromARGB(255, 245, 245, 245),
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
                      text: 'Coupons',
                    )
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
                        height:
                            183 * couponProvider.couponModel.length.toDouble(),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: couponProvider.couponModel.length,
                          itemBuilder: (context, i) {
                            return couponCard(
                                context: context,
                                coupon: couponProvider.couponModel[i]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
