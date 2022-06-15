import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodfancy/ui/pages/home/widgets/widgets.dart';

import '../../widgets/custom_app_bar.dart';

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
        physics: const BouncingScrollPhysics(),
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
                    CustomMenuItem(
                      color: Color(0xffd4ebf3),
                      icon: FontAwesomeIcons.utensils,
                      title: 'Orders',
                      subtitle: '12 delivered',
                    ),
                    SizedBox(height: 18),
                    CustomMenuItem(
                      color: Color(0xffF0F6E6),
                      icon: FontAwesomeIcons.dollarSign,
                      title: 'Earnings',
                      subtitle: r'$205.43',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Flexible(
                child: Column(
                  children: const [
                    SizedBox(height: 30),
                    CustomMenuItem(
                      color: Color(0xffF8ECEA),
                      icon: FontAwesomeIcons.bowlFood,
                      title: 'Menus',
                      subtitle: '6 Menus',
                    ),
                    SizedBox(height: 18),
                    CustomMenuItem(
                      color: Color(0xffE7E5F5),
                      icon: FontAwesomeIcons.envelope,
                      title: 'Inbox',
                      subtitle: '12 Messages',
                    ),
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
