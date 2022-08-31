import 'dart:convert';

import 'package:goshop/injection.dart';
import 'package:goshop/src/data/models/sub_category_models.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/remote/sub_category_api_services.dart';
import 'package:goshop/src/domain/repositories/sub_category_repository.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  final subCategory = injection.get<SubCategoryApiServices>();
  @override
  Future<DataState<List<SubCategoryModel>>> getSubCategoryWithId(int id) async {
    try {
      final response = await subCategory.getSubCategoryWithId(id);
      if (response.statusCode == 200) {
        return Success(
            subCategoryModelFromJson(utf8.decode(response.bodyBytes)));
      }
      return const Failed('Invalid Response');
    } catch (e) {
      return const Failed('Unkown Error');
    }
  }
}
