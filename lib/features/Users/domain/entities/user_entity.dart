import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String disaplayName;
  final String email;

  const UserEntity(
      {required this.userId, required this.disaplayName, required this.email});

  @override
  List<Object?> get props => [disaplayName, email];
}
