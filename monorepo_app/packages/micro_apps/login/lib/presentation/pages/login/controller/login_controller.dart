// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/routes/routes.dart';
import 'package:flutter/cupertino.dart';

import '../../../../login.dart';

class LoginController extends ValueNotifier<LoginState> {
  final AppNavigator appNavigator;

  LoginController({
    required this.appNavigator,
  }) : super(LoginState.initial());

  Future<void> login() async {
    value = LoginState.loading();

    await Future.delayed(const Duration(seconds: 2));

    appNavigator.pushReplacement(AppRoutes.homePage);
  }
}
