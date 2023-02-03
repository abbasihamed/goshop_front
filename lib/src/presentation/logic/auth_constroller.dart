import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/core/data_state.dart';
import 'package:goshop/src/core/keys.dart';
import 'package:goshop/src/domain/usecase/auth_send_mobile_usercase.dart';
import 'package:goshop/src/domain/usecase/auth_send_verify_code_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final authUsecase = injection.get<SendMobileUseCase>();
  final verifyUsecase = injection.get<SendVerifyCodeUseCase>();

  String? _tokenValue;

  String? get tokenValue => _tokenValue;

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _tokenValue = prefs.getString('token');
    update();
  }

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
      saveToken(response.data!.token!);
      AppRouter.appRouter
          .navigateTo(navKey.currentState!.context, '/', clearStack: true);
    }
    if (response is Failed) {
      print(response.error);
    }
  }
}
