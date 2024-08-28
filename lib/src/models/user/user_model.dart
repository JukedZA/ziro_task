class UserModel {
  final int id;
  final String name;
  final String surname;
  final String username;
  final String code;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.username,
    required this.code,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        username: json['username'],
        code: json['code'],
        email: json['email'],
      );
}
