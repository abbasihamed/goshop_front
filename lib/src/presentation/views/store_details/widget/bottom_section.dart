import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goshop/src/core/keys.dart';
import 'package:goshop/src/presentation/components/custom_button.dart';
import 'package:goshop/src/presentation/components/custom_textfields.dart';

class DetailBottomSection extends StatelessWidget {
  const DetailBottomSection({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        key: linkListKey,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Color(0xFFFFD233),
                      size: 48,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              CustomTextFields(
                theme: theme,
                hintText: 'دیدگاه ( اختیاری )',
                maxLines: 6,
                height: 190,
                width: 600,
              ),
              const SizedBox(height: 18),
              CustomButton(
                theme: theme,
                title: 'ثبت',
                onPressed: () {},
              ),
              const SizedBox(height: 18),
              Container(
                height: 1,
                width: 900,
                color: theme.colorScheme.secondary.withOpacity(0.5),
              ),
              const SizedBox(height: 32),
              Container(
                height: 200,
                width: 600,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.secondary),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'حامد عباسی',
                                style: theme.textTheme.subtitle2,
                              ),
                              Text(
                                '10 شهریور 1401',
                                style: theme.textTheme.subtitle2!
                                    .copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: theme.colorScheme.secondary.withOpacity(.5),
                          height: 1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد',
                          style:
                              theme.textTheme.subtitle2!.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '0',
                                  style: theme.textTheme.subtitle2!
                                      .copyWith(fontSize: 14),
                                ),
                                const SizedBox(width: 3),
                                Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(pi),
                                  child: const Icon(Icons.thumb_down_outlined),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                  '0',
                                  style: theme.textTheme.subtitle2!
                                      .copyWith(fontSize: 14),
                                ),
                                const SizedBox(width: 3),
                                const Icon(Icons.thumb_up_outlined),
                              ],
                            ),
                          ],
                        ),
                        CustomButton(
                          theme: theme,
                          style: theme.textTheme.subtitle2!
                              .copyWith(color: Colors.white, fontSize: 16),
                          title: 'پاسخ',
                          height: 30,
                          width: 75,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            top: 10,
            left: 12,
            child: Container(
              height: 600,
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Image.asset(
                      'assets/logos/goshop_logo.png',
                      height: 300,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'بایلی شاپ',
                        style: theme.textTheme.headline6!
                            .copyWith(color: theme.colorScheme.secondary),
                      ),
                      CustomButton(
                        theme: theme,
                        height: 50,
                        title: 'اطلاعات تماس',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'توضیحات',
                    style: theme.textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد',
                    style: theme.textTheme.subtitle2!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logos/telegram.png', height: 18),
                      const SizedBox(width: 3),
                      Image.asset('assets/logos/whatsapp.png', height: 18),
                      const SizedBox(width: 3),
                      Image.asset('assets/logos/instagram.png', height: 18),
                    ],
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
