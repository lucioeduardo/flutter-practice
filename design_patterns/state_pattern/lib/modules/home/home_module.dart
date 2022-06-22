import 'data/usecases/remote_get_random_activity.dart';
import 'domain/usecases/get_random_activity_usecase.dart';
import 'presentation/pages/home_store.dart';
import '../shared/base_module.dart';

class HomeModule extends BaseModule {
  @override
  Future<void> init() async {
    i.registerFactory<GetRandomActivityUsecase>(() => RemoteGetRandomActivity(client: i()));

    i.registerFactory<HomeStore>(() => HomeStore(getRandomActivityUsecase: i()));
  }
}
