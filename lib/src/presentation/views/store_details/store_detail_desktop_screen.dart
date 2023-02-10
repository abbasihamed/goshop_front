import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goshop/src/config/responsive/mediaquery_getter.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';

class StoreDetailDesktopScreen extends HookWidget {
  const StoreDetailDesktopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: SearchBox(
              boxWidth: width(context) * 0.55,
              searchWidth: width(context) * 0.23,
              locationWidth: width(context) * 0.2,
            ),
            leadingWidth: 400,
            leading: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                color: AppColors.icon,
              ),
              label: Text(
                'حساب کاربری',
                style: textTheme(context).headline2,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'همه خدمات',
                        style: textTheme(context).headline2,
                      ),
                    ),
                    SizedBox(width: width(context) * 0.03),
                    Text(
                      'نیازمندی‌های همشهری',
                      style: textTheme(context).headline1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [],
            ),
          ),
        ),
      ),
    );
  }
}
