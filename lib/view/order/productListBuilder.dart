import 'package:alpha_ecommerce_18oct/utils/app_dimens/app_dimens.dart';
import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:alpha_ecommerce_18oct/utils/routes.dart';
import 'package:alpha_ecommerce_18oct/view/order/model/orderDetailModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListBuilder extends StatelessWidget {
  final List<Product> productList;

  const ProductListBuilder({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .23,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.builder(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Routes.navigateToProductDetailPageScreen(
                  context, productList[index].productDetails!.slug!);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  // image: DecorationImage(image: NetworkImage(model.images.first)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: Theme.of(context).brightness == Brightness.dark
                      ? LinearGradient(
                          colors: [
                            colors.boxGradient1.withOpacity(1),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : LinearGradient(
                          colors: [
                            Color(0xFFE4E2ED),
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                  border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? colors.boxBorder
                          : colors.lightBorder)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: productList[index].productDetails!.thumbnail!,
                      height: size_100,
                      errorWidget: (context, url, error) => Image.asset(
                        Images.defaultProductImg,
                        height: size_100,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    productList[index].productDetails!.name.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    productList[index].price.toString(),
                    style: TextStyle(
                      color: colors.buttonColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
