import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/sub_category_models.dart';
import 'package:goshop/src/domain/repositories/sub_category_repository.dart';

class GetSubCategoryUseCase {
  final SubCategoryRepository _categoryRepository;
  GetSubCategoryUseCase(this._categoryRepository);

  Future<DataState<List<SubCategoryModel>>> call(int id) async {
    return await _categoryRepository.getSubCategoryWithId(id);
  }
}
