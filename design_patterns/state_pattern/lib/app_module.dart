import 'package:dio/dio.dart';
import 'modules/home/home_module.dart';

import 'modules/shared/base_module.dart';

class AppModule extends BaseModule {
  List<BaseModule> get modules => [
        HomeModule(),
      ];

  @override
  Future<void> init() async {
    i.registerLazySingleton(() => Dio());

    for (var module in modules) {
      await module.init();
    }
  }
}
