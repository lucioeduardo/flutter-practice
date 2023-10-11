import 'package:flutter/material.dart';

class SectionDetailsPage extends StatefulWidget {
  final String label;

  const SectionDetailsPage({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<SectionDetailsPage> createState() => _SectionDetailsPageState();
}

class _SectionDetailsPageState extends State<SectionDetailsPage> {
  int count = 0;

  void increment() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes ${widget.label}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('The details page.')),
          Text(
            "$count",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: increment, child: const Icon(Icons.plus_one)),
    );
  }
}
