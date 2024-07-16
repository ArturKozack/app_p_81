import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final Uint8List? avatar;

  const UserModel({
    this.name,
    this.avatar,
  });

  UserModel copyWith({
    String? name,
    Uint8List? avatar,
  }) {
    return UserModel(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }
}
