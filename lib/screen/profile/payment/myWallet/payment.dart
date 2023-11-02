import 'package:flutter/material.dart';
import '../../../../helper/color.dart';
import '../../../../helper/routes.dart';
import '../../../../model/paymentMethod.dart';
import '../../../../widgets/commonBackground.dart';
import '../../../../widgets/common_header.dart';
import '../../common_header.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? selectedPaymentMethod;

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
                      for (int i = 0; i < 4; i++)
                        Container(
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
                                  unselectedWidgetColor:
                                      const Color(0xff767680)),
                              child: Radio<int>(
                                value: i,
                                groupValue: selectedPaymentMethod,
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedPaymentMethod = value;
                                  });
                                },
                                focusColor: colors.buttonColor,
                                hoverColor: colors.buttonColor,
                                activeColor: colors.buttonColor,
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
                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedPaymentMethod != null) {
                                  Routes.navigateToPaymentFormScreen(context);
                                } else {
                                  print('Please select a payment method.');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please select a payment method.'),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: colors.buttonColor,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('CONTINUE',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
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
