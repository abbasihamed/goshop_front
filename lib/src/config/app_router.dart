import 'package:fluro/fluro.dart';
import 'package:goshop/src/presentation/views/auth/auth_desktop_screen.dart';
import 'package:goshop/src/presentation/views/auth/auth_verify_desktop_screen.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';
import 'package:goshop/src/presentation/views/profile/profile_desktop_screen.dart';
import 'package:goshop/src/presentation/views/store_details/store_details_desktop.dart';
import 'package:goshop/src/presentation/views/stores_list/stores_list_desktop_screen.dart';
import 'package:goshop/src/presentation/views/stores/stores_desktop_screen.dart';

class AppRouter {
  static final appRouter = FluroRouter();

  static Handler homePage = Handler(handlerFunc: (context, parameters) {
    return const HomeDesktopscreen();
  });

  static Handler storesPage = Handler(handlerFunc: (context, parameters) {
    return StoreDesktopScreen();
  });

  static Handler storesListPage = Handler(handlerFunc: (context, parameters) {
    return const StoreslistDesktopScreen();
  });

  static Handler storeDetailPage = Handler(
    handlerFunc: (context, parameters) => const StoreDetailsDesktop(),
  );

  static Handler authPage = Handler(handlerFunc: (context, parameters) {
    return AuthDesktopScreen();
  });

  static Handler authVerifyPage = Handler(handlerFunc: (context, parameters) {
    return AuthVerifyCodedesktopScreen(
      mobileNumber: context!.settings!.arguments as String,
    );
  });

  static Handler profilePage = Handler(handlerFunc: (context, parameters) {
    return const ProfileDesktopScreen();
  });
  static void defineRoute() {
    appRouter.define('/', handler: homePage);
    appRouter.define('/stores', handler: storesPage);
    appRouter.define('/stores-list', handler: storesListPage);
    appRouter.define('/store-detail', handler: storeDetailPage);
    appRouter.define('/authentication', handler: authPage);
    appRouter.define('/authentication-verify', handler: authVerifyPage);
    appRouter.define('/profile', handler: profilePage);
  }
}
