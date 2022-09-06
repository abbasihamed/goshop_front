import 'package:flutter/material.dart';
import 'package:goshop/src/core/keys.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/presentation/components/top_bar.dart';
import 'package:goshop/src/presentation/views/store_details/widget/bottom_section.dart';
import 'package:goshop/src/presentation/views/store_details/widget/top_section.dart';

class StoreDetailDesktopScreen extends StatefulWidget {
  final StoreModel storeModel;
  const StoreDetailDesktopScreen({
    Key? key,
    required this.storeModel,
  }) : super(key: key);

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
    scrollController.addListener(() {
      isShow = scrollController.offset < 300;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.storeModel);
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
                    DetailTopSection(
                        theme: theme, tabController: tabController),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    DetailBottomSection(theme: theme),
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
