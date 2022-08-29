import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/category_models.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryModel>>> getAllCategory();
}
