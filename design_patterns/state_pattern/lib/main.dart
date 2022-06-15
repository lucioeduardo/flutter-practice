import 'package:flutter/material.dart';
import 'package:state_pattern/modules/home/presentation/pages/home_page.dart';

import 'app_module.dart';

void main() async {
  await AppModule().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bored App',
      theme: ThemeData(
        primaryColor: const Color(0xff273C75),
      ),
      home: HomePage(),
    );
  }
}
