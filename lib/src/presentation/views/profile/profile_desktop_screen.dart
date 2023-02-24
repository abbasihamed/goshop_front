import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goshop/src/config/theme/app_colors.dart';
import 'package:goshop/src/config/theme/theme_getter.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';
import 'package:goshop/src/presentation/views/store_details/store_details_desktop.dart';

class ProfileDesktopScreen extends StatelessWidget {
  const ProfileDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(showSearch: false),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 247),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          ProfileSideBar(),
                        ],
                      ),
                    ],
                  ),
                ),
                const HomeFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileSideBar extends StatelessWidget {
  const ProfileSideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFF3F3F3),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(2, 5),
            )
          ]),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/image/avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'علی خرامان',
                        style: textTheme(context).subtitle1!.copyWith(
                              color: const Color(0xFF171725),
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(
                    FeatherIcons.edit,
                    color: Color(0xFF129207),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 14),
          const ProfileItems(),
        ],
      ),
    );
  }
}

class ProfileItems extends HookWidget {
  const ProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isSeleted = useState('profile');
    return Column(
      children: [
        ProfileSideBarItem(
          title: 'پروفایل',
          onTap: () {
            isSeleted.value = 'profile';
          },
          isSelcted: isSeleted.value.contains('profile'),
          icons: FeatherIcons.user,
        ),
        const SizedBox(height: 16),
        ProfileSideBarItem(
          title: 'خدمات من',
          onTap: () {
            isSeleted.value = 'my-service';
          },
          isSelcted: isSeleted.value.contains('my-service'),
          icons: Icons.cases_outlined,
        ),
        const SizedBox(height: 16),
        ProfileSideBarItem(
          title: 'پیام ها و اطلاعیه ها',
          onTap: () {
            isSeleted.value = 'message';
          },
          isSelcted: isSeleted.value.contains('message'),
          icons: FeatherIcons.mail,
        ),
        const SizedBox(height: 16),
        ProfileSideBarItem(
          title: 'آدرس های من',
          onTap: () {
            isSeleted.value = 'address';
          },
          isSelcted: isSeleted.value.contains('address'),
          icons: FeatherIcons.mapPin,
        ),
        const SizedBox(height: 16),
        ProfileSideBarItem(
          title: 'نظرات من',
          onTap: () {
            isSeleted.value = 'comments';
          },
          isSelcted: isSeleted.value.contains('comments'),
          icons: FeatherIcons.messageSquare,
        ),
        const SizedBox(height: 16),
        ProfileSideBarItem(
          title: 'درخواست پشتیبانی',
          onTap: () {
            isSeleted.value = 'ask-backup';
          },
          isSelcted: isSeleted.value.contains('ask-backup'),
          icons: Icons.headset_mic_outlined,
        ),
        const SizedBox(height: 16),
        ProfileSideBarItem(
          title: 'آگهی های مورد علاقه',
          onTap: () {
            isSeleted.value = 'followers';
          },
          isSelcted: isSeleted.value.contains('followers'),
          icons: FeatherIcons.bookmark,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FeatherIcons.logOut,
                  color: Color(0xFFFC5A5A),
                  size: 22,
                ),
                const SizedBox(width: 12),
                Text(
                  'خروچ از حساب کاربری',
                  style: textTheme(context).headline2!.copyWith(
                        color: const Color(0xFFFC5A5A),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileSideBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelcted;
  final IconData icons;

  const ProfileSideBarItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelcted,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelcted ? null : onTap,
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: isSelcted ? const Color(0xFF0062FF).withOpacity(.1) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icons,
              color: isSelcted ? AppColors.primary : const Color(0xFF696974),
              size: isSelcted ? 24 : 22,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: textTheme(context).headline2!.copyWith(
                    fontWeight: isSelcted ? FontWeight.w600 : FontWeight.w400,
                    color:
                        isSelcted ? AppColors.primary : const Color(0xFF171725),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
