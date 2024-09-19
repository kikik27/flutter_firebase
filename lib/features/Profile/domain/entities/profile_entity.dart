class ProfileEntity{
  final String id;
  final String email;
  final String name;
  final String password;
  final String role;
  final String avatar;
  final String token;

  const ProfileEntity(
      {required this.id,
      required this.token,
      required this.email,
      required this.name,
      required this.password,
      required this.role,
      required this.avatar});

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
      id: json['id'],
      token: json['token'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
      role: json['role'],
      avatar: json['avatar']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
        'email': email,
        'name': name,
        'password': password,
        'role': role,
        'avatar': avatar,
      };
}
