import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

savedItemCard(
    WishlistItemProduct model, BuildContext context, CartViewModel provider) {
  final List<String> quantity = [
    'Qty 1',
    'Qty 2',
    'Qty 3',
  ];
  String? selectedValue;
  return Container(
    height: 200,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.boxBorder)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Routes.navigateToProductDetailPageScreen(
                        context, model as ProductList);
                  },
                  child: Image.network(
                    model.images[0],
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Routes.navigateToProductDetailPageScreen(
                          context, model as ProductList);
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
                        model.specialPrice,
                        style: const TextStyle(
                            color: colors.buttonColor, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          model.unitPrice,
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
                    model.weight,
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
                        style: TextStyle(fontSize: 14, color: colors.textColor),
                      ),
                      items: quantity
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
              InkWell(
                onTap: () async {
                  Map data = {
                    'product_id': model.id.toString(),
                  };
                  print(data);
                  await provider.addToSaveLater(data, context);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: colors.boxBorder)),
                  child: const Text(
                    "Remove from Saved Items",
                    style: TextStyle(color: colors.textColor, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Map data = {
                    'id': model.id.toString(),
                    'quantity': "1",
                    'color': model.colorImage.isNotEmpty
                        ? "#" + model.colorImage[0].color
                        : "",
                    'choice_2': model.choiceOptions.isNotEmpty
                        ? model.choiceOptions[0].options[0]
                        : ""
                  };
                  print(data);
                  await provider.addToCart(data, context);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: colors.boxBorder)),
                  child: const Text(
                    "Add to Cart",
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
  );
}

Column savedCardsRow(BuildContext context, List<WishlistItem> model,
        CartViewModel provider) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: List.generate(
              model.length,
              (index) => savedItemCard(model[index].product, context, provider),
            ),
          ),
        )
      ],
    );
