import 'package:alpha_ecommerce_18oct/view/notification/notificationCard.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../../utils/images.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> notifications = [
    // {
    //   'image': Images.cart,
    //   'text': 'Your order has been shipped',
    //   'subText': "Lorem IPsum is simply dummy text",
    //   'date': "09 May 2023"
    // },
    // {
    //   'image': Images.discount,
    //   'text': 'Big Sale T-shirts under \$399',
    //   'subText':
    //       "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
    //   'date': ""
    // },
    // {
    //   'image': Images.cart,
    //   'text': 'Your order has been shipped',
    //   'subText': "Lorem IPsum is simply dummy text",
    //   'date': "09 May 2023"
    // },
    // {
    //   'image': Images.discount,
    //   'text': 'Big Sale T-shirts under \$399',
    //   'subText':
    //       "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
    //   'date': ""
    // },
    // {
    //   'image': Images.cart,
    //   'text': 'Your order has been shipped',
    //   'subText': "Lorem IPsum is simply dummy text",
    //   'date': "09 May 2023"
    // },
    // {
    //   'image': Images.discount,
    //   'text': 'Big Sale T-shirts under \$399',
    //   'subText':
    //       "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
    //   'date': ""
    // },
    // {
    //   'image': Images.cart,
    //   'text': 'Your order has been shipped',
    //   'subText': "Lorem IPsum is simply dummy text",
    //   'date': "09 May 2023"
    // },
    // {
    //   'image': Images.discount,
    //   'text': 'Big Sale T-shirts under \$399',
    //   'subText':
    //       "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
    //   'date': ""
    // },
    // {
    //   'image': Images.cart,
    //   'text': 'Your order has been shipped',
    //   'subText': "Lorem IPsum is simply dummy text",
    //   'date': "09 May 2023"
    // },
    // {
    //   'image': Images.discount,
    //   'text': 'Big Sale T-shirts under \$399',
    //   'subText':
    //       "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
    //   'date': ""
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colors.darkBG,
            child: Image.asset(
              Images.bgGreenBottom,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
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
                    const ProfileHeader(),
                    const InternalPageHeader(
                      text: "Notification",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 87 * notifications.length.toDouble(),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notifications.length,
                          itemBuilder: (context, i) {
                            return notificationCard(notifications[i]);
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
