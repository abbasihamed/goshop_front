import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/sub_category_models.dart';

abstract class SubCategoryRepository {
  Future<DataState<List<SubCategoryModel>>> getSubCategoryWithId(int id);
}
