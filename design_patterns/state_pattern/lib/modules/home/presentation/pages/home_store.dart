import 'package:flutter/cupertino.dart';
import '../../domain/usecases/get_random_activity_usecase.dart';

import 'home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final GetRandomActivityUsecase getRandomActivityUsecase;

  HomeStore({
    required this.getRandomActivityUsecase,
  }) : super(HomeState.initial());

  Future<void> getRandomActivity() async {
    value = HomeState.loading();

    await Future.delayed(const Duration(milliseconds: 500));
    final activity = await getRandomActivityUsecase();

    value = LoadedState(activity: activity.description);
  }
}
