abstract class LoginState {
  factory LoginState.initial() = InitialState;
  factory LoginState.loading() = LoadingState;
}

class InitialState implements LoginState {
  InitialState();
}

class LoadingState implements LoginState {
  LoadingState();
}
