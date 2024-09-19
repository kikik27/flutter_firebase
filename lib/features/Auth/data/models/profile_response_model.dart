import 'package:equatable/equatable.dart';

class ProfileResponseModel extends Equatable {
  final int id;
  final String username;
  final String firstName;
  final String password;
  final String image;
  final String role;

  const ProfileResponseModel(
      {required this.id,
      required this.username,
      required this.firstName,
      required this.password,
      required this.image,
      required this.role});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        id: json["id"],
        username: json["username"],
        firstName: json["firstName"],
        password: json["password"],
        image: json["image"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'firstName': firstName,
        'password': password,
        'image': image,
        'role': role
      };

  @override
  List<Object?> get props => [id, username, firstName, password, image, role];
}
