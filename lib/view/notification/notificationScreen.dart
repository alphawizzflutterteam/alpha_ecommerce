import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/view/notification/notificationCard.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/notificationViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  late NotificationViewModel provider;
  late HomeViewModel homeProvider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<NotificationViewModel>(context, listen: false);
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);

    provider.getNotificationlist(context);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<NotificationViewModel>(context);
    homeProvider = Provider.of<HomeViewModel>(context);

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
                      text: "Notifications",
                    ),
                  ],
                ),
              ),
              provider.isLoading
                  ? Column(
                      children: [
                        Center(
                          child: appLoader(),
                        ),
                      ],
                    )
                  : provider.notificationList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/notifications.png',
                                height: size_150,
                              ),
                              Text(
                                "No notifications yet.",
                                style: TextStyle(
                                  color: colors.greyText,
                                ),
                              )
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.markRead(context, "", "1");
                                  homeProvider.getProfileAPI(
                                    "",
                                    context,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text("Mark all as read",
                                          style: TextStyle(
                                            color: colors.greyText,
                                          ))),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 150,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: provider.notificationList.length,
                                  itemBuilder: (context, i) {
                                    return notificationCard(
                                        provider.notificationList[i],
                                        context,
                                        provider);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ],
    );
  }
}
