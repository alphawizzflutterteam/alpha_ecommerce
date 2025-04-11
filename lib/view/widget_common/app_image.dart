import 'package:alpha_ecommerce_18oct/view/widget_common/appLoader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, required this.image, this.fit, this.width, this.height});

 final String image;
  final BoxFit? fit ;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit ?? BoxFit.fitWidth,
      width: width,
      height: height,
      errorWidget: (context, url, error) => Image.asset('assets/images/logo-without-text.png',opacity: const AlwaysStoppedAnimation(.5),),
      placeholder: (context, url) => appLoader(),
    );
  }
}
