import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/domain/repositories/store_repository.dart';

class GetAllStoresUseCase {
  final StoreRepository _storeRepository;
  GetAllStoresUseCase(this._storeRepository);

  Future<DataState<List<StoreModel>>> call() async {
    return await _storeRepository.getAllStores();
  }
}
