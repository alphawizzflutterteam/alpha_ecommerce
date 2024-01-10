import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/utils/shared_pref..dart';
import 'package:alpha_ecommerce_18oct/view/profile/address/model/addressModel.dart';
import 'package:alpha_ecommerce_18oct/view/wishlist/model/wishlistModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/addressViewModel.dart';
import 'package:alpha_ecommerce_18oct/viewModel/cartViewModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

addressItemCard(AddressList model, BuildContext context,
    AddressViewModel provider, int index, bool isComingForSelection) {
  void actionPopUpItemSelected(String value, int index) {
    // _scaffoldkey.currentState.hideCurrentSnackBar();
    if (value == 'edit') {
      Routes.navigateToEditAddressScreen(context, provider.addressList[index]);
    } else if (value == 'delete') {
      provider.deleteAddress(context, model.id.toString());
    } else {}
  }

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: colors.boxBorder)),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Radio(
                  activeColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  value: model.id,
                  groupValue: provider.selectedId,
                  onChanged: (value) {
                    provider.setselected(
                        value!, model, isComingForSelection, context);
                  },
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.contactPersonName,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: size_12),
                      ),
                      const SizedBox(
                        height: size_10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          "${model.address}, ${model.address1}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: size_10),
                        ),
                      ),
                      const SizedBox(
                        height: size_5,
                      ),
                      Text(
                        model.phone,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: size_10),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Theme.of(context).brightness == Brightness.dark
                  ? colors.darkBG
                  : Colors.white,
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Theme.of(context).brightness != Brightness.dark
                            ? colors.darkBG
                            : Colors.white,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Theme.of(context).brightness != Brightness.dark
                            ? colors.darkBG
                            : Colors.white,
                      ),
                    ),
                  )
                ];
              },
              onSelected: (String value) =>
                  actionPopUpItemSelected(value, index),
            ),
          ),
        ])),
  );
}

Column addressCardsRow(BuildContext context, List<AddressList> model,
        AddressViewModel provider, bool isComingForSelection) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: List.generate(
              model.length,
              (index) => addressItemCard(
                  model[index], context, provider, index, isComingForSelection),
            ),
          ),
        )
      ],
    );
