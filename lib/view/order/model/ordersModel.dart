class OrdersModel {
  bool? status;
  String? message;
  Filters? filters;
  List<OrdersList>? data;

  OrdersModel(
      {this.status,
      this.message,
      //this.filters,
      this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    if (json['data'] != null) {
      data = <OrdersList>[];
      json['data'].forEach((v) {
        data!.add(OrdersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  List<Status>? status;
  List<Categories>? categories;

  Filters({this.status, this.categories});

  Filters.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? title;
  String? value;

  Status({this.title, this.value});

  Status.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

class Categories {
  int? title;
  String? value;

  Categories({this.title, this.value});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

class OrdersList {
  int? id;
  int? orderId;
  String? productName;
  String? productSlug;
  String? details;
  int? productId;
  int? sellerId;
  String? deliveryStatus;
  String? paymentStatus;
  String? createdAt;
  String? orderStatus;
  String? paymentMethod;
  String? transactionRef;
  String? orderAmount;
  int? qty;
  String? price;
  String? tax;
  String? discount;
  String? total;
  String? thumbnail;
  Product? product;

  OrdersList(
      {this.id,
      this.orderId,
      this.productName,
      this.productSlug,
      this.details,
      this.productId,
      this.sellerId,
      this.deliveryStatus,
      this.paymentStatus,
      this.createdAt,
      this.orderStatus,
      this.paymentMethod,
      this.transactionRef,
      this.orderAmount,
      this.qty,
      this.price,
      this.tax,
      this.discount,
      this.total,
      this.thumbnail,
      this.product});

  OrdersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productName = json['product_name'];
    productSlug = json['product_slug'];
    details = json['details'];
    productId = json['product_id'];
    sellerId = json['seller_id'];
    deliveryStatus = json['delivery_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    transactionRef = json['transaction_ref'];
    orderAmount = json['order_amount'];
    qty = json['qty'];
    price = json['price'];
    tax = json['tax'];
    discount = json['discount'];
    total = json['total'];
    thumbnail = json['thumbnail'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_name'] = this.productName;
    data['product_slug'] = this.productSlug;
    data['details'] = this.details;
    data['product_id'] = this.productId;
    data['seller_id'] = this.sellerId;
    data['delivery_status'] = this.deliveryStatus;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['transaction_ref'] = this.transactionRef;
    data['order_amount'] = this.orderAmount;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['thumbnail'] = this.thumbnail;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  List<CategoryIds>? categoryIds;
  int? userId;
  Shop? shop;
  String? name;
  String? slug;
  List<String>? images;
  List<ColorImage>? colorImage;
  String? thumbnail;
  int? brandId;
  String? unit;
  int? minQty;
  int? featured;
  String? refundable;
  int? variantProduct;
  List<int>? attributes;
  List<ChoiceOptions>? choiceOptions;
  List<Variation>? variation;
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
  List<Rating>? rating;
  List<Tags>? tags;
  String? shareLink;
  List<Reviews>? reviews;
  List<ColorsFormatted>? colorsFormatted;
  bool? isFavorite;
  bool? isCart;
  int? cartId;

  Product(
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
      this.attributes,
      this.choiceOptions,
      this.variation,
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
      this.rating,
      this.tags,
      this.shareLink,
      this.reviews,
      this.colorsFormatted,
      this.isFavorite,
      this.isCart,
      this.cartId});

  Product.fromJson(Map<String, dynamic> json) {
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
    if (json['color_image'] != null) {
      colorImage = <ColorImage>[];
      json['color_image'].forEach((v) {
        colorImage!.add(new ColorImage.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    featured = json['featured'];
    refundable = json['refundable'];
    variantProduct = json['variant_product'];
    attributes = json['attributes'].cast<int>();
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(new Variation.fromJson(v));
      });
    }
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
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(new Rating.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }

    shareLink = json['share_link'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['colors_formatted'] != null) {
      colorsFormatted = <ColorsFormatted>[];
      json['colors_formatted'].forEach((v) {
        colorsFormatted!.add(new ColorsFormatted.fromJson(v));
      });
    }
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
    if (this.colorImage != null) {
      data['color_image'] = this.colorImage!.map((v) => v.toJson()).toList();
    }
    data['thumbnail'] = this.thumbnail;
    data['brand_id'] = this.brandId;
    data['unit'] = this.unit;
    data['min_qty'] = this.minQty;
    data['featured'] = this.featured;
    data['refundable'] = this.refundable;
    data['variant_product'] = this.variantProduct;
    data['attributes'] = this.attributes;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    if (this.variation != null) {
      data['variation'] = this.variation!.map((v) => v.toJson()).toList();
    }
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
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }

    data['share_link'] = this.shareLink;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.colorsFormatted != null) {
      data['colors_formatted'] =
          this.colorsFormatted!.map((v) => v.toJson()).toList();
    }
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

class ColorImage {
  String? color;
  String? imageName;

  ColorImage({this.color, this.imageName});

  ColorImage.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    imageName = json['image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['image_name'] = this.imageName;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}

class Variation {
  String? type;
  String? price;
  String? sku;
  int? qty;

  Variation({this.type, this.price, this.sku, this.qty});

  Variation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    sku = json['sku'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    data['sku'] = this.sku;
    data['qty'] = this.qty;
    return data;
  }
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

class Tags {
  int? id;
  String? tag;
  int? visitCount;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tags(
      {this.id,
      this.tag,
      this.visitCount,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    visitCount = json['visit_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag'] = this.tag;
    data['visit_count'] = this.visitCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? productId;
  int? tagId;

  Pivot({this.productId, this.tagId});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['tag_id'] = this.tagId;
    return data;
  }
}

class Reviews {
  int? id;
  int? productId;
  int? customerId;
  String? deliveryManId;
  String? orderId;
  String? comment;
  List<String>? attachment;
  int? rating;
  int? status;
  int? isSaved;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  Reviews(
      {this.id,
      this.productId,
      this.customerId,
      this.deliveryManId,
      this.orderId,
      this.comment,
      this.attachment,
      this.rating,
      this.status,
      this.isSaved,
      this.createdAt,
      this.updatedAt,
      this.customer});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    deliveryManId = json['delivery_man_id'];
    orderId = json['order_id'];
    comment = json['comment'];
    attachment = json['attachment'].cast<String>();
    rating = json['rating'];
    status = json['status'];
    isSaved = json['is_saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['customer_id'] = this.customerId;
    data['delivery_man_id'] = this.deliveryManId;
    data['order_id'] = this.orderId;
    data['comment'] = this.comment;
    data['attachment'] = this.attachment;
    data['rating'] = this.rating;
    data['status'] = this.status;
    data['is_saved'] = this.isSaved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? image;

  Customer({this.id, this.name, this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class ColorsFormatted {
  String? name;
  String? code;

  ColorsFormatted({this.name, this.code});

  ColorsFormatted.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
