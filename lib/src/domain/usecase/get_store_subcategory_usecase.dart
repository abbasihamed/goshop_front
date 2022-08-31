import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/domain/repositories/store_repository.dart';

class GetStoreSubCategoryUseCase {
  final StoreRepository _storeRepository;
  GetStoreSubCategoryUseCase(this._storeRepository);

  Future<DataState<List<StoreModel>>> call(int id) async {
    return await _storeRepository.getStoreSubCategoryId(id);
  }
}
