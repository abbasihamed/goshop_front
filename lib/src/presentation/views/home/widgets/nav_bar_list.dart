import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/presentation/logic/get_store_controller.dart';
import 'package:goshop/src/presentation/logic/scroll_controller.dart';

import '../../../components/nav_bar_list_items.dart';

class NavBarList extends StatelessWidget {
  const NavBarList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 450,
        width: double.infinity,
        child: MouseRegion(
          cursor: SystemMouseCursors.grab,
          child: GetBuilder<ListScrollController>(
            builder: (controller) {
              return GetBuilder<StoresController>(builder: (store) {
                return ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: store.storeList.length,
                  itemBuilder: (context, index) {
                    return NvaBarListItems(
                      index: index,
                      storesController: store,
                    );
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
