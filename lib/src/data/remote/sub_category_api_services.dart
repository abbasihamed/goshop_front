import 'package:goshop/src/core/constants.dart';

import 'package:http/http.dart' as http;

class SubCategoryApiServices {
  Future<http.Response> getSubCategoryWithId(int id) async {
    var response = await http.get(
      Uri.parse('$baseUrl/sub_category/get/store/subCategory=$id'),
      headers: {
        'accept': 'application/json',
      },
    );
    return response;
  }
}
