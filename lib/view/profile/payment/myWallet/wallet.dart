import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_button.dart';
import '../../../widget_common/common_header.dart';
import '../../common_header.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
                  InternalPageHeader(
                    text: "My Wallet",
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image(
                        height: 100,
                        width: 150,
                        image: AssetImage(Images.wallet)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Add to Wallet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the",
                      style:
                          TextStyle(color: colors.lightTextColor, fontSize: 14),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "printing and typesetting industry",
                      style:
                          TextStyle(color: colors.lightTextColor, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                        height: 40,
                        width: 150,
                        child: CommonButton(
                            text: "ADD MONEY",
                            fontSize: 14,
                            onClick: () {
                              Routes.navigateToAddMoneyScreen(context);
                            })),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
