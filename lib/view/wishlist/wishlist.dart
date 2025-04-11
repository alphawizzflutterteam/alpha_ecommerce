import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/deletePopup.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/wishlistCard.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedOption = 'Normal Delivery';

  late HomeViewModel homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    homeProvider.getWishlistItem(context);
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);

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
                child:  Stack(
                  children: [
                    ProfileHeader(),
                    InternalDetailPageHeader(
                      text: "My Wishlist",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: homeProvider.isLoading
                    ? appLoader()
                    : homeProvider.wishlistModel.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: size_50,
                                ),
                                Image.asset(
                                  'assets/images/Wishlish.png',
                                  height: size_150,
                                ),
                                SizedBox(
                                  height: size_10,
                                ),
                                Text(
                                  "No wishlist items yet.",
                                  style: TextStyle(
                                    color: colors.greyText,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                SizedBox(
                                  height: 180 *
                                      homeProvider.wishlistModel.length
                                          .toDouble(),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        homeProvider.wishlistModel.length,
                                    itemBuilder: (context, i) {
                                      var model = homeProvider.wishlistModel[i];
                                      return wishlistCard(
                                          context, model.product, homeProvider);
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

  void deleteItem(int index) {
    setState(() {
      // wishlist.removeAt(index);
      Navigator.of(context).pop(); // Close the DeletePopup
    });
  }

  Future<void> showAlertDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: DeletePopup(
            delete: () {
              deleteItem(index);
            },
          ),
        );
      },
    );
  }
}
