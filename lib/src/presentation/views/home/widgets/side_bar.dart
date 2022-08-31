import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/config/app_router.dart';
import 'package:goshop/src/presentation/logic/get_category_controller.dart';
import 'package:goshop/src/presentation/logic/get_store_controller.dart';
import 'package:goshop/src/presentation/logic/get_sub_category_controller.dart';

class SideBar extends StatelessWidget {
  final double height;
  const SideBar({Key? key, this.height = 800}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.lazyPut(() => SubCategoryController());
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          SideBarTitle(
              theme: theme, titleText: 'دسته بندی', titleIcon: Icons.sort),
          Expanded(
            child: GetBuilder<CategoryController>(
              builder: (cat) {
                return ListView.separated(
                  itemCount: cat.cateoryList.length,
                  itemBuilder: (context, index) {
                    return Theme(
                      data: theme.copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          cat.cateoryList[index].categoryName ?? 'نامشخص',
                          style: theme.textTheme.subtitle1,
                        ),
                        expandedAlignment: Alignment.centerRight,
                        childrenPadding: const EdgeInsets.only(
                          right: 0,
                          top: 14,
                          bottom: 14,
                        ),
                        backgroundColor: Colors.transparent,
                        collapsedBackgroundColor: Colors.transparent,
                        children: [
                          ...cat.cateoryList[index].subCategories!.map((e) {
                            return InkWell(
                              onTap: () {
                                Get.find<StoresController>()
                                    .getStoreWithSubCAtegoryId(
                                        id: e.subCategoryId!);
                                AppRouter.appRouter
                                    .navigateTo(context, '/stores');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 34,
                                  top: 14,
                                  bottom: 14,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    e.subCategoryName!,
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      color: theme.colorScheme.outline.withOpacity(.2),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarTitle extends StatelessWidget {
  const SideBarTitle({
    Key? key,
    required this.theme,
    required this.titleText,
    required this.titleIcon,
  }) : super(key: key);

  final ThemeData theme;
  final String titleText;
  final IconData titleIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 54,
      color: theme.colorScheme.secondary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: theme.textTheme.headline6,
          ),
          Icon(
            titleIcon,
            color: Colors.white,
            size: 38,
          ),
        ],
      ),
    );
  }
}
