import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:goshop/src/config/responsive/mediaquery_getter.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';

class LoactionOverlay {
  bool _isShow = false;

  late OverlayEntry overlayEntry;

  void location(LayerLink link) {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: width(context) * 0.33,
          child: CompositedTransformFollower(
            link: link,
            offset: const Offset(-200, 70),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Material(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 12,
                  ),
                  height: 300,
                  decoration: const BoxDecoration(
                    color: AppColors.scaffold,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 230,
                        child: ListView.separated(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: ListTile(
                                minVerticalPadding: 12,
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FeatherIcons.edit,
                                        color: Color(0xFF129207),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        size: 26,
                                        color: Color(0xFFFC5A5A),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'تبریز',
                                    style: textTheme(context).labelMedium,
                                  ),
                                ),
                                subtitle: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'سعادت آباد، میدان فرهنگ، خ آبشار، نبش کوچه کوهسار، کوچه هاشمی وند',
                                    style: textTheme(context).subtitle1,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                            color: AppColors.divider,
                            endIndent: 50,
                            indent: 25,
                            height: 1,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'آدرس جدید',
                              style: textTheme(context)
                                  .button!
                                  .copyWith(color: AppColors.primary),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.add,
                              color: theme(context).primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void toggelSugges(BuildContext context, LayerLink link) {
    if (_isShow) {
      overlayEntry.remove();
      _isShow = false;
    } else {
      location(link);
      Overlay.of(context)!.insert(overlayEntry);
      _isShow = true;
    }
  }
}
