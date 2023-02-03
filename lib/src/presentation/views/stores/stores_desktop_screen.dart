import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/injection.dart';
import 'package:goshop/src/presentation/components/custom_dropDown.dart';
import 'package:goshop/src/presentation/components/nav_bar_list_items.dart';
import 'package:goshop/src/presentation/logic/get_store_controller.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';

import '../../components/top_bar.dart';
import '../home/widgets/side_bar.dart';

class StoreDesktopScreen extends StatelessWidget {
  StoreDesktopScreen({Key? key}) : super(key: key);

  final LayerLink link = LayerLink();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.find<StoresController>().getAllStore();
        return true;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TopBar(),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: SideBar()),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 48,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'همه دسته بندی ها',
                                        style: theme.textTheme.subtitle2!
                                            .copyWith(
                                                color: theme
                                                    .colorScheme.secondary
                                                    .withOpacity(.7)),
                                      ),
                                      CompositedTransformTarget(
                                        link: link,
                                        child: TextButton.icon(
                                          style: ButtonStyle(
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                          onPressed: () {
                                            injection
                                                .get<CustomDropDown>()
                                                .toggelCustomDropDown(
                                                    context, link,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'نزدیک ترین',
                                                          style: theme.textTheme
                                                              .subtitle1,
                                                        ),
                                                        const Divider(),
                                                        Text(
                                                          'جدید ترین',
                                                          style: theme.textTheme
                                                              .subtitle1,
                                                        ),
                                                        const Divider(),
                                                        Text(
                                                          'محبوب ترین',
                                                          style: theme.textTheme
                                                              .subtitle1,
                                                        )
                                                      ],
                                                    ),
                                                    height: 150);
                                          },
                                          icon: Icon(
                                            Icons.filter_alt_outlined,
                                            color: theme.colorScheme.secondary,
                                          ),
                                          label: Text(
                                            'جدید ترین',
                                            style: theme.textTheme.subtitle2,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                                SizedBox(
                                  height: 700,
                                  child: GetBuilder<StoresController>(
                                    builder: (store) {
                                      return GridView.builder(
                                        itemCount: store.storeList.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 55,
                                          mainAxisExtent: 420,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemBuilder: (context, index) {
                                          return NvaBarListItems(
                                            index: index,
                                            storesController: store,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                      color: theme.colorScheme.secondary.withOpacity(.25),
                      thickness: 1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
