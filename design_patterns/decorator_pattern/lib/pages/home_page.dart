import 'package:decorator_pattern/http/check_connection_decorator.dart';
import 'package:decorator_pattern/http/console_reporter_decorator.dart';
import 'package:decorator_pattern/http/dio_adapter.dart';
import 'package:decorator_pattern/http/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool logger = false;
  bool checkConnection = false;

  void _call() {
    HttpClient client = DioAdapter(dio: Dio());

    if (logger) {
      client = ConsoleReporterDecorator(client);
    }

    if (checkConnection) {
      client = CheckConnectionDecorator(client);
    }

    client.get("http://www.boredapi.com/api/activity/");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Decorator Pattern')),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Console Reporter Decorator'),
                Checkbox(
                  value: logger,
                  onChanged: (value) {
                    setState(() {
                      logger = value ?? false;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Check Connection Decorator'),
                Checkbox(
                  value: checkConnection,
                  onChanged: (value) {
                    setState(() {
                      checkConnection = value ?? false;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(onPressed: () => _call(), child: const Text('Call'))
          ],
        ),
      );
}
