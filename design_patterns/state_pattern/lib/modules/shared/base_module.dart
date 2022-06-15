import 'package:get_it/get_it.dart';

abstract class BaseModule {
  Future<void> init();

  GetIt get i => GetIt.instance;
}
