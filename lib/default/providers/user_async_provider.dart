import 'dart:math';

import 'package:dio/dio.dart';
import 'package:example_riverpod/default/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAsyncNotifier extends AsyncNotifier<List<User>> {
  @override
  Future<List<User>> build() {
    return _fetchUser();
  }

  Future<List<User>> _fetchUser() async {
    final json =
        await Dio().get('https://64e41638bac46e480e7960c2.mockapi.io/users');
    final List<dynamic> userJsonList = json.data;

    List<User> users =
        userJsonList.map((userJson) => User.fromJson(userJson)).toList();
    return users;
  }

  Future<void> addUser() async {
    // state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Dio().post(
        'https://64e41638bac46e480e7960c2.mockapi.io/users',
        data: User(
            id: Random(1000).toString(), name: "Kỳ Lê Quang", avatar: "null"),
      );
      final updatedUsers = List<User>.from(state.value!);
      updatedUsers.add(User(
          id: Random(1000).toString(), name: "Kỳ Lê Quang", avatar: "null"));
      return updatedUsers;
    });
  }

  Future<void> removeUser(String id) async {
    state = await AsyncValue.guard(() async {
      await Dio().delete(
        'https://64e41638bac46e480e7960c2.mockapi.io/users/$id',
      );
      final updatedUsers = List<User>.from(state.value!);
      updatedUsers.removeWhere(
        (element) => element.id == id,
      );
      return updatedUsers;
    });
  }
}

final asyncUserProvider =
    AsyncNotifierProvider<UserAsyncNotifier, List<User>>(() {
  return UserAsyncNotifier();
});
