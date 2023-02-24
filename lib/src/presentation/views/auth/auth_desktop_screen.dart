import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/config/responsive/mediaquery_getter.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';
import 'package:goshop/src/presentation/views/store_details/store_details_desktop.dart';

class SendMobileNumber extends StatelessWidget {
  const SendMobileNumber({Key? key}) : super(key: key);

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
                            'ورود / ثبت نام',
                            style: textTheme(context).headlineLarge,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'لطفا برای ورود یا ثبت نام شماره تلفن همراه خود را وارد کنید.',
                            style: textTheme(context).subtitle1!.copyWith(
                                  color: const Color(0xFF92929D),
                                ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'شماره موبایل',
                            style: textTheme(context).subtitle1,
                          ),
                          const SizedBox(height: 8),
                          HomeHeaderSearchFiled(
                            hasRaduis: true,
                            width: double.infinity,
                            hintText: '090000000000',
                            textAlign: TextAlign.left,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'توجه: لطفا پس از ثبت آگهی، از طریق هیچ پیامکی برای پرداخت وجه جهت انتشار آگهی اقدام نکنید.',
                            style: textTheme(context).subtitle1!.copyWith(
                                  color: const Color(0xFF92929D),
                                ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: InkWell(
                              onTap: () {
                                AppRouter.appRouter.navigateTo(
                                    context, '/authentication-verify');
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
                                  'ورود یا ثبت نام',
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.divider,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.divider,
            ),
          ),
        ),
      ),
    );
  }
}
