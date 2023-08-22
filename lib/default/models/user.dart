import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({String? id, String? name, String? avatar}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
