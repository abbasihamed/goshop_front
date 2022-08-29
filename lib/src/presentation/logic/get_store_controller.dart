import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/domain/usecase/get_stores_usecase.dart';

class StoresController extends GetxController {
  final storeUsecase = injection.get<GetAllStoresUseCase>();

  List<StoreModel> _storeLists = [];

  List<StoreModel> get storeList => _storeLists;

  setStoreData(List<StoreModel> data) {
    _storeLists = data;
    update();
  }

  getAllStore() async {
    final response = await storeUsecase.call();
    if (response is Success) {
      setStoreData(response.data!);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllStore();
  }
}
