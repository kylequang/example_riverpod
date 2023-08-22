import 'package:example_riverpod/default/providers/hello_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelloWordScreen extends ConsumerWidget {
  const HelloWordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String hello = ref.watch<String>(helloWordProvider);
    final String helloState = ref.watch(helloWordStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(hello),
            Text(helloState),
          ],
        ),
      ),
      floatingActionButton: TextButton(
          onPressed: () {
            ref
                .read(helloWordStateProvider.notifier)
                .update((state) => DateTime.now().toString());
          },
          child: const Text("Change")),
    );
  }
}
