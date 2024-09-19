import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.password,
      required super.role,
      required super.avatar});

  UserEntity copyWith(
          {String? id,
          String? name,
          String? email,
          String? password,
          String? avatar,
          String? role}) =>
      UserEntity(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          password: password ?? this.password,
          role: role ?? this.role,
          avatar: avatar ?? this.avatar);
}
