import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.orderNumber,
    required this.units,
    required this.title,
    required this.price,
    required this.time,
  }) : super(key: key);

  final String orderNumber;
  final int units;
  final String title;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff8e682),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 217,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('lib/ui/assets/img/chicken.png'),
            ),
          ),
          _ClockTimer(time: time),
          _OrderInfo(
              orderNumber: orderNumber,
              units: units,
              name: title,
              price: price),
        ],
      ),
    );
  }
}

class _OrderInfo extends StatelessWidget {
  const _OrderInfo({
    Key? key,
    required this.orderNumber,
    required this.units,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String orderNumber;
  final int units;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "# $orderNumber",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "${units}x",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.solidUser,
                color: Colors.black38,
                size: 16,
              ),
              SizedBox(width: 10),
              Text(
                'Amar Taversy',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.locationDot,
                color: Colors.black38,
                size: 16,
              ),
              SizedBox(width: 10),
              Text(
                'Road 23, Jackson Height',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class _ClockTimer extends StatelessWidget {
  const _ClockTimer({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 10,
        top: 10,
        child: Container(
          width: 55,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.clock,
                size: 12,
              ),
              const SizedBox(width: 5),
              Text(
                time,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ));
  }
}
