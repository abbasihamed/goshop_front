import 'package:get_it/get_it.dart';
import 'package:goshop/src/data/remote/auth_api_service.dart';
import 'package:goshop/src/data/remote/category_api_services.dart';
import 'package:goshop/src/data/remote/store_api_services.dart';
import 'package:goshop/src/data/remote/sub_category_api_services.dart';
import 'package:goshop/src/data/repositories/auth_repository_impl.dart';
import 'package:goshop/src/data/repositories/category_repository_impl.dart';
import 'package:goshop/src/data/repositories/store_repository_imp.dart';
import 'package:goshop/src/data/repositories/sub_category_repository_impl.dart';
import 'package:goshop/src/domain/repositories/auth_repository.dart';
import 'package:goshop/src/domain/repositories/category_repository.dart';
import 'package:goshop/src/domain/repositories/store_repository.dart';
import 'package:goshop/src/domain/repositories/sub_category_repository.dart';
import 'package:goshop/src/domain/usecase/auth_send_mobile_usercase.dart';
import 'package:goshop/src/domain/usecase/auth_send_verify_code_usecase.dart';
import 'package:goshop/src/domain/usecase/get_category_usecase.dart';
import 'package:goshop/src/domain/usecase/get_store_subcategory_usecase.dart';
import 'package:goshop/src/domain/usecase/get_stores_usecase.dart';
import 'package:goshop/src/domain/usecase/get_subcategory_usecase.dart';

final injection = GetIt.I;

void setup() {
  injection.registerLazySingleton<StoreApiService>(() => StoreApiService());
  injection.registerLazySingleton(() => CategoryApiService());
  injection.registerLazySingleton(() => SubCategoryApiServices());
  injection.registerLazySingleton(() => AuthApiService());
  injection.registerSingleton<StoreRepository>(StoreRepositoryImpl());
  injection.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  injection
      .registerSingleton<SubCategoryRepository>(SubCategoryRepositoryImpl());
  injection.registerSingleton<AuthRepository>(AuthRespositoryImpl());
  injection.registerLazySingleton(() => GetAllStoresUseCase(injection()));
  injection
      .registerLazySingleton(() => GetStoreSubCategoryUseCase(injection()));
  injection.registerLazySingleton(() => GetAllCategoryUseCase(injection()));
  injection.registerLazySingleton(() => GetSubCategoryUseCase(injection()));
  injection.registerLazySingleton(() => SendMobileUseCase(injection()));
  injection.registerLazySingleton(() => SendVerifyCodeUseCase(injection()));
}
