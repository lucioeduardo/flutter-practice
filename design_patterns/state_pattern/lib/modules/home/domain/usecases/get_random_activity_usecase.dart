import 'package:state_pattern/modules/home/domain/models/activity_model.dart';

abstract class GetRandomActivityUsecase {
  Future<ActivityModel> call();
}
