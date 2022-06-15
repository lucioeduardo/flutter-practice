import 'package:dio/dio.dart';
import 'package:state_pattern/modules/home/domain/models/activity_model.dart';
import 'package:state_pattern/modules/home/domain/usecases/get_random_activity_usecase.dart';
import 'package:state_pattern/modules/shared/constants/api_constants.dart';

class RemoteGetRandomActivity extends GetRandomActivityUsecase {
  final Dio client;

  RemoteGetRandomActivity({
    required this.client,
  });

  @override
  Future<ActivityModel> call() async {
    final response = await client.get("$apiUrl/activity/");

    return ActivityModel.fromMap(map: response.data);
  }
}
