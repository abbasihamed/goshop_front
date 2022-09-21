import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/domain/usecase/get_store_subcategory_usecase.dart';
import 'package:goshop/src/domain/usecase/get_stores_usecase.dart';

class StoresController extends GetxController {
  final storeUsecase = injection.get<GetAllStoresUseCase>();
  final storeSubCategory = injection.get<GetStoreSubCategoryUseCase>();

  List<StoreModel> _storeLists = [];
  StoreModel? _store;

  List<StoreModel> get storeList => _storeLists;
  StoreModel? get store => _store;

  setStoreData(List<StoreModel> data) {
    _storeLists = data;
    update();
  }

  setSpecificStore(StoreModel data) {
    _store = data;
    update();
  }

  getAllStore() async {
    final response = await storeUsecase.call();
    if (response is Success) {
      setSpecificStore(response.data![0]);
      setStoreData(response.data!);
    }
  }

  getStoreWithSubCAtegoryId({required int id}) async {
    final response = await storeSubCategory.call(id);
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
