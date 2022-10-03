import 'dart:convert';

import 'package:goshop/src/core/constants.dart';
import 'package:http/http.dart' as http;

class AuthApiService {
  Future<http.Response> sendMobileVerification(
      {required String mobileNumber}) async {
    var response = await http.post(Uri.parse('$baseUrl/user/send/otp/code'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"mobile": mobileNumber}));
    return response;
  }

  Future<http.Response> sendVerifyCode(
      {required String mobileNumber, required int code}) async {
    var response = await http.post(
      Uri.parse('$baseUrl/user/create'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"mobile": mobileNumber, "otp_code": code}),
    );
    return response;
  }
}
