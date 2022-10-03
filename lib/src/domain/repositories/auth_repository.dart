import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<DataState<AuthModel>> sendMobileNumber(String mobileNumber);
  Future<DataState<TokenModel>> sendVerifyCode(String mobileNumber,int code);
}
