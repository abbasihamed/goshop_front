import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/config/overlay/location.dart';
import 'package:goshop/src/config/overlay/search_suggestion.dart';
import 'package:goshop/src/config/responsive/mediaquery_getter.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';

class HomeDesktopscreen extends StatelessWidget {
  const HomeDesktopscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeHeader(),
                SizedBox(height: 30),
                Align(
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
                HomeStoreBody(),
                HomeFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      color: AppColors.hint.withOpacity(0.1),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150, top: 32),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FooterBasicData(
                      title: 'دسترسی سریع',
                      subtitle: [
                        'درباره ما',
                        'بلاگ',
                        'نقشه سایت',
                        'فرصت های شغلی',
                      ],
                    ),
                    SizedBox(width: width(context) * 0.1),
                    const FooterBasicData(
                      title: 'راهنمای مشتریان',
                      subtitle: [
                        'سوالات متداول',
                        'تماس با پشتیبانی',
                        'راهنما و پشتیبانی',
                        'قوانین و مقررات',
                      ],
                    ),
                    SizedBox(width: width(context) * 0.1),
                    const FooterBasicData(
                      title: 'خدمات',
                      subtitle: [
                        'همه فروشگاه ها',
                        'همه مشاوران',
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              // height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/image/footer.png',
                      fit: BoxFit.fitWidth,
                      color: AppColors.hint.withOpacity(.5),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/image/footer2.png',
                      fit: BoxFit.fitWidth,
                      color: AppColors.hint.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FooterBasicData extends StatelessWidget {
  final String title;
  final List<String> subtitle;
  const FooterBasicData({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme(context).labelMedium,
        ),
        const SizedBox(height: 24),
        ...subtitle.map((e) {
          int index = subtitle.indexOf(e);
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              subtitle[index],
              style: textTheme(context).subtitle1,
            ),
          );
        }),
      ],
    );
  }
}

class HomeStoreBody extends StatelessWidget {
  const HomeStoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150, right: 150, top: 68),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.campaign_outlined,
                color: Color(0xFF171725),
                size: 38,
              ),
              SizedBox(width: width(context) * 0.005),
              Text(
                'نزدیک ترین خدمات',
                style: textTheme(context).headlineLarge,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              CustomChip(title: 'آفلاین'),
              SizedBox(width: 8),
              CustomChip(title: 'آنلاین'),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 570,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 280,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
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
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              AppRouter.appRouter.navigateTo(context, '/store-detail');
            },
            child: Container(
              width: width(context) * 0.1,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'آگهی های بیشتر',
                    style: textTheme(context)
                        .button!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          const SizedBox(height: 68),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String title;
  const CustomChip({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {},
        child: Chip(
          label: Text(
            title,
            style: textTheme(context).caption,
          ),
          labelStyle: textTheme(context).caption,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class CategoryItems extends StatelessWidget {
  final List<String> images;
  final List<String> title;
  const CategoryItems({
    super.key,
    required this.images,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      textDirection: TextDirection.rtl,
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      verticalDirection: VerticalDirection.down,
      spacing: 90,
      children: images.map((e) {
        int index = images.indexOf(e);
        return InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {},
          child: Column(
            children: [
              Image.asset(images[index]),
              const SizedBox(height: 10),
              Text(
                title[index],
                style: textTheme(context).caption,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

class HomeHeader extends HookWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: double.infinity,
      color: theme(context).primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'نیازمندی‌های همشهری',
                          style: textTheme(context).headline1,
                        ),
                        SizedBox(width: width(context) * 0.03),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'همه خدمات',
                            style: textTheme(context).headline2,
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon(
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
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(height: 1),
                const SizedBox(height: 80),
                Text(
                  'نظرات را بخوان، نظرت را بنویس',
                  style: textTheme(context).headline1,
                ),
                const SizedBox(height: 4),
                Text(
                  'خدمات نزدیک خودت را پیدا کن',
                  style: textTheme(context).headline2,
                ),
                const SizedBox(height: 25),
                const SearchBox(),
              ],
            ),
          ),
          const SizedBox(height: 36.5),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/image/home_header.png',
                    fit: BoxFit.fitWidth,
                    color: AppColors.hint,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/image/home_header2.png',
                    fit: BoxFit.fitWidth,
                    color: AppColors.hint,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchBox extends HookWidget {
  final double? boxWidth;
  final double? searchWidth;
  final double? locationWidth;
  const SearchBox({
    Key? key,
    this.boxWidth,
    this.searchWidth,
    this.locationWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchLink = useState(LayerLink());
    final locationLink = useState(LayerLink());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 75,
        width: boxWidth ?? width(context) * 0.9,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            CompositedTransformTarget(
              link: searchLink.value,
              child: HomeHeaderSearchFiled(
                width: searchWidth ?? width(context) * 0.5,
                hintText: 'جستجوی خدمات',
                hasRaduis: true,
                onTap: () {
                  injection
                      .get<SuggestionOverlay>()
                      .toggelSugges(context, searchLink.value);
                },
              ),
            ),
            CompositedTransformTarget(
              link: locationLink.value,
              child: HomeHeaderSearchFiled(
                width: locationWidth ?? width(context) * 0.23,
                hintText: 'آدرس',
                hasRaduis: false,
                onTap: () {
                  injection
                      .get<LoactionOverlay>()
                      .toggelSugges(context, locationLink.value);
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: width(context) * 0.097,
                height: height(context),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 4),
                    Text(
                      'جستجو',
                      style: textTheme(context).button,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeHeaderSearchFiled extends StatelessWidget {
  final String hintText;
  final double width;
  final bool hasRaduis;
  final VoidCallback? onTap;
  const HomeHeaderSearchFiled({
    Key? key,
    required this.hintText,
    required this.width,
    required this.hasRaduis,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: hasRaduis
            ? const BorderRadius.only(
                bottomRight: Radius.circular(4),
                topRight: Radius.circular(4),
              )
            : null,
      ),
      child: TextFormField(
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
