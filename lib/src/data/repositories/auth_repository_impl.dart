import 'dart:convert';

import 'package:goshop/injection.dart';
import 'package:goshop/src/data/models/auth_model.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/remote/auth_api_service.dart';
import 'package:goshop/src/domain/repositories/auth_repository.dart';

class AuthRespositoryImpl extends AuthRepository {
  final authApiService = injection.get<AuthApiService>();
  @override
  Future<DataState<AuthModel>> sendMobileNumber(String mobileNumber) async {
    try {
      final response = await authApiService.sendMobileVerification(
          mobileNumber: mobileNumber);
      if (response.statusCode == 200) {
        return Success(authModelFromJson(utf8.decode(response.bodyBytes)));
      }
      return const Failed('Invalid Response');
    } catch (e) {
      return const Failed('Unkown error');
    }
  }

  @override
  Future<DataState<TokenModel>> sendVerifyCode(
      String mobileNumber, int code) async {
    try {
      final response = await authApiService.sendVerifyCode(
          mobileNumber: mobileNumber, code: code);
      if (response.statusCode == 200) {
        return Success(tokenModelFromJson(utf8.decode(response.bodyBytes)));
      }
      return Failed(jsonDecode(response.body)['detail']);
    } catch (e) {
      return const Failed('Unkown error');
    }
  }
}
