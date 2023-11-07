import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../../model/CartList.dart';
import '../widget_common/toast_message.dart';

class CartListWidget extends StatefulWidget {
  final int i;
  const CartListWidget({Key? key, required this.i}) : super(key: key);

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  final List<String> genderItems = [
    'Qty 1',
    'Qty 2',
    'Qty 3',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cartList[widget.i].productCount > 0 ? 190 : 0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colors.boxBorder)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Routes.navigateToProductDetailPageScreen(context);
                },
                child: Image.asset(
                  cartList[widget.i].productImage,
                  width: 110,
                  height: 140,
                ),
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Routes.navigateToProductDetailPageScreen(context);
                    },
                    child: Text(
                      cartList[widget.i].productName,
                      style: const TextStyle(
                          color: colors.textColor, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        cartList[widget.i].productPrice,
                        style: const TextStyle(
                            color: colors.buttonColor, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          cartList[widget.i].productDiscount,
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
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
                    cartList[widget.i].productWeight,
                    style:
                        const TextStyle(color: colors.greyText, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: colors.boxBorder)),
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none),
                      ),
                      hint: const Text(
                        'Qty 1',
                        style: TextStyle(fontSize: 14, color: colors.textColor),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 12, color: colors.textColor),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Select Quantity.';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: colors.textColor,
                        ),
                        iconSize: 18,
                      ),
                      dropdownStyleData: DropdownStyleData(
                          elevation: 8,
                          decoration: BoxDecoration(
                            color: colors.textFieldBG,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: colors.boxBorder),
                          )),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: colors.boxBorder)),
                child: const Text(
                  "Save for later",
                  style: TextStyle(color: colors.textColor, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: colors.boxBorder)),
                child: InkWell(
                  onTap: () {
                    showToastMessage("Item remove from cart");
                  },
                  child: const Text(
                    "Remove from cart",
                    style: TextStyle(color: colors.textColor, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
