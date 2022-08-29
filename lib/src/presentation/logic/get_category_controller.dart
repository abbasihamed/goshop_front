import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/category_models.dart';
import 'package:goshop/src/domain/usecase/get_category_usecase.dart';

class CategoryController extends GetxController {
  final _categoryUsecase = injection.get<GetAllCategoryUseCase>();

  List<CategoryModel> _categoryLists = [];

  List<CategoryModel> get cateoryList => _categoryLists;

  setCategoryData(List<CategoryModel> data) {
    _categoryLists = data;
    update();
  }

  getAllCategory() async {
    final response = await _categoryUsecase.call();
    if (response is Success) {
      setCategoryData(response.data!);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategory();
  }
}
