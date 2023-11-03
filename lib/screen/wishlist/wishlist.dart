import 'package:alpha_ecommerce_18oct/screen/wishlist/deletePopup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../helper/color.dart';
import '../../helper/routes.dart';
import '../../model/wishlist.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_button.dart';
import '../widget_common/common_header.dart';
import '../widget_common/toast_message.dart';
import '../profile/common_header.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedOption = 'Alpha Delivery';

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
                    text: "My Wishlist",
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      for (int i = 0; i < wishlist.length; i++)
                        InkWell(
                          onTap: () {
                            Routes.navigateToProductDetailPageScreen(context);
                          },
                          child: Container(
                            height: wishlist[i].productCount > 0 ? 120 : 0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0x14E9E9E9).withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    wishlist[i].productImage,
                                    width: 100,
                                    height: 170,
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        wishlist[i].productName,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            wishlist[i].productPrice,
                                            style: const TextStyle(
                                                color: colors.buttonColor,
                                                fontSize: 16),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              wishlist[i].productDiscount,
                                              style: const TextStyle(
                                                  color: colors.greyText,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        wishlist[i].productWeight,
                                        style: const TextStyle(
                                            color: colors.greyText,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  showAlertDialog(i);
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                                height: 25,
                                                width: 100,
                                                child: CommonButton(
                                                  text: "Added to Cart",
                                                  fontSize: 12,
                                                  onClick: () {
                                                    showToastMessage(
                                                        "Added to Cart");
                                                  },
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
      wishlist.removeAt(index);
      Navigator.of(context).pop(); // Close the DeletePopup
    });
  }

  Future<void> showAlertDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: DeletePopup(
            delete: () {
              deleteItem(index);
            },
          ),
        );
        ;
      },
    );
  }
}
