import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//use when getting image from url
getImageFromNewtork({
  required BuildContext context,
  required String url,
  double? height = 12,
  BoxFit boxFit = BoxFit.fill,
}) {
  return CachedNetworkImage(
    imageBuilder: (context, imageProvider) => Container(
      child: Image(
        image: imageProvider,
        fit: boxFit,
      ),
    ),
    fit: boxFit,
    imageUrl: url,
    height: height,
    placeholder: _loader,
    errorWidget: _error,
    maxHeightDiskCache: 150,
    maxWidthDiskCache: 150,
    filterQuality: FilterQuality.low,
  );
}

Widget _loader(BuildContext context, String url) {
  return Center(
    child: Container(
      color: Colors.grey,
    ),
  );
}

Widget _error(BuildContext context, String url, dynamic error) {
  return const Center(child: Icon(Icons.error));
}

// use when getting image from assets
Widget getImageFromAssets(
    {required String name, double? height = 12, BoxFit boxFit = BoxFit.fill}) {
  return Image.asset(
    name,
    fit: boxFit,
    height: height,
  );
}
