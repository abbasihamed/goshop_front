import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/presentation/components/custom_dropDown.dart';
import 'package:goshop/src/presentation/logic/auth_constroller.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key}) : super(key: key);

  final LayerLink link = LayerLink();

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>().getToken();
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logos/goshop_logo.png',
          height: 100,
        ),
        GetBuilder<AuthController>(
          builder: (auth) {
            return auth.tokenValue != null
                ? CompositedTransformTarget(
                    link: link,
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        injection.get<CustomDropDown>().toggelCustomDropDown(
                              context,
                              link,
                              child: AfterLoginDropDown(theme: theme),
                            );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 38,
                            color: theme.colorScheme.secondary,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 38,
                            color: theme.colorScheme.secondary,
                          )
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      AppRouter.appRouter
                          .navigateTo(context, '/authentication');
                    },
                    child: Text(
                      'ورود / ثبت نام',
                      style: theme.textTheme.subtitle1,
                    ),
                  );
          },
        ),
      ],
    );
  }
}

class AfterLoginDropDown extends StatelessWidget {
  final ThemeData theme;
  const AfterLoginDropDown({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                AppRouter.appRouter.navigateTo(context, '/profile');
                injection.get<CustomDropDown>().removeCustomDropDown();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 36,
                    color: theme.colorScheme.secondary.withOpacity(.7),
                  ),
                  const SizedBox(width: 22),
                  Text(
                    '09379286985',
                    style: theme.textTheme.subtitle1,
                  ),
                  const SizedBox(width: 53),
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: theme.colorScheme.secondary.withOpacity(.7),
                  )
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.person_add_alt,
                    size: 36,
                    color: theme.colorScheme.secondary.withOpacity(.7),
                  ),
                  const SizedBox(width: 22),
                  Text(
                    'دنبال شده ها',
                    style: theme.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 36,
                    color: theme.colorScheme.secondary.withOpacity(.7),
                  ),
                  const SizedBox(width: 22),
                  Text(
                    'نظرات و پیام ها',
                    style: theme.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 36,
                    color: theme.colorScheme.secondary.withOpacity(.7),
                  ),
                  const SizedBox(width: 22),
                  Text(
                    'خروج از حساب کاربری',
                    style: theme.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
