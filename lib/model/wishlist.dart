import '../helper/images.dart';

class WishlistList {
  String productImage;
  String productName;
  String productPrice;
  String productWeight;
  String productDiscount;
  int productCount;
  WishlistList(
      {required this.productCount,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productDiscount,
      required this.productWeight});
}

List<WishlistList> wishlist = [
  WishlistList(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  WishlistList(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  WishlistList(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  WishlistList(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  WishlistList(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
];
