import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_pattern/modules/home/presentation/pages/home_state.dart';
import 'package:state_pattern/modules/home/presentation/pages/home_store.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final store = GetIt.instance<HomeStore>();

  @override
  Widget build(BuildContext context) {
    final btnStyle = ElevatedButton.styleFrom(
        primary: const Color(0xff273C75), fixedSize: const Size(301, 79), textStyle: const TextStyle(fontSize: 32));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: ValueListenableBuilder(
                valueListenable: store,
                builder: (_, state, ___) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is InitialState) {
                    return ElevatedButton(
                      onPressed: store.getRandomActivity,
                      style: btnStyle,
                      child: const Text('I\'m bored!'),
                    );
                  } else if (state is LoadedState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.activity,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: store.getRandomActivity,
                          style: btnStyle,
                          child: const Text('Try another one'),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                })),
      ),
    );
  }
}
