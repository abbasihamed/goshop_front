import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goshop/src/core/keys.dart';
import 'package:goshop/src/presentation/components/custom_textfields.dart';
import 'package:goshop/src/presentation/components/top_bar.dart';

class StoreDetailDesktopScreen extends StatefulWidget {
  const StoreDetailDesktopScreen({Key? key}) : super(key: key);

  @override
  State<StoreDetailDesktopScreen> createState() =>
      _StoreDetailDesktopScreenState();
}

class _StoreDetailDesktopScreenState extends State<StoreDetailDesktopScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;

  bool isShow = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    // overLayCreate(context);
    scrollController.addListener(() {
      isShow = scrollController.offset < 300;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopBar(),
                    const SizedBox(height: 28),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 645,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 500,
                                      width: 130,
                                      child: ListView.builder(
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Image.asset(
                                                'assets/logos/goshop_logo.png'),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    SizedBox(
                                      height: 500,
                                      child: Image.asset(
                                        'assets/logos/goshop_logo.png',
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: theme.colorScheme.secondary),
                                      borderRadius: BorderRadius.circular(16)),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 26),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'بایلی شاپ',
                                        style: theme.textTheme.headline6!
                                            .copyWith(
                                                color: theme
                                                    .colorScheme.secondary),
                                      ),
                                      CustomButton(
                                        theme: theme,
                                        height: 50,
                                        title: 'اطلاعات تماس',
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    'توضیحات',
                                    style: theme.textTheme.subtitle1,
                                  ),
                                  const SizedBox(height: 18),
                                  SizedBox(
                                    height: 150,
                                    width: 600,
                                    child: Text(
                                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد',
                                      style: theme.textTheme.subtitle2,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  TabBar(
                                    onTap: (index) {},
                                    mouseCursor: SystemMouseCursors.click,
                                    controller: tabController,
                                    isScrollable: true,
                                    unselectedLabelColor:
                                        theme.colorScheme.secondary,
                                    unselectedLabelStyle:
                                        theme.textTheme.subtitle2,
                                    labelStyle: theme.textTheme.subtitle1,
                                    labelColor: theme.colorScheme.secondary,
                                    indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: theme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    indicatorPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 15),
                                    tabs: const [
                                      Text('حضوری'),
                                      Text('آنلاین'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: TabBarView(
                                      controller: tabController,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 28),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'آدرس : ',
                                                            style: theme
                                                                .textTheme
                                                                .subtitle1,
                                                          ),
                                                          Text(
                                                            'شمس تبریزی، کوچه هاشمی وند، پلاک 6 واحد 2',
                                                            style: theme
                                                                .textTheme
                                                                .subtitle2,
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'ساعات کاری : ',
                                                            style: theme
                                                                .textTheme
                                                                .subtitle1,
                                                          ),
                                                          Text(
                                                            '9 الی 14 - 16 الی 22',
                                                            style: theme
                                                                .textTheme
                                                                .subtitle2,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    hoverColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    onTap: () {},
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'شعبه ها',
                                                          style: theme.textTheme
                                                              .subtitle2,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          size: 16,
                                                          color: theme
                                                              .primaryColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 150,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.map,
                                                      size: 48,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      'مشاهده موقعیت فروشگاه روی نقشه',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: theme
                                                          .textTheme.subtitle2,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SizedBox(
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
                                color: theme.colorScheme.secondary
                                    .withOpacity(0.5),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                height: 200,
                                width: 600,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: theme.colorScheme.secondary),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'حامد عباسی',
                                                style:
                                                    theme.textTheme.subtitle2,
                                              ),
                                              Text(
                                                '10 شهریور 1401',
                                                style: theme
                                                    .textTheme.subtitle2!
                                                    .copyWith(fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: theme.colorScheme.secondary
                                              .withOpacity(.5),
                                          height: 1,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد',
                                          style: theme.textTheme.subtitle2!
                                              .copyWith(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '0',
                                                  style: theme
                                                      .textTheme.subtitle2!
                                                      .copyWith(fontSize: 14),
                                                ),
                                                const SizedBox(width: 3),
                                                Transform(
                                                  alignment: Alignment.center,
                                                  transform:
                                                      Matrix4.rotationY(pi),
                                                  child: const Icon(Icons
                                                      .thumb_down_outlined),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  '0',
                                                  style: theme
                                                      .textTheme.subtitle2!
                                                      .copyWith(fontSize: 14),
                                                ),
                                                const SizedBox(width: 3),
                                                const Icon(
                                                    Icons.thumb_up_outlined),
                                              ],
                                            ),
                                          ],
                                        ),
                                        CustomButton(
                                          theme: theme,
                                          style: theme.textTheme.subtitle2!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 16),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              margin: const EdgeInsets.only(bottom: 40),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 22),
                                    child: Image.asset(
                                      'assets/logos/goshop_logo.png',
                                      height: 300,
                                      width: 500,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'بایلی شاپ',
                                        style: theme.textTheme.headline6!
                                            .copyWith(
                                                color: theme
                                                    .colorScheme.secondary),
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
                                    style: theme.textTheme.subtitle2!
                                        .copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset('assets/logos/telegram.png',
                                          height: 18),
                                      const SizedBox(width: 3),
                                      Image.asset('assets/logos/whatsapp.png',
                                          height: 18),
                                      const SizedBox(width: 3),
                                      Image.asset('assets/logos/instagram.png',
                                          height: 18),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: isShow
                ? InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      scrollController.position.ensureVisible(
                        linkListKey.currentContext!.findRenderObject()!,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'دیدگاه ها',
                          style: theme.textTheme.subtitle1,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 32,
                          color: theme.primaryColor,
                        ),
                      ],
                    ),
                  )
                : null),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final double? height;
  final double? width;
  final TextStyle? style;
  final VoidCallback onPressed;
  const CustomButton(
      {Key? key,
      required this.theme,
      required this.title,
      required this.onPressed,
      this.height = 60,
      this.width = 150,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            theme.primaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style ??
              theme.textTheme.subtitle1!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
