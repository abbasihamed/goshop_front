import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/category_models.dart';
import 'package:goshop/src/domain/repositories/category_repository.dart';

class GetAllCategoryUseCase {
  final CategoryRepository _categoryRepository;
  GetAllCategoryUseCase(this._categoryRepository);

  Future<DataState<List<CategoryModel>>> call() async {
    return await _categoryRepository.getAllCategory();
  }
}
