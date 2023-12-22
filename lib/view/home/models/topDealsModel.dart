import 'package:alpha_ecommerce_18oct/view/home/models/productsModel.dart';

class TopDealsModel {
  bool? status;
  String? message;
  Data? data;

  TopDealsModel({this.status, this.message, this.data});

  TopDealsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  FrameOne? frameOne;
  TopDealProduct? topDealProduct;
  GiftSection? giftSection;
  SummerSaleBanner? summerSaleBanner;
  PrimeTimeBanner? primeTimeBanner;

  Data(
      {this.frameOne,
      this.topDealProduct,
      this.giftSection,
      this.summerSaleBanner,
      this.primeTimeBanner});

  Data.fromJson(Map<String, dynamic> json) {
    frameOne = json['frame_one'] != null
        ? new FrameOne.fromJson(json['frame_one'])
        : null;
    topDealProduct = json['top_deal_product'] != null
        ? new TopDealProduct.fromJson(json['top_deal_product'])
        : null;
    giftSection = json['gift_section'] != null
        ? new GiftSection.fromJson(json['gift_section'])
        : null;
    summerSaleBanner = json['summer_sale_banner'] != null
        ? new SummerSaleBanner.fromJson(json['summer_sale_banner'])
        : null;
    primeTimeBanner = json['prime_time_banner'] != null
        ? new PrimeTimeBanner.fromJson(json['prime_time_banner'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.frameOne != null) {
      data['frame_one'] = this.frameOne!.toJson();
    }
    if (this.topDealProduct != null) {
      data['top_deal_product'] = this.topDealProduct!.toJson();
    }
    if (this.giftSection != null) {
      data['gift_section'] = this.giftSection!.toJson();
    }
    if (this.summerSaleBanner != null) {
      data['summer_sale_banner'] = this.summerSaleBanner!.toJson();
    }
    if (this.primeTimeBanner != null) {
      data['prime_time_banner'] = this.primeTimeBanner!.toJson();
    }
    return data;
  }
}

class FrameOne {
  String? label1;
  String? label2;
  String? label3;

  FrameOne({this.label1, this.label2, this.label3});

  FrameOne.fromJson(Map<String, dynamic> json) {
    label1 = json['label_1'];
    label2 = json['label_2'];
    label3 = json['label_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label_1'] = this.label1;
    data['label_2'] = this.label2;
    data['label_3'] = this.label3;
    return data;
  }
}

class TopDealProduct {
  String? title;
  String? productIds;
  List<ProductList2>? products;

  TopDealProduct({this.title, this.productIds, this.products});

  TopDealProduct.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    productIds = json['product_ids'];
    if (json['products'] != null) {
      products = <ProductList2>[];
      json['products'].forEach((v) {
        products!.add(new ProductList2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['product_ids'] = this.productIds;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList2 {
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
  int refundable;
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

  ProductList2({
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
  });

  factory ProductList2.fromJson(Map<String, dynamic> json) => ProductList2(
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
      };
}

class Rating {
  String? average;
  int? productId;

  Rating({this.average, this.productId});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['product_id'] = this.productId;
    return data;
  }
}

class Reviews {
  int? id;
  int? productId;
  int? customerId;
  String? comment;
  String? attachment;
  int? rating;
  int? status;
  int? isSaved;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
      this.productId,
      this.customerId,
      this.comment,
      this.attachment,
      this.rating,
      this.status,
      this.isSaved,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    comment = json['comment'];
    attachment = json['attachment'];
    rating = json['rating'];
    status = json['status'];
    isSaved = json['is_saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['customer_id'] = this.customerId;
    data['comment'] = this.comment;
    data['attachment'] = this.attachment;
    data['rating'] = this.rating;
    data['status'] = this.status;
    data['is_saved'] = this.isSaved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class GiftSection {
  String? giftTitle;
  String? giftProductIds;
  List<Products2>? products;

  GiftSection({this.giftTitle, this.giftProductIds, this.products});

  GiftSection.fromJson(Map<String, dynamic> json) {
    giftTitle = json['gift_title'];
    giftProductIds = json['gift_product_ids'];
    if (json['products'] != null) {
      products = <Products2>[];
      json['products'].forEach((v) {
        products!.add(new Products2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_title'] = this.giftTitle;
    data['gift_product_ids'] = this.giftProductIds;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products2 {
  int? id;
  List<CategoryIds>? categoryIds;
  int? userId;
  Shop? shop;
  String? name;
  String? slug;
  List<String>? images;
  List<Null>? colorImage;
  String? thumbnail;
  int? brandId;
  String? unit;
  int? minQty;
  int? featured;
  int? refundable;
  int? variantProduct;
  String? weight;
  int? published;
  String? unitPrice;
  String? specialPrice;
  String? purchasePrice;
  int? tax;
  String? taxType;
  String? taxModel;
  String? taxAmount;
  int? discount;
  String? discountType;
  int? currentStock;
  int? minimumOrderQty;
  int? freeShipping;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  String? shippingCost;
  int? multiplyQty;
  String? code;
  int? reviewsCount;
  String? shareLink;
  bool? isFavorite;
  bool? isCart;
  int? cartId;

  Products2(
      {this.id,
      this.categoryIds,
      this.userId,
      this.shop,
      this.name,
      this.slug,
      this.images,
      this.colorImage,
      this.thumbnail,
      this.brandId,
      this.unit,
      this.minQty,
      this.featured,
      this.refundable,
      this.variantProduct,
      this.weight,
      this.published,
      this.unitPrice,
      this.specialPrice,
      this.purchasePrice,
      this.tax,
      this.taxType,
      this.taxModel,
      this.taxAmount,
      this.discount,
      this.discountType,
      this.currentStock,
      this.minimumOrderQty,
      this.freeShipping,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.featuredStatus,
      this.metaTitle,
      this.metaDescription,
      this.metaImage,
      this.requestStatus,
      this.shippingCost,
      this.multiplyQty,
      this.code,
      this.reviewsCount,
      this.shareLink,
      this.isFavorite,
      this.isCart,
      this.cartId});

  Products2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    userId = json['user_id'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    name = json['name'];
    slug = json['slug'];
    images = json['images'].cast<String>();

    thumbnail = json['thumbnail'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    featured = json['featured'];
    refundable = json['refundable'];
    variantProduct = json['variant_product'];

    weight = json['weight'];
    published = json['published'];
    unitPrice = json['unit_price'];
    specialPrice = json['special_price'];
    purchasePrice = json['purchase_price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    taxModel = json['tax_model'];
    taxAmount = json['tax_amount'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    minimumOrderQty = json['minimum_order_qty'];
    freeShipping = json['free_shipping'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = json['request_status'];
    shippingCost = json['shipping_cost'];
    multiplyQty = json['multiply_qty'];
    code = json['code'];
    reviewsCount = json['reviews_count'];
    shareLink = json['share_link'];
    isFavorite = json['is_favorite'];
    isCart = json['is_cart'];
    cartId = json['cart_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
    data['user_id'] = this.userId;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['images'] = this.images;

    data['thumbnail'] = this.thumbnail;
    data['brand_id'] = this.brandId;
    data['unit'] = this.unit;
    data['min_qty'] = this.minQty;
    data['featured'] = this.featured;
    data['refundable'] = this.refundable;
    data['variant_product'] = this.variantProduct;
    data['weight'] = this.weight;
    data['published'] = this.published;
    data['unit_price'] = this.unitPrice;
    data['special_price'] = this.specialPrice;
    data['purchase_price'] = this.purchasePrice;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['tax_model'] = this.taxModel;
    data['tax_amount'] = this.taxAmount;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['current_stock'] = this.currentStock;
    data['minimum_order_qty'] = this.minimumOrderQty;
    data['free_shipping'] = this.freeShipping;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['featured_status'] = this.featuredStatus;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_image'] = this.metaImage;
    data['request_status'] = this.requestStatus;
    data['shipping_cost'] = this.shippingCost;
    data['multiply_qty'] = this.multiplyQty;
    data['code'] = this.code;
    data['reviews_count'] = this.reviewsCount;
    data['is_favorite'] = this.isFavorite;
    data['is_cart'] = this.isCart;
    data['cart_id'] = this.cartId;
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class Shop {
  int? id;
  int? sellerId;
  String? name;
  String? address;
  String? contact;
  String? image;
  String? bottomBanner;
  String? vacationStartDate;
  String? vacationEndDate;
  String? vacationNote;
  int? vacationStatus;
  int? temporaryClose;
  String? createdAt;
  String? updatedAt;
  String? rating;
  String? followers;
  String? isVerified;
  String? isFollowing;
  String? banner;

  Shop(
      {this.id,
      this.sellerId,
      this.name,
      this.address,
      this.contact,
      this.image,
      this.bottomBanner,
      this.vacationStartDate,
      this.vacationEndDate,
      this.vacationNote,
      this.vacationStatus,
      this.temporaryClose,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.followers,
      this.isVerified,
      this.isFollowing,
      this.banner});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    image = json['image'];
    bottomBanner = json['bottom_banner'];
    vacationStartDate = json['vacation_start_date'];
    vacationEndDate = json['vacation_end_date'];
    vacationNote = json['vacation_note'];
    vacationStatus = json['vacation_status'];
    temporaryClose = json['temporary_close'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'];
    followers = json['followers'];
    isVerified = json['is_verified'];
    isFollowing = json['is_following'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['image'] = this.image;
    data['bottom_banner'] = this.bottomBanner;
    data['vacation_start_date'] = this.vacationStartDate;
    data['vacation_end_date'] = this.vacationEndDate;
    data['vacation_note'] = this.vacationNote;
    data['vacation_status'] = this.vacationStatus;
    data['temporary_close'] = this.temporaryClose;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['followers'] = this.followers;
    data['is_verified'] = this.isVerified;
    data['is_following'] = this.isFollowing;
    data['banner'] = this.banner;
    return data;
  }
}

class SummerSaleBanner {
  String? image;
  String? discountPercent;

  SummerSaleBanner({this.image, this.discountPercent});

  SummerSaleBanner.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    discountPercent = json['discount_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['discount_percent'] = this.discountPercent;
    return data;
  }
}

class PrimeTimeBanner {
  String? image;

  PrimeTimeBanner({this.image});

  PrimeTimeBanner.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
