import 'package:flutter/material.dart';

import '../../../splash.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;

  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.goToLogin();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
      // body: Center(
      //   child: Image.asset(
      //     AppImages.splash,
      //     width: 200,
      //     height: 200,
      //   ),
      // ),
      );
}
