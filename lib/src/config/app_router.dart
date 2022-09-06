import 'package:fluro/fluro.dart';
import 'package:goshop/src/data/models/store_models.dart';
import 'package:goshop/src/presentation/views/home/home_desktop_screen.dart';
import 'package:goshop/src/presentation/views/store_details/store_detail_desktop_screen.dart';
import 'package:goshop/src/presentation/views/stores/stores_desktop_screen.dart';

class AppRouter {
  static final appRouter = FluroRouter();

  static Handler homePage = Handler(handlerFunc: (context, parameters) {
    return const HomeDesktopscreen();
  });

  static Handler storesPage = Handler(handlerFunc: (context, parameters) {
    return const StoreDesktopScreen();
  });

  static Handler storeDetailPage = Handler(handlerFunc: (context, parameters) {
    return StoreDetailDesktopScreen(
        storeModel: context!.settings!.arguments as StoreModel);
  });

  static void defineRoute() {
    appRouter.define('/', handler: homePage);
    appRouter.define('/stores', handler: storesPage);
    appRouter.define('/store-detail', handler: storeDetailPage);
  }
}
