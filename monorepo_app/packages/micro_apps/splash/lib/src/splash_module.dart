import 'package:core/core.dart';

import '../splash.dart';

class SplashModule extends BaseModule {
  @override
  Future<void> init() async {
    instance.registerFactory<SplashController>(
      () => SplashController(appNavigator: instance()),
    );
  }

  @override
  List<AppRoute> get routes => [
        AppRoute(
          name: AppRoutes.splashPage,
          child: (_) => SplashPage(
            controller: instance(),
          ),
        )
      ];
}
