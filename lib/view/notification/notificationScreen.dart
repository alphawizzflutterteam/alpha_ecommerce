import 'package:alpha_ecommerce_18oct/view/notification/notificationCard.dart';
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
    {
      'image': Images.cart,
      'text': 'Your order has been shipped',
      'subText': "Lorem IPsum is simply dummy text",
      'date': "09 May 2023"
    },
    {
      'image': Images.discount,
      'text': 'Big Sale T-shirts under \$399',
      'subText':
          "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
      'date': ""
    },
    {
      'image': Images.cart,
      'text': 'Your order has been shipped',
      'subText': "Lorem IPsum is simply dummy text",
      'date': "09 May 2023"
    },
    {
      'image': Images.discount,
      'text': 'Big Sale T-shirts under \$399',
      'subText':
          "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
      'date': ""
    },
    {
      'image': Images.cart,
      'text': 'Your order has been shipped',
      'subText': "Lorem IPsum is simply dummy text",
      'date': "09 May 2023"
    },
    {
      'image': Images.discount,
      'text': 'Big Sale T-shirts under \$399',
      'subText':
          "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
      'date': ""
    },
    {
      'image': Images.cart,
      'text': 'Your order has been shipped',
      'subText': "Lorem IPsum is simply dummy text",
      'date': "09 May 2023"
    },
    {
      'image': Images.discount,
      'text': 'Big Sale T-shirts under \$399',
      'subText':
          "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
      'date': ""
    },
    {
      'image': Images.cart,
      'text': 'Your order has been shipped',
      'subText': "Lorem IPsum is simply dummy text",
      'date': "09 May 2023"
    },
    {
      'image': Images.discount,
      'text': 'Big Sale T-shirts under \$399',
      'subText':
          "Lorem IPsum is simply dummy text. Lorem IPsum is simply dummy text",
      'date': ""
    },
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(top: 35),
                  height: 100,
                  color: const Color(0x99183D3D),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                              onTap: () {
                                Routes.navigateToPreviousScreen(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.1),
                            child: const Text(
                              "Notification",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < notifications.length; i++)
                        notificationCard(notifications[i])
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
