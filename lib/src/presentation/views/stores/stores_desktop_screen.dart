import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/presentation/components/nav_bar_list_items.dart';
import 'package:goshop/src/presentation/logic/get_store_controller.dart';

import '../../components/top_bar.dart';
import '../home/widgets/side_bar.dart';

class StoreDesktopScreen extends StatelessWidget {
  const StoreDesktopScreen({Key? key}) : super(key: key);

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
                  const TopBar(),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SideBar(height: 400),
                              Container(
                                height: 400,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                        // const SideBar(height: 400),
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: 800,
                            child: GetBuilder<StoresController>(
                              builder: (store) {
                                return GridView.builder(
                                  itemCount: store.storeList.length,
                                  padding: const EdgeInsets.only(right: 12),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
