import 'package:flutter/material.dart';
import 'package:goshop/src/config/app_router.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logos/goshop_logo.png',
          height: 100,
        ),
        InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            AppRouter.appRouter.navigateTo(context, '/authentication');
          },
          child: Text(
            'ورود / ثبت نام',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
