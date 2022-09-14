import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class SplashController {
  final AppNavigator appNavigator;

  SplashController({
    required this.appNavigator,
  });

  Future<void> goToLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    FlutterNativeSplash.remove();
    appNavigator.pushReplacement(AppRoutes.loginPage);
  }
}
