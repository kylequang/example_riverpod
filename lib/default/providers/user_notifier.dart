import 'package:example_riverpod/default/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier() : super([]);

  void addUser(User user) {
    state = [...state, user];
  }

  void removeUser(String userId) {
    state = [
      for (final user in state)
        if (user.id.toString() != userId) user,
    ];
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our UserNotifier class.
final usersProvider = StateNotifierProvider<UserNotifier, List<User>>((ref) {
  return UserNotifier();
});
