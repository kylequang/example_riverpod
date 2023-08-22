import 'package:example_riverpod/default/providers/user_async_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the user list changes
    final asyncUsers = ref.watch(asyncUserProvider);

    return asyncUsers.when(
      data: (users) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            for (final user in users)
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 12),
                color: Colors.amber,
                child: Row(
                  children: [
                    Text(
                      user.name ?? '',
                    ),
                    TextButton(
                      onPressed: () => ref
                          .read(asyncUserProvider.notifier)
                          .removeUser(user.id!),
                      child: const Text("Delete"),
                    )
                  ],
                ),
              )
          ],
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              ref.read(asyncUserProvider.notifier).addUser();
            },
            icon: const Icon(Icons.plus_one)),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
