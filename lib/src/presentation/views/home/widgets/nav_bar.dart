import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goshop/src/presentation/logic/scroll_controller.dart';

class MostViewedNavBar extends StatelessWidget {
  const MostViewedNavBar({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'فروشگاه های پربازدید',
            style: theme.textTheme.subtitle1!.copyWith(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Get.find<ListScrollController>().goBack();
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Get.find<ListScrollController>().goNext();
                },
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
