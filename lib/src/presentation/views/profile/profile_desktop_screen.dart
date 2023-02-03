import 'package:flutter/material.dart';

class ProfileDesktopScreen extends StatelessWidget {
  const ProfileDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Profile'),
          ),
        ),
      ),
    );
  }
}
