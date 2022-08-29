import 'dart:convert';
import 'dart:developer';

import 'package:goshop/injection.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/data/remote/store_api_services.dart';
import 'package:goshop/src/domain/repositories/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final storeService = injection.get<StoreApiService>();
  @override
  Future<DataState<List<StoreModel>>> getAllStores() async {
    try {
      final response = await storeService.getAllStore();
      if (response.statusCode == 200) {
        return Success(storeModelFromJson(utf8.decode(response.bodyBytes)));
      }
      return const Failed('Invalid Response');
    } catch (e) {
      return const Failed('Unknown error');
    }
  }
}
