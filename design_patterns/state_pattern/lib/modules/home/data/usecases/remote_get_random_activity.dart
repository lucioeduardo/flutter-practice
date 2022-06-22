import 'package:dio/dio.dart';

import '../../../shared/constants/api_constants.dart';
import '../../domain/models/activity_model.dart';
import '../../domain/usecases/get_random_activity_usecase.dart';

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
