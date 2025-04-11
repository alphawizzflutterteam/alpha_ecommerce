import '../../home/models/productsModel.dart';

class OrderDetailsModel {
  OrderDetailsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.recommendedProducts,
  });

  bool? status;
  String? message;
  DetailsData? data;
  List<ProductList> recommendedProducts;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    final List<ProductList> Products = [];
    json['recommended_products'].forEach((v) {
      Products.add(ProductList.fromJson(v));
    });
    return OrderDetailsModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : DetailsData.fromJson(json["data"]),
      recommendedProducts: Products,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DetailsData {
  DetailsData({
    required this.orderId,
    required this.seller,
    required this.products,
    required this.orderStatusHistory,
    required this.orderReviews,
    required this.orderAmount,
    required this.subtotal,
    required this.discountAmount,
    required this.deliveryCharge,
    required this.orderStatus,
    required this.payment_method,
    required this.paymentStatus,
    required this.expectedDeliveryDate,
    required this.orderNote,
    required this.shippingAddress,
  });

  final String? orderId;
  final Seller? seller;
  final List<Product> products;
  final List<OrderStatusHistory> orderStatusHistory;
  final List<OrderRatings> orderReviews;
  final String? orderAmount;
  final String? subtotal;
  final String? discountAmount;
  final String? deliveryCharge;
  final String? orderStatus;
  final String? payment_method;
  final String? paymentStatus;
  final String? expectedDeliveryDate;
  final String? orderNote;
  final ShippingAddress? shippingAddress;

  factory DetailsData.fromJson(Map<String, dynamic> json) {
    return DetailsData(
      orderId: json["order_id"],
      seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
      orderStatusHistory: json["order_status_history"] == null
          ? []
          : List<OrderStatusHistory>.from(json["order_status_history"]!
              .map((x) => OrderStatusHistory.fromJson(x))),
      orderReviews: json["order_review"] == null
          ? []
          : List<OrderRatings>.from(
              json["order_review"]!.map((x) => OrderRatings.fromJson(x))),
      orderAmount: json["order_amount"],
      subtotal: json["subtotal"],
      discountAmount: json["discount_amount"],
      deliveryCharge: json["delivery_charge"],
      orderStatus: json["order_status"],
      payment_method: json["payment_method"] ?? "",
      paymentStatus: json["payment_status"],
      expectedDeliveryDate: json["expected_delivery_date"],
      orderNote: json["order_note"],
      shippingAddress: json["shipping_address_data"] == null
          ? null
          : ShippingAddress.fromJson(json["shipping_address_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "seller": seller?.toJson(),
        "products": products.map((x) => x?.toJson()).toList(),
        "order_status_history":
            orderStatusHistory.map((x) => x?.toJson()).toList(),
        "order_amount": orderAmount,
        "subtotal": subtotal,
        "discount_amount": discountAmount,
        "delivery_charge": deliveryCharge,
        "order_status": orderStatus,
        "payment_method": payment_method,
        "payment_status": paymentStatus,
        "expected_delivery_date": expectedDeliveryDate,
        "order_note": orderNote,
        "shipping_address_data": shippingAddress?.toJson(),
      };
}

// "order_review": [
//           {
//               "comment": "This is testing",
//               "rating": 4
//           }
//       ]
//   },

class OrderRatings {
  OrderRatings(
      {required this.comment, required this.rating, required this.attachment});

  final String? comment;
  final int? rating;
  final List<String> attachment;

  factory OrderRatings.fromJson(Map<String, dynamic> json) {
    return OrderRatings(
      comment: json["comment"],
      rating: json["rating"],
      attachment: json["attachment"] == null
          ? []
          : List<String>.from(json["attachment"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "rating": rating,
        "attachment": attachment.map((x) => x).toList(),
      };
}

class OrderStatusHistory {
  OrderStatusHistory({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.userType,
    required this.status,
    required this.cause,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? orderId;
  final int? userId;
  final String? userType;
  final String? status;
  final String? cause;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) {
    return OrderStatusHistory(
      id: json["id"],
      orderId: json["order_id"],
      userId: json["user_id"],
      userType: json["user_type"],
      status: json["status"] ?? "",
      cause: json["cause"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "user_type": userType,
        "status": status,
        "cause": cause,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Product {
  Product({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.sellerId,
    required this.digitalFileAfterSell,
    required this.productDetails,
    required this.qty,
    required this.price,
    required this.tax,
    required this.discount,
    required this.taxModel,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.shippingMethodId,
    required this.variant,
    required this.discountType,
    required this.isStockDecreased,
    required this.refundRequest,
    required this.customerId,
    required this.customerType,
    required this.orderStatus,
    required this.paymentMethod,
    required this.transactionRef,
    required this.paymentBy,
    required this.paymentNote,
    required this.orderAmount,
    required this.adminCommission,
    required this.isPause,
    required this.cause,
    required this.discountAmount,
    required this.couponCode,
    required this.couponDiscountBearer,
    required this.shippingCost,
    required this.orderGroupId,
    required this.verificationCode,
    required this.sellerIs,
    required this.deliveryManId,
    required this.deliverymanCharge,
    required this.expectedDeliveryDate,
    required this.orderNote,
    required this.billingAddress,
    required this.billingAddressData,
    required this.orderType,
    required this.extraDiscount,
    required this.extraDiscountType,
    required this.checked,
    required this.shippingType,
    required this.deliveryType,
    required this.deliveryServiceName,
    required this.thirdPartyDeliveryTrackingId,
  });

  final int? id;
  final int? orderId;
  final int? productId;
  final int? sellerId;
  final bool? digitalFileAfterSell;
  final ProductDetails? productDetails;
  final int? qty;
  final String? price;
  final String? tax;
  final String? discount;
  final String? taxModel;
  final String? deliveryStatus;
  final String? paymentStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? shippingMethodId;
  final String? variant;
  //final ProductVariation? variation;
  final String? discountType;
  final int? isStockDecreased;
  final int? refundRequest;
  final int? customerId;
  final String? customerType;
  final String? orderStatus;
  final String? paymentMethod;
  final String? transactionRef;
  final String? paymentBy;
  final String? paymentNote;
  final String? orderAmount;
  final String? adminCommission;
  final String? isPause;
  final String? cause;
  // final String? shippingAddress;
  final String? discountAmount;
  final String? couponCode;
  final String? couponDiscountBearer;
  final String? shippingCost;
  final String? orderGroupId;
  final String? verificationCode;
  final String? sellerIs;
  // final String? shippingAddressData;
  final String? deliveryManId;
  final String? deliverymanCharge;
  final String? expectedDeliveryDate;
  final String? orderNote;
  final int? billingAddress;
  final List<dynamic> billingAddressData;
  final String? orderType;
  final int? extraDiscount;
  final String? extraDiscountType;
  final int? checked;
  final String? shippingType;
  final String? deliveryType;
  final String? deliveryServiceName;
  final String? thirdPartyDeliveryTrackingId;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      orderId: json["order_id"],
      productId: json["product_id"],
      sellerId: json["seller_id"],
      digitalFileAfterSell: json["digital_file_after_sell"],
      productDetails: json["product_details"] == null
          ? null
          : ProductDetails.fromJson(json["product_details"]),
      qty: json["qty"],
      price: json["price"],
      tax: json["tax"],
      discount: json["discount"],
      taxModel: json["tax_model"],
      deliveryStatus: json["delivery_status"],
      paymentStatus: json["payment_status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      shippingMethodId: json["shipping_method_id"],
      variant: json["variant"],
      // variation: json["variation"] == null
      //     ? null
      //     : ProductVariation.fromJson(json["variation"]),
      discountType: json["discount_type"],
      isStockDecreased: json["is_stock_decreased"],
      refundRequest: json["refund_request"],
      customerId: json["customer_id"],
      customerType: json["customer_type"],
      orderStatus: json["order_status"],
      paymentMethod: json["payment_method"],
      transactionRef: json["transaction_ref"],
      paymentBy: json["payment_by"],
      paymentNote: json["payment_note"],
      orderAmount: json["order_amount"],
      adminCommission: json["admin_commission"],
      isPause: json["is_pause"],
      cause: json["cause"],
      //shippingAddress: json["shipping_address"],
      discountAmount: json["discount_amount"],
      couponCode: json["coupon_code"],
      couponDiscountBearer: json["coupon_discount_bearer"],
      shippingCost: json["shipping_cost"],
      orderGroupId: json["order_group_id"],
      verificationCode: json["verification_code"],
      sellerIs: json["seller_is"],
      //shippingAddressData: json["shipping_address_data"],
      deliveryManId: json["delivery_man_id"],
      deliverymanCharge: json["deliveryman_charge"],
      expectedDeliveryDate: json["expected_delivery_date"],
      orderNote: json["order_note"],
      billingAddress: json["billing_address"],
      billingAddressData: json["billing_address_data"] == null
          ? []
          : List<dynamic>.from(json["billing_address_data"]!.map((x) => x)),
      orderType: json["order_type"],
      extraDiscount: json["extra_discount"],
      extraDiscountType: json["extra_discount_type"],
      checked: json["checked"],
      shippingType: json["shipping_type"],
      deliveryType: json["delivery_type"],
      deliveryServiceName: json["delivery_service_name"],
      thirdPartyDeliveryTrackingId: json["third_party_delivery_tracking_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "seller_id": sellerId,
        "digital_file_after_sell": digitalFileAfterSell,
        "product_details": productDetails?.toJson(),
        "qty": qty,
        "price": price,
        "tax": tax,
        "discount": discount,
        "tax_model": taxModel,
        "delivery_status": deliveryStatus,
        "payment_status": paymentStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shipping_method_id": shippingMethodId,
        "variant": variant,
        // "variation": variation?.toJson(),
        "discount_type": discountType,
        "is_stock_decreased": isStockDecreased,
        "refund_request": refundRequest,
        "customer_id": customerId,
        "customer_type": customerType,
        "order_status": orderStatus,
        "payment_method": paymentMethod,
        "transaction_ref": transactionRef,
        "payment_by": paymentBy,
        "payment_note": paymentNote,
        "order_amount": orderAmount,
        "admin_commission": adminCommission,
        "is_pause": isPause,
        "cause": cause,
        //"shipping_address": shippingAddress,
        "discount_amount": discountAmount,
        "coupon_code": couponCode,
        "coupon_discount_bearer": couponDiscountBearer,
        "shipping_cost": shippingCost,
        "order_group_id": orderGroupId,
        "verification_code": verificationCode,
        "seller_is": sellerIs,
        //"shipping_address_data": shippingAddressData,
        "delivery_man_id": deliveryManId,
        "deliveryman_charge": deliverymanCharge,
        "expected_delivery_date": expectedDeliveryDate,
        "order_note": orderNote,
        "billing_address": billingAddress,
        "billing_address_data": billingAddressData.map((x) => x).toList(),
        "order_type": orderType,
        "extra_discount": extraDiscount,
        "extra_discount_type": extraDiscountType,
        "checked": checked,
        "shipping_type": shippingType,
        "delivery_type": deliveryType,
        "delivery_service_name": deliveryServiceName,
        "third_party_delivery_tracking_id": thirdPartyDeliveryTrackingId,
      };
}

class ProductDetails {
  ProductDetails({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.name,
    required this.slug,
    required this.productType,
    required this.categoryIds,
    required this.categoryId,
    required this.subCategoryId,
    required this.subSubCategoryId,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.digitalProductType,
    required this.digitalFileReady,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    required this.featured,
    required this.flashDeal,
    required this.videoProvider,
    required this.videoUrl,
    required this.colors,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    // required this.variation,
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
    required this.details,
    required this.freeShipping,
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    required this.tempShippingCost,
    required this.isShippingCostUpdated,
    required this.code,
    required this.reviewsCount,
    required this.translations,
  });

  final int? id;
  final String? addedBy;
  final int? userId;
  final String? name;
  final String? slug;
  final String? productType;
  final List<CategoryId> categoryIds;
  final String? categoryId;
  final String? subCategoryId;
  final String? subSubCategoryId;
  final int? brandId;
  final String? unit;
  final int? minQty;
  final int? refundable;
  final String? digitalProductType;
  final String? digitalFileReady;
  final List<String> images;
  final List<ColorImage> colorImage;
  final String? thumbnail;
  final int? featured;
  final String? flashDeal;
  final String? videoProvider;
  final String? videoUrl;
  final List<String> colors;
  final int? variantProduct;
  final List<String> attributes;
  final List<ChoiceOption> choiceOptions;
  // final List<VariationElement> variation;
  final int? published;
  final dynamic? unitPrice;
  final dynamic? purchasePrice;
  final int? tax;
  final String? taxType;
  final String? taxModel;
  final int? discount;
  final String? discountType;
  final int? currentStock;
  final int? minimumOrderQty;
  final String? details;
  final int? freeShipping;
  final String? attachment;
  final String? createdAt;
  final DateTime? updatedAt;
  final int? status;
  final int? featuredStatus;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaImage;
  final int? requestStatus;
  final String? deniedNote;
  final dynamic? shippingCost;
  final int? multiplyQty;
  final int? tempShippingCost;
  final int? isShippingCostUpdated;
  final String? code;
  final int? reviewsCount;
  final List<dynamic> translations;

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json["id"],
      addedBy: json["added_by"],
      userId: json["user_id"],
      name: json["name"],
      slug: json["slug"],
      productType: json["product_type"],
      categoryIds: json["category_ids"] == null
          ? []
          : List<CategoryId>.from(
              json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
      categoryId: json["category_id"],
      subCategoryId: json["sub_category_id"],
      subSubCategoryId: json["sub_sub_category_id"],
      brandId: json["brand_id"],
      unit: json["unit"],
      minQty: json["min_qty"],
      refundable: json["refundable"],
      digitalProductType: json["digital_product_type"],
      digitalFileReady: json["digital_file_ready"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      colorImage: json["color_image"] == null
          ? []
          : List<ColorImage>.from(
              json["color_image"]!.map((x) => ColorImage.fromJson(x))),
      thumbnail: json["thumbnail"],
      featured: json["featured"],
      flashDeal: json["flash_deal"],
      videoProvider: json["video_provider"],
      videoUrl: json["video_url"],
      colors: json["colors"] == null
          ? []
          : List<String>.from(json["colors"]!.map((x) => x)),
      variantProduct: json["variant_product"],
      attributes: json["attributes"] == null
          ? []
          : List<String>.from(json["attributes"]!.map((x) => x)),
      choiceOptions: json["choice_options"] == null
          ? []
          : List<ChoiceOption>.from(
              json["choice_options"]!.map((x) => ChoiceOption.fromJson(x))),
      // variation: json["variation"] == null
      //     ? []
      //     : List<VariationElement>.from(
      //         json["variation"]!.map((x) => VariationElement.fromJson(x))),
      published: json["published"],
      unitPrice: json["unit_price"],
      purchasePrice: json["purchase_price"],
      tax: json["tax"],
      taxType: json["tax_type"],
      taxModel: json["tax_model"],
      discount: json["discount"],
      discountType: json["discount_type"],
      currentStock: json["current_stock"],
      minimumOrderQty: json["minimum_order_qty"],
      details: json["details"],
      freeShipping: json["free_shipping"],
      attachment: json["attachment"],
      createdAt: json["created_at"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      status: json["status"],
      featuredStatus: json["featured_status"],
      metaTitle: json["meta_title"],
      metaDescription: json["meta_description"],
      metaImage: json["meta_image"],
      requestStatus: json["request_status"],
      deniedNote: json["denied_note"],
      shippingCost: json["shipping_cost"],
      multiplyQty: json["multiply_qty"],
      tempShippingCost: json["temp_shipping_cost"],
      isShippingCostUpdated: json["is_shipping_cost_updated"],
      code: json["code"],
      reviewsCount: json["reviews_count"],
      translations: json["translations"] == null
          ? []
          : List<dynamic>.from(json["translations"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "product_type": productType,
        "category_ids": categoryIds.map((x) => x?.toJson()).toList(),
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "sub_sub_category_id": subSubCategoryId,
        "brand_id": brandId,
        "unit": unit,
        "min_qty": minQty,
        "refundable": refundable,
        "digital_product_type": digitalProductType,
        "digital_file_ready": digitalFileReady,
        "images": images.map((x) => x).toList(),
        "color_image": colorImage.map((x) => x?.toJson()).toList(),
        "thumbnail": thumbnail,
        "featured": featured,
        "flash_deal": flashDeal,
        "video_provider": videoProvider,
        "video_url": videoUrl,
        "colors": colors.map((x) => x).toList(),
        "variant_product": variantProduct,
        "attributes": attributes.map((x) => x).toList(),
        "choice_options": choiceOptions.map((x) => x?.toJson()).toList(),
        // "variation": variation.map((x) => x?.toJson()).toList(),
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
        "details": details,
        "free_shipping": freeShipping,
        "attachment": attachment,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "featured_status": featuredStatus,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "request_status": requestStatus,
        "denied_note": deniedNote,
        "shipping_cost": shippingCost,
        "multiply_qty": multiplyQty,
        "temp_shipping_cost": tempShippingCost,
        "is_shipping_cost_updated": isShippingCostUpdated,
        "code": code,
        "reviews_count": reviewsCount,
        "translations": translations.map((x) => x).toList(),
      };
}

class CategoryId {
  CategoryId({
    required this.id,
    required this.position,
  });

  final String? id;
  final int? position;

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: json["id"],
      position: json["position"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
      };
}

class ChoiceOption {
  ChoiceOption({
    required this.name,
    required this.title,
    required this.options,
  });

  final String? name;
  final String? title;
  final List<String> options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) {
    return ChoiceOption(
      name: json["name"],
      title: json["title"],
      options: json["options"] == null
          ? []
          : List<String>.from(json["options"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "options": options.map((x) => x).toList(),
      };
}

class ColorImage {
  ColorImage({
    required this.color,
    required this.imageName,
  });

  final String? color;
  final String? imageName;

  factory ColorImage.fromJson(Map<String, dynamic> json) {
    return ColorImage(
      color: json["color"],
      imageName: json["image_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "color": color,
        "image_name": imageName,
      };
}

class VariationElement {
  VariationElement({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  final String? type;
  final int? price;
  final String? sku;
  final int? qty;

  factory VariationElement.fromJson(Map<String, dynamic> json) {
    return VariationElement(
      type: json["type"],
      price: json["price"],
      sku: json["sku"],
      qty: json["qty"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "sku": sku,
        "qty": qty,
      };
}

class ProductVariation {
  ProductVariation({
    required this.size,
  });

  final dynamic size;

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      size: json["Size"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Size": size,
      };
}

class Seller {
  Seller({
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

  final String? id;
  final String? sellerId;
  final String? name;
  final String? address;
  final String? contact;
  final String? image;
  final String? bottomBanner;
  final String? vacationStartDate;
  final String? vacationEndDate;
  final String? vacationNote;
  final int? vacationStatus;
  final int? temporaryClose;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? rating;
  final String? followers;
  final String? isVerified;
  final String? isFollowing;
  final String? banner;

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
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
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      rating: json["rating"],
      followers: json["followers"],
      isVerified: json["is_verified"],
      isFollowing: json["is_following"],
      banner: json["banner"],
    );
  }

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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "rating": rating,
        "followers": followers,
        "is_verified": isVerified,
        "is_following": isFollowing,
        "banner": banner,
      };
}

class ShippingAddress {
  ShippingAddress({
    required this.id,
    required this.customerId,
    required this.contactPersonName,
    required this.addressType,
    required this.address,
    required this.address1,
    required this.city,
    required this.zip,
    required this.phone,
    required this.altPhone,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  final String? id;
  final String? customerId;
  final String? contactPersonName;
  final String? addressType;
  final String? address;
  final String? address1;
  final String? city;
  final String? zip;
  final String? phone;
  final String? altPhone;
  final String? createdAt;
  final String? updatedAt;
  final String? state;
  final String? country;
  final String? latitude;
  final String? longitude;
  final String? isBilling;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      id: json["id"],
      customerId: json["customer_id"],
      contactPersonName: json["contact_person_name"],
      addressType: json["address_type"],
      address: json["address"],
      address1: json["address1"],
      city: json["city"],
      zip: json["zip"],
      phone: json["phone"],
      altPhone: json["alt_phone"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      state: json["state"],
      country: json["country"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      isBilling: json["is_billing"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "contact_person_name": contactPersonName,
        "address_type": addressType,
        "address": address,
        "address1": address1,
        "city": city,
        "zip": zip,
        "phone": phone,
        "alt_phone": altPhone,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "state": state,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "is_billing": isBilling,
      };
}
