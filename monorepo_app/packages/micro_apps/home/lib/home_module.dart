import 'package:core/core.dart';

import 'home.dart';

class HomeModule extends BaseModule {
  @override
  Future<void> init() async {
    instance.registerFactory<HomeController>(
      HomeController.new,
    );
  }

  @override
  List<AppRoute> get routes => [
        AppRoute(
          name: AppRoutes.homePage,
          child: (_) => HomePage(controller: instance()),
        )
      ];
}
