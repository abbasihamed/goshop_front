import 'package:flutter/material.dart';
import 'package:goshop/src/presentation/views/auth/auth_desktop_screen.dart';

class AuthVerifyCodedesktopScreen extends StatelessWidget {
  const AuthVerifyCodedesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: AuthCard(),
            ),
          ),
        ),
      ),
    );
  }
}
