import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) => List<SubCategoryModel>.from(json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
    SubCategoryModel({
        this.subCategoryId,
        this.subCategoryName,
        this.categories,
        this.stores,
    });

    int? subCategoryId;
    String? subCategoryName;
    SubCategoryModelCategories? categories;
    List<Store>? stores;

    factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
        subCategoryId: json["sub_category_id"],
        subCategoryName: json["sub_category_name"],
        categories: SubCategoryModelCategories.fromJson(json["categories"]),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sub_category_id": subCategoryId,
        "sub_category_name": subCategoryName,
        "categories": categories!.toJson(),
        "stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
    };
}

class SubCategoryModelCategories {
    SubCategoryModelCategories({
        this.categoryName,
    });

    String? categoryName;

    factory SubCategoryModelCategories.fromJson(Map<String, dynamic> json) => SubCategoryModelCategories(
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "category_name": categoryName,
    };
}

class Store {
    Store({
        this.storeId,
        this.name,
        this.description,
        this.images,
        this.categories,
        this.subCategories,
    });

    int? storeId;
    String? name;
    String? description;
    List<Image>? images;
    StoreCategories? categories;
    List<SubCategory>? subCategories;

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["store_id"],
        name: json["name"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        categories: StoreCategories.fromJson(json["categories"]),
        subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "categories": categories!.toJson(),
        "sub_categories": List<dynamic>.from(subCategories!.map((x) => x.toJson())),
    };
}

class StoreCategories {
    StoreCategories({
        this.categoryId,
        this.categoryName,
        this.subCategories,
    });

    int? categoryId;
    String? categoryName;
    List<SubCategory>? subCategories;

    factory StoreCategories.fromJson(Map<String, dynamic> json) => StoreCategories(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "sub_categories": List<dynamic>.from(subCategories!.map((x) => x.toJson())),
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

class Image {
    Image({
        this.id,
        this.image,
    });

    int? id;
    String? image;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}
