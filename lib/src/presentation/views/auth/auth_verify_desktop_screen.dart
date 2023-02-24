import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/config/responsive/mediaquery_getter.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';
import 'package:goshop/src/presentation/views/store_details/store_details_desktop.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthVerifyCodedesktopScreen extends StatelessWidget {
  const AuthVerifyCodedesktopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(showSearch: false),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      height: 400,
                      width: width(context) * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFF3F3F3),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تایید شماره موبایل',
                            style: textTheme(context).headlineLarge,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'کد چهار رقمی پیامک شده به ۰۹۱۵۰۳۹۴۶۱۰ را وارد کنید.',
                            style: textTheme(context).subtitle1!.copyWith(
                                  color: const Color(0xFF92929D),
                                ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'کد را اینجا وارد کنید',
                            style: textTheme(context).subtitle1,
                          ),
                          const SizedBox(height: 8),
                          const CustomPinTextField(),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'دریافت مجدد کد چهار رقمی ورود',
                                  style: textTheme(context)
                                      .subtitle1!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('اصلاح شماره تلفن همراه',
                                    style: textTheme(context).subtitle1),
                              ),
                            ],
                          ),
                          const SizedBox(height: 42),
                          Center(
                            child: InkWell(
                              onTap: () {
                                AppRouter.appRouter
                                    .navigateTo(context, '/profile');
                              },
                              child: Container(
                                width: width(context),
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'تایید نهایی و ورود به سایت',
                                  style: textTheme(context)
                                      .button!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const HomeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPinTextField extends StatelessWidget {
  const CustomPinTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(bottom: 8),
      width: width(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textField(),
          _textField(),
          _textField(),
          _textField(),
        ],
      ),
    );
  }

  Widget _textField() {
    return const Padding(
      padding: EdgeInsets.only(left: 12),
      child: SizedBox(
        width: 25,
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.divider)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.divider)),
          ),
        ),
      ),
    );
  }
}
