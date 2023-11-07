import '../utils/images.dart';

class CartList {
  String productImage;
  String productName;
  String productPrice;
  String productWeight;
  String productDiscount;
  int productCount;
  CartList(
      {required this.productCount,
        required this.productImage,
        required this.productName,
        required this.productPrice,
        required this.productDiscount,
        required this.productWeight});
}

List<CartList> cartList = [
  CartList(
      productCount: 1,
      productImage: Images.homeSale,
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  CartList(
      productCount: 1,
      productImage: Images.homeSale,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  CartList(
      productCount: 1,
      productImage: Images.homeSale,
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  CartList(
      productCount: 1,
      productImage: Images.homeSale,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
  CartList(
      productCount: 1,
      productImage: Images.homeSale,
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDiscount: '\$200'),
];
