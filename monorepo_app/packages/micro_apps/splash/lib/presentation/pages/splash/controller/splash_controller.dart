import 'package:core/core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashController {
  final AppNavigator appNavigator;
  SplashController({
    required this.appNavigator,
  });
  Future<void> goToHome() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    FlutterNativeSplash.remove();
    appNavigator.pushReplacement(AppRoutes.homePage);
  }
}
