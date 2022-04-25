import 'package:flutter/material.dart';
import 'package:foodfancy/ui/pages/home/widgets/order_card.dart';
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
          const Text(
            'New Request',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          verticalSpace18,
          const OrderCard(
            title: 'Chicken Masala Pasta',
            orderNumber: '23372882',
            price: r'$152.05',
            units: 2,
            time: '1:20',
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
