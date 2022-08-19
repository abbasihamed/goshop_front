import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/presentation/logic/scroll_controller.dart';

import '../../components/custom_textfields.dart';
import '../../components/top_bar.dart';
import 'widgets/nav_bar.dart';
import 'widgets/nav_bar_list.dart';
import 'widgets/side_bar.dart';

class HomeDesktopscreen extends StatelessWidget {
  const HomeDesktopscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.lazyPut(() => ListScrollController());
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
                          child: SingleChildScrollView(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  CustomTextFields(theme: theme),
                                  const SizedBox(height: 200),
                                  MostViewedNavBar(theme: theme),
                                  const NavBarList(),
                                ],
                              ),
                            ),
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
