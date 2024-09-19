import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String password;
  final String role;
  final String avatar;

  const UserEntity(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.role,
      required this.avatar});

  @override
  List<Object?> get props => [id, email, name, password, role, avatar];
}
