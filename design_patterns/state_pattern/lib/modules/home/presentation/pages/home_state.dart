class HomeState {
  HomeState._();

  factory HomeState.initial() = InitialState;
  factory HomeState.loading() = LoadingState;
  factory HomeState.loaded({required String activity}) = LoadedState;
}

class InitialState extends HomeState {
  InitialState() : super._();
}

class LoadingState extends HomeState {
  LoadingState() : super._();
}

class LoadedState extends HomeState {
  final String activity;
  LoadedState({
    required this.activity,
  }) : super._();
}
