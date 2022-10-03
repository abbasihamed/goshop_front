import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/data/models/auth_model.dart';
import 'package:goshop/src/domain/repositories/auth_repository.dart';

class SendMobileUseCase {
  final AuthRepository _authRepository;
  SendMobileUseCase(this._authRepository);

  Future<DataState<AuthModel>> call({required String mobileNumber}) async {
    return await _authRepository.sendMobileNumber(mobileNumber);
  }
}
