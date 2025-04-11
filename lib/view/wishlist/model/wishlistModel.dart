// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) =>
    WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  bool status;
  String message;
  List<WishlistItem> data;

  WishlistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        status: json["status"],
        message: json["message"],
        data: List<WishlistItem>.from(
            json["data"].map((x) => WishlistItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WishlistItem {
  int id;
  int customerId;
  int productId;
  String createdAt;
  String updatedAt;
  WishlistItemProduct product;

  WishlistItem({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) => WishlistItem(
        id: json["id"],
        customerId: json["customer_id"],
        productId: json["product_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        product: WishlistItemProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "product_id": productId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product": product.toJson(),
      };
}

class WishlistItemProduct {
  int id;
  List<CategoryId> categoryIds;
  int userId;
  Shop shop;
  String name;
  String slug;
  List<String> images;
  List<ColorsImage> colorImage;
  String thumbnail;
  int brandId;
  String unit;
  int minQty;
  int featured;
  String refundable;
  int variantProduct;
  List<dynamic> attributes;
  List<ChoiceOption> choiceOptions;
  List<dynamic> variation;
  String weight;
  int published;
  String unitPrice;
  String specialPrice;
  String purchasePrice;
  int tax;
  String taxType;
  String taxModel;
  String taxAmount;
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
  String shareLink;
  List<dynamic> reviews;
  List<dynamic> colorsFormatted;
  bool isFavorite;
  bool isCart;
  int cart_id;

  WishlistItemProduct(
      {required this.id,
      required this.categoryIds,
      required this.userId,
      required this.shop,
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
      required this.weight,
      required this.published,
      required this.unitPrice,
      required this.specialPrice,
      required this.purchasePrice,
      required this.tax,
      required this.taxType,
      required this.taxModel,
      required this.taxAmount,
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
      required this.shareLink,
      required this.reviews,
      required this.colorsFormatted,
      required this.isFavorite,
      required this.isCart,
      required this.cart_id});

  factory WishlistItemProduct.fromJson(Map<String, dynamic> json) =>
      WishlistItemProduct(
        id: json["id"],
        categoryIds: List<CategoryId>.from(
            json["category_ids"].map((x) => CategoryId.fromJson(x))),
        userId: json["user_id"],
        shop: Shop.fromJson(json["shop"]),
        name: json["name"],
        slug: json["slug"],
        images: List<String>.from(json["images"].map((x) => x)),
        colorImage: List<ColorsImage>.from(
            json["color_image"].map((x) => ColorsImage.fromJson(x))),
        thumbnail: json["thumbnail"],
        brandId: json["brand_id"],
        unit: json["unit"],
        minQty: json["min_qty"],
        featured: json["featured"],
        refundable: json["refundable"],
        variantProduct: json["variant_product"],
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        choiceOptions: List<ChoiceOption>.from(
            json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        weight: json["weight"],
        published: json["published"],
        unitPrice: json["unit_price"],
        specialPrice: json["special_price"],
        purchasePrice: json["purchase_price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        taxModel: json["tax_model"],
        taxAmount: json["tax_amount"],
        discount: json["discount"],
        discountType: json["discount_type"],
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        freeShipping: json["free_shipping"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"],
        featuredStatus: json["featured_status"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        requestStatus: json["request_status"],
        shippingCost: json["shipping_cost"],
        multiplyQty: json["multiply_qty"],
        code: json["code"],
        reviewsCount: json["reviews_count"],
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
        shareLink: json["share_link"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        colorsFormatted:
            List<dynamic>.from(json["colors_formatted"].map((x) => x)),
        isFavorite: json["is_favorite"],
        isCart: json["is_cart"],
        cart_id: json["cart_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
        "user_id": userId,
        "shop": shop.toJson(),
        "name": name,
        "slug": slug,
        "images": List<dynamic>.from(images.map((x) => x)),
        "color_image": List<dynamic>.from(colorImage.map((x) => x)),
        "thumbnail": thumbnail,
        "brand_id": brandId,
        "unit": unit,
        "min_qty": minQty,
        "featured": featured,
        "refundable": refundable,
        "variant_product": variantProduct,
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "choice_options":
            List<dynamic>.from(choiceOptions.map((x) => x.toJson())),
        "variation": List<dynamic>.from(variation.map((x) => x)),
        "weight": weight,
        "published": published,
        "unit_price": unitPrice,
        "special_price": specialPrice,
        "purchase_price": purchasePrice,
        "tax": tax,
        "tax_type": taxType,
        "tax_model": taxModel,
        "tax_amount": taxAmount,
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
        "share_link": shareLink,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "colors_formatted": List<dynamic>.from(colorsFormatted.map((x) => x)),
        "is_favorite": isFavorite,
        "is_cart": isCart,
        "cart_id": cart_id,
      };
}

class CategoryId {
  String id;
  int position;

  CategoryId({
    required this.id,
    required this.position,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["id"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
      };
}

class ColorsImage {
  String color;
  String image_name;

  ColorsImage({
    required this.color,
    required this.image_name,
  });

  factory ColorsImage.fromJson(Map<String, dynamic> json) => ColorsImage(
        color: json["color"],
        image_name: json["image_name"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "image_name": image_name,
      };
}

class ChoiceOption {
  String name;
  String title;
  List<String> options;

  ChoiceOption({
    required this.name,
    required this.title,
    required this.options,
  });

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
        name: json["name"],
        title: json["title"],
        options: List<String>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "options": List<dynamic>.from(options.map((x) => x)),
      };
}

class Shop {
  String id;
  String sellerId;
  String name;
  String address;
  String contact;
  String image;
  String bottomBanner;
  String vacationStartDate;
  String vacationEndDate;
  String vacationNote;
  int vacationStatus;
  int temporaryClose;
  String createdAt;
  String updatedAt;
  String rating;
  String followers;
  String isVerified;
  String isFollowing;
  String banner;

  Shop({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.contact,
    required this.image,
    required this.bottomBanner,
    required this.vacationStartDate,
    required this.vacationEndDate,
    required this.vacationNote,
    required this.vacationStatus,
    required this.temporaryClose,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.followers,
    required this.isVerified,
    required this.isFollowing,
    required this.banner,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        sellerId: json["seller_id"],
        name: json["name"],
        address: json["address"],
        contact: json["contact"],
        image: json["image"],
        bottomBanner: json["bottom_banner"],
        vacationStartDate: json["vacation_start_date"],
        vacationEndDate: json["vacation_end_date"],
        vacationNote: json["vacation_note"],
        vacationStatus: json["vacation_status"],
        temporaryClose: json["temporary_close"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        rating: json["rating"],
        followers: json["followers"],
        isVerified: json["is_verified"],
        isFollowing: json["is_following"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "name": name,
        "address": address,
        "contact": contact,
        "image": image,
        "bottom_banner": bottomBanner,
        "vacation_start_date": vacationStartDate,
        "vacation_end_date": vacationEndDate,
        "vacation_note": vacationNote,
        "vacation_status": vacationStatus,
        "temporary_close": temporaryClose,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "rating": rating,
        "followers": followers,
        "is_verified": isVerified,
        "is_following": isFollowing,
        "banner": banner,
      };
}
