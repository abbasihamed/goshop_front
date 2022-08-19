import 'package:fluro/fluro.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';
import 'package:goshop/src/presentation/views/stores/stores_desktop_screen.dart';

class AppRouter {
  static final appRouter = FluroRouter();

  static Handler homePage = Handler(handlerFunc: (context, parameters) {
    return const HomeDesktopscreen();
  });

  static Handler storePage = Handler(handlerFunc: (context, parameters) {
    return const StoreDesktopScreen();
  });

  static void defineRoute() {
    appRouter.define('/', handler: homePage);
    appRouter.define('/store', handler: storePage);
  }
}
