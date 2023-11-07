import '../utils/images.dart';

class MainCategory {
  final String name;
  final List<CategoryList> categoryList;
  MainCategory(this.name, this.categoryList);
}

class CategoryList {
  String categoryName;
  String categoryImage;
  CategoryList({
    required this.categoryName,
    required this.categoryImage,
  });
}

List<MainCategory> categories = [
  MainCategory(
    "Electronics",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Clothing & Clothing",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Beauty & Beauty",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Home & Living",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Health & Wealth",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Toys & Games",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Books & Stationary",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Sports & Sports",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Automotive",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Food & Beverages",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
  MainCategory(
    "Industrial & Industrial",
    [
      CategoryList(
          categoryName: "Computers & Accessories", categoryImage: Images.tv),
      CategoryList(
          categoryName: "Smartphones & Accessories",
          categoryImage: Images.phone),
      CategoryList(
          categoryName: "Home Appliances", categoryImage: Images.fridge),
      CategoryList(
          categoryName: "Audio & Headphones", categoryImage: Images.headphone),
      CategoryList(
          categoryName: "Camera & Photography",
          categoryImage: Images.cameraTemporary),
      CategoryList(
          categoryName: "Clothing & Fashion", categoryImage: Images.jeans),
    ],
  ),
];
