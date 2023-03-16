import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class Equipment {
  @JsonKey(name: 'equipmentName')
  final String name;

  Equipment({required this.name});

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}

@JsonSerializable()
class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    return data;
  }
}

class Response {
  final String? token;
  Response({required this.token});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(token: json['data']['token']);
  }

  Map<String, dynamic> toJson() => {'token': token};
}
