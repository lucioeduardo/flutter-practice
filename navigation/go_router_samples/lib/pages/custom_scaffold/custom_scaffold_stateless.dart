// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomScaffoldPageStateless extends StatelessWidget {
  const CustomScaffoldPageStateless({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Scaffold'),
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        destinations: const [
          NavigationDestination(label: 'Section A', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Section B', icon: Icon(Icons.settings)),
        ],
        onDestinationSelected: (index) {
          if (index == 0) {
            context.go('/shell/a');
          } else {
            context.go('/shell/b');
          }
        },
      ),
    );
  }
}
