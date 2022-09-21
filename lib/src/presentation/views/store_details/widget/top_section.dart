import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/data/models/sub_category_models.dart';
import 'package:goshop/src/presentation/components/custom_button.dart';
import 'package:goshop/src/presentation/logic/get_store_controller.dart';
import 'package:goshop/src/presentation/views/store_details/widget/store_detail_images.dart';
import 'package:goshop/src/presentation/views/store_details/widget/store_rating.dart';

class DetailTopSection extends StatefulWidget {
  const DetailTopSection({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  State<DetailTopSection> createState() => _DetailTopSectionState();
}

class _DetailTopSectionState extends State<DetailTopSection> {
  bool isBranches = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 645,
            child: Column(
              children: [
                const StoreDetailImages(),
                const SizedBox(height: 22),
                StoreRating(theme: theme)
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 26),
              child: GetBuilder<StoresController>(
                builder: (store) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailDescription(theme: theme),
                      const SizedBox(height: 18),
                      TabBar(
                        onTap: (index) {},
                        mouseCursor: SystemMouseCursors.click,
                        controller: widget.tabController,
                        isScrollable: true,
                        unselectedLabelColor: theme.colorScheme.secondary,
                        unselectedLabelStyle: theme.textTheme.subtitle2,
                        labelStyle: theme.textTheme.subtitle1,
                        labelColor: theme.colorScheme.secondary,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: theme.primaryColor,
                            width: 2,
                          ),
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                style:
                                                    theme.textTheme.subtitle1,
                                              ),
                                              Text(
                                                'شمس تبریزی، کوچه هاشمی وند، پلاک 6 واحد 2',
                                                style:
                                                    theme.textTheme.subtitle2,
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
                                                style:
                                                    theme.textTheme.subtitle1,
                                              ),
                                              Text(
                                                '9 الی 14 - 16 الی 22',
                                                style:
                                                    theme.textTheme.subtitle2,
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
                                              style: theme.textTheme.subtitle2,
                                            ),
                                            Icon(
                                              isBranches
                                                  ? Icons
                                                      .keyboard_arrow_down_rounded
                                                  : Icons
                                                      .arrow_forward_ios_rounded,
                                              size: isBranches ? 24 : 16,
                                              color: theme.primaryColor,
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
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.subtitle2,
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final crt = Get.find<StoresController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              crt.store?.name! ?? '',
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
            crt.store?.description! ?? '',
            style: theme.textTheme.subtitle2,
          ),
        ),
      ],
    );
  }
}
