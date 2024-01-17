import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/createQuery.dart';
import 'package:alpha_ecommerce_18oct/view/profile/customerSupport/queryDetail.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/commonBackground.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/imageErrorWidget.dart';
import 'package:alpha_ecommerce_18oct/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileViewModel profileP;
  String formatDaate(String dateString) {
    // Parse the date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy, h:mm a').format(dateTime);
    return formattedDate;
  }

  @override
  void initState() {
    profileP = Provider.of<ProfileViewModel>(context, listen: false);
    profileP.getSupportQuerys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    profileP = Provider.of<ProfileViewModel>(context);
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
                  children: const [
                    ProfileHeader(),
                    InternalPageHeader(
                      text: "Customer Support",
                    )
                  ],
                ),
              ),
              profileP.isLoading
                  ? appLoader()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          itemCount: profileP.queries.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QueryDetailScreen(
                                    queryDetails: profileP.queries[index]),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colors.lightGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        profileP.queries[index].customerImage
                                            .toString(),
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                ErrorImageWidget(),
                                        height: 60,
                                        width: 60,
                                      ),
                                      VerticalDivider(
                                          color: Colors.transparent),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .5,
                                            child: Text(
                                              profileP.queries[index].subject
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            profileP
                                                .queries[index].customerEmail
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: colors.greyText),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Date & Time",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: colors.greyText),
                                          ),
                                          Text(
                                            formatDaate(profileP
                                                .queries[index].createdAt
                                                .toString()),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFF9ECAC),
                                        ),
                                        child: Text(
                                          profileP.queries[index].status
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Color(0xFFD89C01)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateQueryScreen(),
                    )),
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(double.maxFinite, 50)),
                child: Text(
                  "CREATE QUERY",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }
}
