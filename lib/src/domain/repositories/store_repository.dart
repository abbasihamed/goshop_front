import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/store_models.dart';

abstract class StoreRepository {
  Future<DataState<List<StoreModel>>> getAllStores();
}
