import 'package:alpha_ecommerce_18oct/utils/utils.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/color.dart';
import '../../../../utils/routes.dart';
import '../../../../model/paymentMethod.dart';
import '../../../widget_common/commonBackground.dart';
import '../../../widget_common/common_button.dart';
import '../../../widget_common/common_header.dart';
import '../../common_header.dart';

class Payment extends StatefulWidget {
  final String data;
  const Payment({
    super.key,
    required this.data,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? selectedPaymentMethod;
  late CartViewModel cartProvider;
  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartViewModel>(context);

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
                  InternalPageHeader(text: "Add Money")
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Select payment method",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (int i = 0; i < paymentMethods.length; i++)
                        InkWell(
                          onTap: () async {
                            if (i == 4) {
                              await cartProvider.placeOrder(
                                  widget.data, context);
                            } else {
                              Utils.showFlushBarWithMessage(
                                  "Alert",
                                  "Please proceed with Cash on delivery only.",
                                  context);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0x14E9E9E9),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0x660A9494),
                              ),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                paymentMethods[i].paymentMethodImage,
                                width: 40,
                                height: 40,
                              ),
                              title: Text(
                                paymentMethods[i].paymentMethodName,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              trailing: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: colors.greyText),
                                child: Radio<int>(
                                  value: i,
                                  groupValue: selectedPaymentMethod,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedPaymentMethod = value;
                                      print(value);
                                    });
                                  },
                                  focusColor: colors.buttonColor,
                                  hoverColor: colors.buttonColor,
                                  activeColor: colors.buttonColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  color: colors.textFieldBG,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: CommonButton(
                                  text: "CONTINUE",
                                  fontSize: 14,
                                  onClick: () async {
                                    if (selectedPaymentMethod != null &&
                                        selectedPaymentMethod == 4) {
                                      await cartProvider.placeOrder(
                                          widget.data, context);
                                    } else {
                                      Utils.showFlushBarWithMessage(
                                          "Alert",
                                          "Please proceed with Cash on delivery only.",
                                          context);
                                    }
                                  })),
                        ],
                      ),
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
