import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/sub_category_models.dart';
import 'package:goshop/src/domain/usecase/get_subcategory_usecase.dart';

class SubCategoryController extends GetxController {
  final subCategory = injection.get<GetSubCategoryUseCase>();

  List<SubCategoryModel> _subCategoryList = [];

  List<SubCategoryModel> get subCategoryList => _subCategoryList;

  setSubCategory(List<SubCategoryModel> data) {
    _subCategoryList = data;
    update();
  }


  getSubCategoryWithId({required int id}) async {
    final response = await subCategory.call(id);
    if (response is Success) {
      setSubCategory(response.data!);
    }
  }
}
