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
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Align(
                          alignment: Alignment.center,
                          child: CategoryItems(
                            images: [
                              'assets/image/digital.png',
                              'assets/image/home_kitchen.png',
                              'assets/image/style.png',
                              'assets/image/beauty.png',
                              'assets/image/game.png',
                              'assets/image/art.png',
                              'assets/image/medical.png',
                              'assets/image/car.png',
                              'assets/image/home.png',
                            ],
                            title: [
                              'کالای دیجیتال',
                              'خانه و آشپزخانه',
                              'مد و پوشاک',
                              'زیبایی و سلامت',
                              'سرگرمی و فراغت',
                              'فرهنگ و هنر',
                              'سلامتی و درمانی',
                              'وسایل نقلیه',
                              'املاک و اسکان',
                            ],
                          ),
                        ),
                        const SizedBox(height: 76),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            CustomChip(title: 'آفلاین'),
                            SizedBox(width: 8),
                            CustomChip(title: 'آنلاین'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: AppColors.divider, height: 1),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 650,
                          child: GridView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: 24,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 280,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.asset(
                                            'assets/image/sample.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: AppColors.scaffold,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                'assets/image/ticket.png',
                                                color: const Color(0xFF82C43C),
                                              ),
                                              const Text(
                                                'آنلاین',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF82C43C),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'نمایندگی فروش خودرو ایران خودرو',
                                    style: textTheme(context).labelMedium,
                                  ),
                                  Text(
                                    'فاصله تا کاربر 2.2 کیلومتر',
                                    style: textTheme(context).subtitle1,
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Stack(
                                        children: const [
                                          Icon(
                                            Icons.fiber_manual_record_outlined,
                                            color: Color(0xFFFC5A5A),
                                            size: 30,
                                          ),
                                          Positioned(
                                            top: 0,
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Icon(
                                              Icons.fiber_manual_record,
                                              color: Color(0xFFFC5A5A),
                                              size: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ).toList(),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  const HomeFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
