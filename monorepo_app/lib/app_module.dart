import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:splash/splash.dart';

class AppModule extends MainModule {
  @override
  List<BaseModule> get modules => [SplashModule()];

  @override
  Future<void> registerGlobalInjections() async {
    instance.registerLazySingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>.new,
    );
    instance.registerLazySingleton<AppNavigator>(
      () => AppNavigatorImpl(navigatorKey: instance()),
    );
  }

  @override
  List<AppRoute> get routes => [];
}
