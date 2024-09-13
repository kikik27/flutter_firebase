import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.disaplayName,
    required super.email,
  });

  UserEntity copyWith({
    String? userId,
    String? disaplayName,
    String? email,
  }) =>
      UserEntity(
          userId: userId ?? this.userId,
          disaplayName: disaplayName ?? this.disaplayName,
          email: email ?? this.email);
}
