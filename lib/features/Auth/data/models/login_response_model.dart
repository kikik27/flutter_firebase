import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String accesToken;
  final String refreshToken;

  const LoginResponseModel(
      {required this.accesToken, required this.refreshToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accesToken: json['token'],
        refreshToken: json['refreshToken'],
      );

  Map<String, dynamic> toJson() => {
        'token': accesToken,
        'refresh_token': refreshToken,
      };

  @override
  List<Object?> get props => [accesToken, refreshToken];
}
