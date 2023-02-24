import 'dart:html';

import 'package:flutter/material.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/config/responsive/mediaquery_getter.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';

class StoreDetailsDesktop extends StatelessWidget {
  const StoreDetailsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(showSearch: false),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 400),
                  child: Column(
                    children: [
                      const SizedBox(height: 90),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 465,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'بایلی شاپ',
                                  style: textTheme(context)
                                      .headlineLarge!
                                      .copyWith(fontSize: 22),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'دیجیتال',
                                  style: textTheme(context)
                                      .labelMedium!
                                      .copyWith(fontFamily: 'Dana-FaNum'),
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: width(context) * 0.12,
                                        height: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'تماس با فروشنده',
                                          style: textTheme(context)
                                              .button!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: width(context) * 0.12,
                                        height: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'دنبال کردن',
                                          style: textTheme(context)
                                              .button!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                      onPressed: null,
                                      icon: const Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xFF171725),
                                      ),
                                      label: Text(
                                        'تبریز',
                                        style: textTheme(context).subtitle1,
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Stack(
                                          children: const [
                                            Icon(
                                              Icons
                                                  .fiber_manual_record_outlined,
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
                                ),
                                const SizedBox(height: 32),
                                const SocialBox(),
                                const SizedBox(height: 32),
                                const ServiceDatail(),
                                const Divider(
                                    color: AppColors.divider, height: 1),
                                const SizedBox(height: 32),
                                const StoreLocation(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 465,
                            child: Column(
                              children: [
                                Image.asset('assets/image/store-image.png'),
                                const SizedBox(height: 12),
                                SizedBox(
                                  height: 130,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.asset(
                                            'assets/image/store-image.png',
                                            height: 100,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Divider(
                                    color: AppColors.divider, height: 1),
                                const SizedBox(height: 24),
                                Container(
                                  height: 57,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.divider),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('لینک آگهی',
                                          style:
                                              textTheme(context).labelMedium),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFAFAFB),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.copy,
                                                color: Color(0xFF696974),
                                              ),
                                              Text(
                                                'https://hamshahri.com/v/gYAIGRhW',
                                                style: textTheme(context)
                                                    .subtitle1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(color: AppColors.divider, height: 1),
                      const SizedBox(height: 40),
                      const StoreBranch(),
                      const Divider(color: AppColors.divider, height: 1),
                      const SizedBox(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'دیدگاه کاربران',
                                  style: textTheme(context).labelMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'بایلی شاپ',
                                  style: textTheme(context)
                                      .labelMedium!
                                      .copyWith(fontFamily: 'Dana-FaNum'),
                                ),
                                const SizedBox(height: 32),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: ' 4.5',
                                          style: textTheme(context)
                                              .labelMedium!
                                              .copyWith(fontSize: 24)),
                                      TextSpan(
                                        text: ' از 5 ',
                                        style: textTheme(context)
                                            .labelMedium!
                                            .copyWith(fontFamily: 'Dana-FaNum'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'از مجموع 2 امتیاز کاربران',
                                  style: textTheme(context).caption,
                                ),
                                const SizedBox(height: 16),
                                const RateBar(),
                                const RateBar(),
                                const RateBar(),
                                const RateBar(),
                                const RateBar(),
                                const SizedBox(height: 32),
                                InkWell(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: () {},
                                  child: Container(
                                    width: 350,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFF44444F)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'شما هم نظر خود را بنویسید',
                                      style: textTheme(context)
                                          .button!
                                          .copyWith(
                                              color: const Color(0xFF171725)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Comment(),
                                Divider(color: AppColors.divider, height: 1),
                                SizedBox(height: 32),
                                Comment(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                const HomeFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF3DD598),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '5',
              style: textTheme(context)
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'شیک و کاربردی',
                style: textTheme(context).labelMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'حامد عباسی',
                    style: textTheme(context).caption,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '11 روز پیش',
                    style: textTheme(context).caption,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: SizedBox(
                  width: 400,
                  child: Text(
                    'در مجموع ساعت شکیل و خوبیه ولی مقداری ظریفه که واسه مچ‌های کوچیک و خانم‌ها می‌تونه مناسب‌تر باشه و چون من با قیمت فروش ویژه گرفتم راضیم کرد…',
                    style: textTheme(context).headline2!.copyWith(
                          color: const Color(0xFF171725),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RateBar extends StatelessWidget {
  const RateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ارزش خرید نسبت به قیمت',
                style: textTheme(context).overline,
              ),
              Text(
                '3',
                style: textTheme(context).overline,
              ),
            ],
          ),
          const LinearProgressIndicator(
            backgroundColor: Color(0xFFF1F1F5),
            color: Color(0xFF44444F),
            value: .5,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}

class StoreBranch extends StatelessWidget {
  const StoreBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'شعبه های دیگر بایلی شاپ',
            style: textTheme(context).labelMedium,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/image/branch.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/logos/insta-white.png'),
                                    Image.asset(
                                        'assets/logos/telegram-white.png'),
                                    Image.asset(
                                        'assets/logos/whatsapp-white.png'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'شعبه تهران',
                          style: textTheme(context).labelMedium,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF171725),
                            ),
                            Flexible(
                              child: Text(
                                'مرکز خرید نگین، طبقه اول، پلاک ۵۸، فروشگاه خانه ساعت',
                                style: textTheme(context).subtitle1,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class StoreLocation extends StatelessWidget {
  const StoreLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'آدرس فروشگاه',
            style: textTheme(context).labelMedium,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/image/location.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xFF171725),
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'آدرس:  ', style: textTheme(context).subtitle1),
                    TextSpan(
                      text: 'تبریز، ابوریحان، منظریه',
                      style: textTheme(context).caption!.copyWith(
                            color: const Color(0xFF171725),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: Color(0xFF171725),
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'ساعات کاری:  ',
                        style: textTheme(context).subtitle1),
                    TextSpan(
                      text: 'همه روزه 9 الی 14 - 16 الی 22',
                      style: textTheme(context).caption!.copyWith(
                            color: const Color(0xFF171725),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceDatail extends StatelessWidget {
  const ServiceDatail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'جزییات بیشتر',
            style: textTheme(context).labelMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'اسکمی سازندهٔ مطرح ساعت‌های میان‌رده است که از سال ۲۰۱۰ در حال تولید انواع ساعت‌های مچی زنانه و مردانه و همچنین ساعت‌های هوشمند با بالاترین کیفیت ممکن و کمترین قیمت تمام شده برای مصرف‌کننده می‌باشد. دفتر و کارخانهٔ مرکزی این شرکت در شهر گوانگ‌ژو، چین می‌باشد و در بیش از ۲۰۰ کشور جهان از جمله ایران دارای نمایندگی فروش است. اسکمی در کمتر از یک دهه تبدیل به پرفروش‌ترین کمپانی ساعت‌ساز پایین‌رده و میان‌ردهٔ جهان شده‌است.',
            style: textTheme(context).subtitle1,
          )
        ],
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  const SocialBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('صفحات مجازی', style: textTheme(context).labelMedium),
          SizedBox(
            width: 200,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logos/facebook.png'),
                  Image.asset('assets/logos/twitter.png'),
                  Image.asset('assets/logos/linkedin.png'),
                  Image.asset('assets/logos/telegram.png'),
                  Image.asset('assets/logos/whatsapp.png'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showSearch;
  const CustomAppBar({super.key, this.showSearch = true});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: showSearch!
            ? SearchBox(
                boxWidth: width(context) * 0.55,
                searchWidth: width(context) * 0.23,
                locationWidth: width(context) * 0.2,
              )
            : null,
        leadingWidth: 400,
        leading: Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            onPressed: () {
              AppRouter.appRouter.navigateTo(context, '/authentication');
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              color: AppColors.icon,
            ),
            label: Text(
              'حساب کاربری',
              style: textTheme(context).headline2,
            ),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
