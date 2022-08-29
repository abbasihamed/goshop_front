import 'package:goshop/src/core/constants.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  Future<http.Response> getAllCategory() async {
    var response = await http.get(
      Uri.parse('$baseUrl/category/get/all'),
      headers: {
        'accept': 'application/json',
      },
    );
    return response;
  }
}
