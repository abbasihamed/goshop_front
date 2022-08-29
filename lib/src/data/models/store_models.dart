import 'dart:convert';

List<StoreModel> storeModelFromJson(String str) =>
    List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  StoreModel({
    this.storeId,
    this.name,
    this.description,
    this.images,
    this.categories,
    this.subCategories,
  });

  final int? storeId;
  final String? name;
  final String? description;
  final List<Image>? images;
  final Categories? categories;
  final List<SubCategory>? subCategories;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        storeId: json["store_id"],
        name: json["name"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        categories: Categories.fromJson(json["categories"]),
        subCategories: List<SubCategory>.from(
            json["sub_categories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "categories": categories?.toJson(),
        "sub_categories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class Categories {
  Categories({
    this.categoryId,
    this.categoryName,
  });

  final int? categoryId;
  final String? categoryName;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
      };
}

class Image {
  Image({
    this.id,
    this.image,
  });

  final int? id;
  final String? image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class SubCategory {
  SubCategory({
    this.subCategoryName,
  });

  final String? subCategoryName;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subCategoryName: json["sub_category_name"],
      );

  Map<String, dynamic> toJson() => {
        "sub_category_name": subCategoryName,
      };
}
