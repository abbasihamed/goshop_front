import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/presentation/components/custom_button.dart';
import 'package:goshop/src/presentation/components/custom_textfields.dart';
import 'package:goshop/src/presentation/logic/auth_constroller.dart';

class AuthDesktopScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  AuthDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
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
                  Text(
                    'شماره موبایل خود را وارد نمایید',
                    style: theme.textTheme.subtitle2,
                  ),
                  const SizedBox(height: 26),
                  CustomTextFields(
                    theme: theme,
                    controller: controller,
                  ),
                  const SizedBox(height: 26),
                  Center(
                    child: CustomButton(
                      theme: theme,
                      title: 'ورود',
                      onPressed: () {
                        Get.find<AuthController>()
                            .sendMobile(controller.text.trim());
                        AppRouter.appRouter.navigateTo(
                          context,
                          '/authentication-verify',
                          routeSettings: RouteSettings(
                            arguments: controller.text.trim(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ورود شمار به معنای قبول ',
                        style:
                            theme.textTheme.subtitle2!.copyWith(fontSize: 16),
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {},
                        child: Text(
                          'قوانین و مقررات ',
                          style: theme.textTheme.subtitle2!.copyWith(
                              fontSize: 16, color: theme.primaryColor),
                        ),
                      ),
                      Text(
                        'می باشد',
                        style:
                            theme.textTheme.subtitle2!.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatelessWidget {
  final List<Widget> authItems;
  const AuthCard({
    Key? key,
    required this.authItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        height: 450,
        width: 500,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 15,
                spreadRadius: 2,
                offset: const Offset(1, 1),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'GoShop',
                style: theme.textTheme.headline6!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 36),
            Text(
              'ورود | ثبت نام',
              style: theme.textTheme.subtitle1,
            ),
            const SizedBox(height: 26),
            ...authItems,
          ],
        ),
      ),
    );
  }
}
