import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.subCategories,
  });

  int? categoryId;
  String? categoryName;
  List<SubCategory>? subCategories;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        subCategories: List<SubCategory>.from(
            json["sub_categories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "sub_categories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    this.subCategoryName,
  });

  String? subCategoryName;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subCategoryName: json["sub_category_name"],
      );

  Map<String, dynamic> toJson() => {
        "sub_category_name": subCategoryName,
      };
}
