import 'package:flutter/material.dart';
import '../../../model/paymentType.dart';
import '../../../widgets/commonBackground.dart';
import '../../../widgets/common_header.dart';
import '../common_header.dart';

class ProfilePayment extends StatefulWidget {
  const ProfilePayment({Key? key}) : super(key: key);

  @override
  State<ProfilePayment> createState() => _ProfilePaymentState();
}

class _ProfilePaymentState extends State<ProfilePayment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                  InternalPageHeader(text: "Payment",)
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        paymentType[i].navigationScreen),
                              );
                            },
                            child: ListTile(
                              leading: Icon(
                                paymentType[i].paymentTypeIcon,
                                color: Colors.white60,
                              ),
                              title: Text(
                                paymentType[i].paymentTypeName,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
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
}
