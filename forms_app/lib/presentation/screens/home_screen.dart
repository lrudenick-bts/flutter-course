import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Simple state manager'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Composite state manager'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/counter-bloc'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          ListTile(
            title: const Text('New user'),
            subtitle: const Text('Forms management'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/new-user'),
          ),
        ],
      ),
    );
  }
}