import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/presentation/logic/get_category_controller.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        height: 800,
        decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.outline.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 54,
              color: theme.colorScheme.secondary,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'دسته بندی',
                    style: theme.textTheme.headline6,
                  ),
                  const Icon(
                    Icons.sort,
                    color: Colors.white,
                    size: 38,
                  ),
                ],
              ),
            ),
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
                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: 34,
                                  top: 14,
                                  bottom: 14,
                                ),
                                child: Text(
                                  e.subCategoryName!,
                                  style: theme.textTheme.subtitle2,
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
      ),
    );
  }
}
