import 'dart:convert';

import 'package:goshop/injection.dart';
import 'package:goshop/src/data/models/category_models.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/remote/category_api_services.dart';
import 'package:goshop/src/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final categoryService = injection.get<CategoryApiService>();

  @override
  Future<DataState<List<CategoryModel>>> getAllCategory() async {
    try {
      final response = await categoryService.getAllCategory();
      if (response.statusCode == 200) {
        return Success(categoryModelFromJson(utf8.decode(response.bodyBytes)));
      }
      return const Failed('Invalid Response');
    } catch (e) {
      return const Failed('Unkown Error');
    }
  }
}
