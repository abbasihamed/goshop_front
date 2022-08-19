import 'package:flutter/material.dart';
import 'package:goshop/src/presentation/components/nav_bar_list_items.dart';

import '../../components/top_bar.dart';
import '../home/widgets/side_bar.dart';

class StoreDesktopScreen extends StatelessWidget {
  const StoreDesktopScreen({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                const TopBar(),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SideBar(),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 800,
                          child: GridView.builder(
                            itemCount: 12,
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
    );
  }
}
