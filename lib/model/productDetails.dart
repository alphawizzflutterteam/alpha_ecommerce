import '../helper/images.dart';

class ProductDetails {
  String productName;
  String productImage;
  String productPrice;
  String productDiscount;
  String productWeight;
  int productCount;
  String productDescription;
  ProductDetails(
      {required this.productImage,
      required this.productCount,
      required this.productWeight,
      required this.productName,
      required this.productPrice,
      required this.productDiscount,
      required this.productDescription});
}

List<ProductDetails> productsDetail = [
  ProductDetails(
      productImage: Images.powder,
      productCount: 1,
      productWeight: '100 ml',
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productDiscount: '\$200',
      productDescription:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s"),
  ProductDetails(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDescription:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
      productDiscount: '\$200'),
  ProductDetails(
      productImage: Images.powder,
      productCount: 1,
      productWeight: '100 ml',
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productDiscount: '\$200',
      productDescription:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s"),
  ProductDetails(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDescription:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
      productDiscount: '\$200'),
  ProductDetails(
      productImage: Images.powder,
      productCount: 1,
      productWeight: '100 ml',
      productName: 'Oats Fitness',
      productPrice: '\$120.00',
      productDiscount: '\$200',
      productDescription:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s"),
  ProductDetails(
      productCount: 1,
      productImage: Images.powder,
      productName: 'Maggie Masala',
      productPrice: '\$120.00',
      productWeight: '100 ml',
      productDescription:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. LOrem Ipsum has been the industry's standard dummy text since the 1500s",
      productDiscount: '\$200'),
];
