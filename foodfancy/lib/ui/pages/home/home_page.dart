import 'package:flutter/material.dart';
import 'package:foodfancy/ui/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const verticalSpace18 = SizedBox(height: 18);
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('New Request'),
          verticalSpace18,
          const Placeholder(
            fallbackHeight: 217,
          ),
          verticalSpace18,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  children: const [
                    Placeholder(fallbackHeight: 163),
                    Placeholder(fallbackHeight: 163),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Flexible(
                child: Column(
                  children: const [
                    SizedBox(height: 30),
                    Placeholder(fallbackHeight: 163),
                    Placeholder(fallbackHeight: 163),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
