import 'dart:async';

import '../../core.dart';

abstract class BaseModule {
  Future<void> init();

  List<AppRoute> get routes;

  InjectionContainer get instance => InjectionContainer.instance;
}
