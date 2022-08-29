import 'package:get_it/get_it.dart';
import 'package:goshop/src/data/remote/category_api_services.dart';
import 'package:goshop/src/data/remote/store_api_services.dart';
import 'package:goshop/src/data/repositories/category_repository_impl.dart';
import 'package:goshop/src/data/repositories/store_repository_imp.dart';
import 'package:goshop/src/domain/repositories/category_repository.dart';
import 'package:goshop/src/domain/repositories/store_repository.dart';
import 'package:goshop/src/domain/usecase/get_category_usecase.dart';
import 'package:goshop/src/domain/usecase/get_stores_usecase.dart';

final injection = GetIt.I;

void setup() {
  injection.registerLazySingleton<StoreApiService>(() => StoreApiService());
  injection.registerLazySingleton(() => CategoryApiService());
  injection.registerSingleton<StoreRepository>(StoreRepositoryImpl());
  injection.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  injection.registerLazySingleton(() => GetAllStoresUseCase(injection()));
  injection.registerLazySingleton(() => GetAllCategoryUseCase(injection()));
}
