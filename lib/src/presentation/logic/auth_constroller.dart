import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/domain/usecase/auth_send_mobile_usercase.dart';
import 'package:goshop/src/domain/usecase/auth_send_verify_code_usecase.dart';

class AuthController extends GetxController {
  final authUsecase = injection.get<SendMobileUseCase>();
  final verifyUsecase = injection.get<SendVerifyCodeUseCase>();

  sendMobile(String mobileNumber) async {
    final response = await authUsecase.call(mobileNumber: mobileNumber);
    if (response is Success) {
      print(response.data!.otpCode);
    }
  }

  sendVerifyCode(String mobileNumber, String code) async {
    final response = await verifyUsecase.call(
        mobileNumber: mobileNumber, code: int.parse(code.trim()));
    if (response is Success) {
      print(response.data!.token);
    }
    if (response is Failed) {
      print(response.error);
    }
  }
}
