import 'package:flutter/material.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';

class SuggestionOverlay {
  bool _isShow = false;

  late OverlayEntry overlayEntry;

  void searchSugges(LayerLink link) {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: link.leaderSize!.width - 5,
          child: CompositedTransformFollower(
            link: link,
            offset: const Offset(0, 70),
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
                  child: ListView.separated(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: ListTile(
                          minVerticalPadding: 12,
                          leading: Text('فاصله تا شما 1.7 کیلومتر',
                              style: textTheme(context).overline),
                          title: Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'خدمات: ',
                                    style: textTheme(context).labelMedium,
                                  ),
                                  TextSpan(
                                    text: 'بایلی شاپ',
                                    style: textTheme(context)
                                        .labelMedium!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          subtitle: Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'دسته بندی: ',
                                    style: textTheme(context)
                                        .subtitle1!
                                        .copyWith(
                                            color: const Color(0xFF171725)),
                                  ),
                                  TextSpan(
                                    text: 'دیجیتال',
                                    style: textTheme(context).subtitle1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.divider,
                      endIndent: 50,
                      indent: 50,
                      height: 1,
                    ),
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
      searchSugges(link);
      Overlay.of(context)!.insert(overlayEntry);
      _isShow = true;
    }
  }
}
