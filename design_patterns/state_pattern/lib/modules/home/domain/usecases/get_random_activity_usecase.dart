import '../models/activity_model.dart';

abstract class GetRandomActivityUsecase {
  Future<ActivityModel> call();
}
