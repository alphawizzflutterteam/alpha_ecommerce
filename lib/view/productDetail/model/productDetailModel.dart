import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';

class ProductDetailModel {
  bool? status;
  String? message;
  List<ProductListDetail>? products;

  List<ProductList>? relatedProducts;

  ProductDetailModel(
      {this.status, this.message, this.products, this.relatedProducts});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      products = <ProductListDetail>[];
      json['data'].forEach((v) {
        products!.add(ProductListDetail.fromJson(v));
      });
    }
    if (json['related_products'] != null) {
      relatedProducts = <ProductList>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    if (relatedProducts != null) {
      data['related_products'] =
          relatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductListDetail {
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
  dynamic featured;
  String refundable;
  int variantProduct;
  List<int> attributes;
  List<ChoiceOption> choiceOptions;
  List<Variation> variation;
  String weight;
  int published;
  String unitPrice;
  String specialPrice;
  String purchasePrice;
  int tax;
  String taxType;
  String taxModel;
  String taxAmount;
  double discount;
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
  List<Rating> rating;
  List<Tag> tags;
  List<dynamic> translations;
  String shareLink;
  List<Review> reviews;
  List<ColorsFormatted> colorsFormatted;
  bool isFavorite;
  bool isCart;
  int cart_id;
  String manufacturing_date;
  String made_in;
  String warranty;
  String use_coins_with_amount;
  String amount_after_coin_use;
  int average_review;
  String inhouse_vacation_start_date;
  String inhouse_vacation_end_date;
  bool inhouse_temporary_close;

  ProductListDetail({
    required this.id,
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
    required this.cart_id,
    required this.manufacturing_date,
    required this.made_in,
    required this.warranty,
    required this.use_coins_with_amount,
    required this.amount_after_coin_use,
    required this.average_review,
    required this.inhouse_vacation_start_date,
    required this.inhouse_vacation_end_date,
    required this.inhouse_temporary_close,
  });

  factory ProductListDetail.fromJson(Map<String, dynamic> json) =>
      ProductListDetail(
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
        unit: json["unit"]!,
        minQty: json["min_qty"],
        featured: json["featured"],
        refundable: json["refundable"],
        variantProduct: json["variant_product"],
        attributes: List<int>.from(json["attributes"].map((x) => x)),
        choiceOptions: List<ChoiceOption>.from(
            json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
        variation: List<Variation>.from(
            json["variation"].map((x) => Variation.fromJson(x))),
        weight: json["weight"]!,
        published: json["published"],
        unitPrice: json["unit_price"],
        specialPrice: json["special_price"],
        purchasePrice: json["purchase_price"],
        tax: json["tax"],
        taxType: json["tax_type"]!,
        taxModel: json["tax_model"]!,
        taxAmount: json["tax_amount"],
        discount: json["discount"]?.toDouble(),
        discountType: json["discount_type"]!,
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        freeShipping: json["free_shipping"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"],
        featuredStatus: json["featured_status"],
        metaTitle: json["meta_title"]!,
        metaDescription: json["meta_description"]!,
        metaImage: json["meta_image"]!,
        requestStatus: json["request_status"],
        shippingCost: json["shipping_cost"]!,
        multiplyQty: json["multiply_qty"],
        code: json["code"],
        reviewsCount: json["reviews_count"],
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
        shareLink: json["share_link"],
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        colorsFormatted: List<ColorsFormatted>.from(
            json["colors_formatted"].map((x) => ColorsFormatted.fromJson(x))),
        isFavorite: json["is_favorite"],
        isCart: json["is_cart"],
        cart_id: json["cart_id"],
        manufacturing_date: json["manufacturing_date"],
        made_in: json["made_in"],
        warranty: json["warranty"],
        use_coins_with_amount: json["use_coins_with_amount"],
        amount_after_coin_use: json["amount_after_coin_use"],
        average_review: json["average_review"],
        inhouse_vacation_start_date: json["inhouse_vacation_start_date"],
        inhouse_vacation_end_date: json["inhouse_vacation_end_date"],
        inhouse_temporary_close: json["inhouse_temporary_close"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
        "user_id": userId,
        "shop": shop.toJson(),
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
        "choice_options":
            List<dynamic>.from(choiceOptions.map((x) => x.toJson())),
        "variation": List<dynamic>.from(variation.map((x) => x.toJson())),
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
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "translations": List<dynamic>.from(translations.map((x) => x)),
        "share_link": shareLink,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "colors_formatted":
            List<dynamic>.from(colorsFormatted.map((x) => x.toJson())),
        "is_favorite": isFavorite,
        "is_cart": isCart,
        "cart_id": cart_id,
        "manufacturing_date": manufacturing_date,
        "made_in": made_in,
        "warranty": warranty,
        "use_coins_with_amount": use_coins_with_amount,
        "amount_after_coin_use": amount_after_coin_use,
        "average_review": average_review,
        "inhouse_vacation_start_date": inhouse_vacation_start_date,
        "inhouse_vacation_end_date": inhouse_vacation_end_date,
        "inhouse_temporary_close": inhouse_temporary_close,
      };
}
