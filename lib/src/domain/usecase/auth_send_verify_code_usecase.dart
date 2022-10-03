import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/auth_model.dart';
import 'package:goshop/src/domain/repositories/auth_repository.dart';

class SendVerifyCodeUseCase {
  final AuthRepository _authRepository;
  SendVerifyCodeUseCase(this._authRepository);

  Future<DataState<TokenModel>> call(
      {required String mobileNumber, required int code}) async {
    return await _authRepository.sendVerifyCode(mobileNumber, code);
  }
}
