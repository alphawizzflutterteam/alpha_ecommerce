// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  int totalSize;
  int limit;
  int offset;
  List<Product> products;

  ProductsModel({
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "limit": limit,
        "offset": offset,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  int userId;
  String name;
  String slug;
  List<String> images;
  dynamic colorImage;
  String thumbnail;
  int brandId;
  String unit;
  int minQty;
  dynamic featured;
  int refundable;
  int variantProduct;
  List<dynamic> attributes;
  List<dynamic> choiceOptions;
  List<dynamic> variation;
  int published;
  String unitPrice;
  String purchasePrice;
  int tax;
  String taxType;
  String taxModel;
  int discount;
  String discountType;
  int currentStock;
  int minimumOrderQty;
  int freeShipping;
  String createdAt;
  String updatedAt;
  int status;
  int featuredStatus;
  String metaTitle;
  String metaDescription;
  String metaImage;
  int requestStatus;
  String shippingCost;
  int multiplyQty;
  String code;
  int reviewsCount;
  List<dynamic> rating;
  List<dynamic> tags;
  List<dynamic> translations;
  List<dynamic> reviews;
  List<ColorsFormatted> colorsFormatted;
  bool isFavorite;
  bool isCart;

  Product({
    required this.id,
    required this.userId,
    required this.name,
    required this.slug,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.featured,
    required this.refundable,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.published,
    required this.unitPrice,
    required this.purchasePrice,
    required this.tax,
    required this.taxType,
    required this.taxModel,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.freeShipping,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.shippingCost,
    required this.multiplyQty,
    required this.code,
    required this.reviewsCount,
    required this.rating,
    required this.tags,
    required this.translations,
    required this.reviews,
    required this.colorsFormatted,
    required this.isFavorite,
    required this.isCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        images: List<String>.from(json["images"].map((x) => x)),
        colorImage: json["color_image"],
        thumbnail: json["thumbnail"],
        brandId: json["brand_id"],
        unit: json["unit"]!,
        minQty: json["min_qty"],
        featured: json["featured"],
        refundable: json["refundable"],
        variantProduct: json["variant_product"],
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        published: json["published"],
        unitPrice: json["unit_price"],
        purchasePrice: json["purchase_price"],
        tax: json["tax"],
        taxType: json["tax_type"]!,
        taxModel: json["tax_model"]!,
        discount: json["discount"],
        discountType: json["discount_type"]!,
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        freeShipping: json["free_shipping"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"],
        featuredStatus: json["featured_status"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"]!,
        requestStatus: json["request_status"],
        shippingCost: json["shipping_cost"]!,
        multiplyQty: json["multiply_qty"],
        code: json["code"],
        reviewsCount: json["reviews_count"],
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        colorsFormatted: List<ColorsFormatted>.from(
            json["colors_formatted"].map((x) => ColorsFormatted.fromJson(x))),
        isFavorite: json["is_favorite"],
        isCart: json["is_cart"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "images": List<dynamic>.from(images.map((x) => x)),
        "color_image": colorImage,
        "thumbnail": thumbnail,
        "brand_id": brandId,
        "unit": unit,
        "min_qty": minQty,
        "featured": featured,
        "refundable": refundable,
        "variant_product": variantProduct,
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "choice_options": List<dynamic>.from(choiceOptions.map((x) => x)),
        "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
        "published": published,
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "tax": tax,
        "tax_type": taxType,
        "tax_model": taxModel,
        "discount": discount,
        "discount_type": discountType,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "free_shipping": freeShipping,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status,
        "featured_status": featuredStatus,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "request_status": requestStatus,
        "shipping_cost": shippingCost,
        "multiply_qty": multiplyQty,
        "code": code,
        "reviews_count": reviewsCount,
        "rating": List<dynamic>.from(rating.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "translations": List<dynamic>.from(translations.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "colors_formatted":
            List<dynamic>.from(colorsFormatted.map((x) => x.toJson())),
        "is_favorite": isFavorite,
        "is_cart": isCart,
      };
}

class ColorImageElement {
  String color;
  String imageName;

  ColorImageElement({
    required this.color,
    required this.imageName,
  });

  factory ColorImageElement.fromJson(Map<String, dynamic> json) =>
      ColorImageElement(
        color: json["color"],
        imageName: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "image_name": imageName,
      };
}

class ColorsFormatted {
  String name;
  String code;

  ColorsFormatted({
    required this.name,
    required this.code,
  });

  factory ColorsFormatted.fromJson(Map<String, dynamic> json) =>
      ColorsFormatted(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
