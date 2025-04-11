import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/view/profile/common_header.dart';
import 'package:alpha_ecommerce_18oct/view/widget_common/common_header.dart';
import 'package:flutter/material.dart';

class CommanAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;

  const CommanAppbar({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.transparent
          : colors.buttonColor,
      flexibleSpace: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : colors.buttonColor,
        child: Stack(
          children: [
            ProfileHeader(),
            InternalDetailPageHeader(
              text: appbarTitle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
