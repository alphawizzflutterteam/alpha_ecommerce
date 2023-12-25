import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/vendor/vendorCard.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/viewModel/vendorViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowingVendorList extends StatefulWidget {
  const FollowingVendorList({super.key});

  @override
  State<FollowingVendorList> createState() => _FollowingVendorListState();
}

class _FollowingVendorListState extends State<FollowingVendorList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late VendorViewModel vendorProvider;

  @override
  void initState() {
    super.initState();
    vendorProvider = Provider.of<VendorViewModel>(context, listen: false);
    vendorProvider.getFollowingVendorListItem(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    vendorProvider = Provider.of<VendorViewModel>(context);

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
                child: Stack(
                  children: [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Following Vendor",
                    )
                  ],
                ),
              ),
              vendorProvider.isLoading
                  ? appLoader()
                  : Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 130 *
                              vendorProvider.followedvendorModel.length
                                  .toDouble(),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                vendorProvider.followedvendorModel.length,
                            itemBuilder: (context, i) {
                              var model = vendorProvider.followedvendorModel[i];
                              return vendorCard(context, model);
                            },
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
}
