import 'package:goshop/src/core/constants.dart';
import 'package:http/http.dart' as http;

class StoreApiService {
  Future<http.Response> getAllStore() async {
    var response = await http.get(
      Uri.parse('$baseUrl/store/get/all'),
      headers: {
        'accept': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> getStoreSubCategory(int id) async {
    var response = await http.get(
      Uri.parse('$baseUrl/store/get/store/subCategory=$id'),
      headers: {
        'accept': 'application/json',
      },
    );
    return response;
  }
}
