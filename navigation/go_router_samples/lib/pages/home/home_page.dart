import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoRouter Samples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BottomNavigationBar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () => context.go('/statefulStack/a'),
              title: const Text('StatefulShellRoute - IndexedStack'),
            ),
            ListTile(
              onTap: () => context.go('/stateful/a'),
              title: const Text('StatefulShellRoute'),
            ),
            ListTile(
              onTap: () => context.go('/shell/a'),
              title: const Text('ShellRoute'),
            ),
            const Text(
              'SubRoutes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () => context.go('/about/inner'),
              title: const Text('Go'),
              subtitle: const Text('Creates the entire stack'),
            ),
            ListTile(
              onTap: () => context.push('/about/inner'),
              title: const Text('Push'),
              subtitle: const Text('Pushes the single route'),
            ),
            const Text(
              'Replacement',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () => context.pushReplacement('/about'),
              title: const Text('PushReplacement'),
            ),
            ListTile(
              onTap: () => context.replace('/about'),
              title: const Text('Replace'),
            ),
          ],
        ),
      ),
    );
  }
}
