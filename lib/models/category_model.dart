class CategoryModel {
  String? categoryId;
  String categoryName;
  num productCount;

  CategoryModel({
    this.categoryId,
    required this.categoryName,
    required this.productCount,
  });
}
