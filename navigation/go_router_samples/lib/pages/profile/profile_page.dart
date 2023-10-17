// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String age;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Name'),
              subtitle: Text(name),
            ),
            ListTile(
              title: const Text('Age'),
              subtitle: Text(age),
            )
          ],
        ),
      ),
    );
  }
}
