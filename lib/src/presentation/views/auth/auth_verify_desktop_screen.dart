import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/presentation/components/custom_button.dart';
import 'package:goshop/src/presentation/components/custom_textfields.dart';
import 'package:goshop/src/presentation/logic/auth_constroller.dart';
import 'package:goshop/src/presentation/logic/timer_controller.dart';
import 'package:goshop/src/presentation/views/auth/auth_desktop_screen.dart';

class AuthVerifyCodedesktopScreen extends StatelessWidget {
  final String mobileNumber;
  AuthVerifyCodedesktopScreen({
    Key? key,
    required this.mobileNumber,
  }) : super(key: key);

  TextEditingController constroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.find<TimerController>().startTimer();
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.find<TimerController>().stopTimer();
        return true;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: AuthCard(
                  authItems: [
                    GetBuilder<AuthController>(builder: (auth) {
                      return Text(
                        'کد تایید شما به شماره $mobileNumber ارسال شد',
                        style:
                            theme.textTheme.subtitle2!.copyWith(fontSize: 16),
                      );
                    }),
                    const SizedBox(height: 26),
                    CustomTextFields(
                      theme: theme,
                      controller: constroller,
                    ),
                    const SizedBox(height: 26),
                    GetBuilder<TimerController>(
                      builder: (timer) {
                        return Center(
                          child: Text(
                            'زمان باقی مانده: 0${timer.minutes}:${timer.seconds}',
                            style: theme.textTheme.subtitle2!
                                .copyWith(fontSize: 16),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 26),
                    Center(
                      child: CustomButton(
                        theme: theme,
                        title: 'ورود',
                        onPressed: () {
                          Get.find<AuthController>()
                              .sendVerifyCode(mobileNumber, constroller.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
