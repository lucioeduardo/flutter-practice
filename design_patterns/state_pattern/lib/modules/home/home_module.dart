import 'package:state_pattern/modules/home/data/usecases/remote_get_random_activity.dart';
import 'package:state_pattern/modules/home/domain/usecases/get_random_activity_usecase.dart';
import 'package:state_pattern/modules/home/presentation/pages/home_store.dart';
import 'package:state_pattern/modules/shared/base_module.dart';

class HomeModule extends BaseModule {
  @override
  Future<void> init() async {
    i.registerFactory<GetRandomActivityUsecase>(() => RemoteGetRandomActivity(client: i()));

    i.registerFactory<HomeStore>(() => HomeStore(getRandomActivityUsecase: i()));
  }
}
