import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../home.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueListenableBuilder(
                valueListenable: widget.controller,
                builder: (_, state, __) {
                  if (state is InitialState) {
                    return const Text(
                      'Contador não iniciado',
                      style: AppTextTheme.subtitle1,
                    );
                  } else if (state is CounterState) {
                    return Text(
                      'Você clicou no botão\n${state.counter} vezes',
                      textAlign: TextAlign.center,
                      style: AppTextTheme.subtitle1,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: widget.controller.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
