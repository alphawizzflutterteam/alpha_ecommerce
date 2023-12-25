import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';

class ProductDetailModel {
  bool? status;
  String? message;
  List<ProductList>? relatedProducts;

  ProductDetailModel({this.status, this.message, this.relatedProducts});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['related_products'] != null) {
      relatedProducts = <ProductList>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(ProductList.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['status'] = status;
  //   data['message'] = message;
  //   if (relatedProducts != null) {
  //     data['related_products'] =
  //         relatedProducts!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
