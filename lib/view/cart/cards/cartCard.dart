import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/cart/model/cartModel.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/toast_message.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

cartCard(
  CartProduct model,
  BuildContext context,
  CartViewModel cartProvider,
) {
  List<String> quantity = [];
  String? selectedValue;

  for (int i = 1; i < model.currentStock + 1; i++) {
    quantity.add("$i");
  }
  print("here");

  return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            // gradient: LinearGradient(
            //   colors: [
            //     colors.boxGradient1.withOpacity(1),
            //     Colors.transparent,
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            border: Border.all(color: colors.boxBorder)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Routes.navigateToProductDetailPageScreen(context);
                    },
                    child: Image.network(
                      model.images[0],
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
                          model.name,
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
                            model.purchasePrice,
                            style: const TextStyle(
                                color: colors.buttonColor, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              model.discount.toString(),
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
                        model.code,
                        style: const TextStyle(
                            color: colors.greyText, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
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
                            style: TextStyle(
                                fontSize: 14, color: colors.textColor),
                          ),
                          items: quantity
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      "Qty $item",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: colors.textColor),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Select Quantity.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            selectedValue = value.toString();
                            Map data = {
                              'key': model.cartId.toString(),
                              'quantity': selectedValue.toString()
                            };
                            cartProvider.updateCart(data, context);
                            print(selectedValue);
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                            // print(selectedValue);
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
                  InkWell(
                    onTap: () {
                      Map data = {'product_id': model.id.toString()};
                      cartProvider.addToSaveLater(data, context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: colors.boxBorder)),
                      child: const Text(
                        "Save for later",
                        style: TextStyle(color: colors.textColor, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: colors.boxBorder)),
                    child: InkWell(
                      onTap: () {
                        Map data = {'key': model.cartId.toString()};
                        cartProvider.removeFromCart(data, context);
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
        ),
      ));
}

Column cartCardRow(
  BuildContext context,
  List<CartProduct> model,
  CartViewModel cartProvider,
) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: List.generate(
              model.length,
              (index) => cartCard(model[index], context, cartProvider),
            ),
          ),
        )
      ],
    );
