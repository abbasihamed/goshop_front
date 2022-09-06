import 'package:flutter/material.dart';
import 'package:goshop/src/presentation/components/custom_button.dart';

class DetailTopSection extends StatefulWidget {
  const DetailTopSection({
    Key? key,
    required this.theme,
    required this.tabController,
  }) : super(key: key);

  final ThemeData theme;
  final TabController tabController;

  @override
  State<DetailTopSection> createState() => _DetailTopSectionState();
}

class _DetailTopSectionState extends State<DetailTopSection> {
  bool isBranches = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Image.asset('assets/logos/goshop_logo.png'),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: widget.theme.colorScheme.secondary),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 20,
                        margin: const EdgeInsets.only(bottom: 34),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '3 از 5',
                          style: widget.theme.textTheme.subtitle2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    '5',
                                    style: widget.theme.textTheme.subtitle2!
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 4),
                              Container(
                                height: 20,
                                width: 590,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF9D9D98).withOpacity(.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 20,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'بایلی شاپ',
                        style: widget.theme.textTheme.headline6!.copyWith(
                            color: widget.theme.colorScheme.secondary),
                      ),
                      CustomButton(
                        theme: widget.theme,
                        height: 50,
                        title: 'اطلاعات تماس',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'توضیحات',
                    style: widget.theme.textTheme.subtitle1,
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 150,
                    width: 600,
                    child: Text(
                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد',
                      style: widget.theme.textTheme.subtitle2,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TabBar(
                    onTap: (index) {},
                    mouseCursor: SystemMouseCursors.click,
                    controller: widget.tabController,
                    isScrollable: true,
                    unselectedLabelColor: widget.theme.colorScheme.secondary,
                    unselectedLabelStyle: widget.theme.textTheme.subtitle2,
                    labelStyle: widget.theme.textTheme.subtitle1,
                    labelColor: widget.theme.colorScheme.secondary,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: widget.theme.primaryColor,
                        width: 2,
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 15),
                    tabs: const [
                      Text('حضوری'),
                      Text('آنلاین'),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: TabBarView(
                      controller: widget.tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'آدرس : ',
                                            style: widget
                                                .theme.textTheme.subtitle1,
                                          ),
                                          Text(
                                            'شمس تبریزی، کوچه هاشمی وند، پلاک 6 واحد 2',
                                            style: widget
                                                .theme.textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'ساعات کاری : ',
                                            style: widget
                                                .theme.textTheme.subtitle1,
                                          ),
                                          Text(
                                            '9 الی 14 - 16 الی 22',
                                            style: widget
                                                .theme.textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      isBranches = !isBranches;
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'شعبه ها',
                                          style:
                                              widget.theme.textTheme.subtitle2,
                                        ),
                                        Icon(
                                          isBranches
                                              ? Icons
                                                  .keyboard_arrow_down_rounded
                                              : Icons.arrow_forward_ios_rounded,
                                          size: isBranches ? 24 : 16,
                                          color: widget.theme.primaryColor,
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
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.map,
                                      size: 48,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'مشاهده موقعیت فروشگاه روی نقشه',
                                      textAlign: TextAlign.center,
                                      style: widget.theme.textTheme.subtitle2,
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
                  ),
                  const SizedBox(height: 18),
                  if (isBranches)
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
